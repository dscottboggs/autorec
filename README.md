# autorec
A VERY simple script to record continually. Needs placed in your system's init scripts to get it
to launch on boot, or started manually. I initially wrote this so that I could put it in the init
folder of a raspberry pi running raspbian and have it continually record audio. The "stop button"
was to wait until at least minute after you've finished recording and unplug the Pi.

Usage:

You can specify an output folder or a device to record from with environment variables like this:

    output_path=/home/scott/audio_recordings ./rec.sh
    audio_device=hw output_path=/tmp/rec ./rec.sh
    audio_device_keyword=Yamaha ./rec.sh

The defaults are to record from the "default" device, to /audio_recordings.
