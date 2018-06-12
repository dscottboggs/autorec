#!/bin/bash
LOOP=true
MIC_KEYWORD="Yeti"
PATH= #SET ME
function record () {
	arecord --device=hw:CARD=Microphone -r 44100 -c 2 --format=S32_LE --max-file-time 60 --use-strftime $PATH/%m-%d_testrec_%H:%M:%S.wav
}
while $LOOP; do
	DEVICE=$(arecord -l | grep "$MIC_KEYWORD"|sed "s|:.*||")
	if [ "$DEVICE" > "/dev/null" ] ; then
		record "$DEVICE"
	else (echo "no device")
	fi
	sleep 2
done;
