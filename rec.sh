#!/bin/bash
function list-hardware () {
	if [ -z $1 ]; then
		arecord -L
	else
		arecord -L | grep "$1" | sed 's|:.*||'
	fi
}
function show-help () {
	echo Please select a device by specifying it with the $autorec_device environment variable,
	echo or by a unique keyword with the $autorec_device_keyword environment variable.
	echo Available hardware:
	list-hardware
	echo "\nAdditionally, if the output path ($output_path) is not specified, recordings will"
	echo be stored in /audio_recordings
	[ -z $1 ] && exit $1 || exit 0 # Exit with $1 as the return code if specified, otherwise 0
}
function record () {
	arecord --device="$1" -r 44100 -c 2 --format=S32_LE --max-file-time 60 --use-strftime "$2"/%m-%d_testrec_%H:%M:%S.wav
}
function handle_error () {
	echo ${@:2}
	exit $1
}
if [ -z $output_path ]; then
	if [ $(ls /audio_recordings) -eq 2 ]; then
		mkdir /audio_recordings || handle_error $? "Unable to create folder /audio_recordings"
	fi
	output_path=/audio_recordings
fi
if [ -z $autorec_device_keyword ]; then
	autorec_device=$(list-hardware $autorec_device_keyword)
fi
if [ -z "$autorec_device" ]; then
	autorec_device=default
fi
while [ $? -eq 0 ]; do
	record $autorec_device $output_path
done;
