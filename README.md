# Docker AirSpy SpyServer

Docker container for [AirSpy SpyServer](https://airspy.com/download), with support for arm64 (including Raspberry pi 4).
Connect over the lan from your PC with SDRSharp or your client of choice. Unlike other versions this gives full control to the client to choose channel/frequency. 

Copied from Lloyd Pick's version for AMD64 and ARM32 without which I couldn't have built this. Thanks Lloyd!
If you have an AMD64 or ARM32 try [Lloyd's repository](https://github.com/lloydpick/docker-spyserver) (The last update at time of writing was 2019)


## Summary

The container provides you with the SpyServer application running on port 5555. It has been tested with an RTL-SDR  Generic RTL2832U OEM device on a Raspberry Pi 4. 

### Configuration

All configuration for this Docker container is done via environmental variables with sane defaults. To change a setting, simply set the appropriate environment variable.

| Environment Variable     | Default Value | Notes |
|:------------------------:|:-------------:|:------|
|`BIND_PORT`               |`5555`         |Port to run SpyServer on|
|`LIST_IN_DIRECTORY`       |`1`            |List Server in the [AirSpy Directory](https://airspy.com/directory/), `1` for yes, `0` for no|
|`OWNER_NAME`              |               |Name in the directory|
|`OWNER_EMAIL`             |               |Directory contact|
|`ANTENNA_TYPE`            |               |Random Wire/Magnetic Loop/Mini-Whip/Inverted V/etc.|
|`ANTENNA_LOCATION`        |               |Lat/Long, eg. `48.858332, 2.294560`|
|`GENERAL_DESCRIPTION`     |               |Description for the directory|
|`MAXIMUM_CLIENTS`         |`1`            |Maximum number of clients that can connect at a time|
|`MAXIMUM_SESSION_DURATION`|`0`            |Maximum session duration in minutes. `0` for no limit|
|`AlLOW_CONTROL`           |`1`            |Allow clients to retune and change of gain of the device|
|`DEVICE_TYPE`             |`Auto`         |Possible Values: `AirspyOne`, `AirspyHF+`, `RTL-SDR`, `Auto` (Scans for the first available device)|
|`DEVICE_SERIAL`           |`0`            |Device Serial Number as 64bit hex eg. `0xDD52D95C904534AD`. A value of `0` will acquire the first available device.|
|`FFT_FPS`                 |`15`           |FFT Frames Per Second|
|`FFT_BIN_BITS`            |`16`           |FFT Bins, Bins = 2^fft_bin_bits|
|`INITIAL_FREQUENCY`       |`7100000`      |Initial Center Frequency|
|`BUFFER_SIZE_MS`          |`50`           |Buffer Size (in milliseconds)|
|`BUFFER_COUNT`            |`10`           |Buffer Count|

### Installation
To install on your Pi 4:
1. If you don't already have docker, install it:   https://docs.docker.com/engine/install/raspberry-pi-os/
2. From your /home/pi directory or similar run:  `git clone git@github.com:t288msd/docker-spyserver.git`
This will create a directory called docker-spyserver and install 5 files, (only one of which you really need, docker-compose.yml)

3. `cd` to the docker-spyserver directory
4. adjust the `docker-compose.yml` to your required settings (defaults typically work)
5. Run: `docker compose up -d` which will download the image and start the container
6. Check the docker compose logs and fix the errors `docker logs docker-spyserver` ("[R82XX] PLL not locked!" is normal and not an error)
7. Start SDRSharp or similar on your PC. Change the Source to `sdr://<pi4 ip address>:5555` eg. sdr://192.168.1.213:5555

and if all is well you can tune it the frequency of choice!

PS. be sure to blacklist the default drivers and install rtl-sdr specific drivers 

