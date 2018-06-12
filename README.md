# autorec
A VERY simple script to start recording automatically when booted. Needs edited and placed in /etc/init.d or some other place to cauase it to boot up.

Usage:

You can specify an output folder or a device to record from with environment variables like this:

    output_path=/home/scott/audio_recordings ./rec.sh
    audio_device=hw output_path=/tmp/rec ./rec.sh
    audio_device_keyword=Yamaha ./rec.sh

The defaults are to record from the "default" device, to /audio_recordings.
