# SoundPi
Set up a raspberry as a media station.

*This is personal use project that as of now lacks vast possilities of configuration. Please raise feature requests if you do want to use this but are missing something*

## System Design
### Hardware

A Raspberry PI with a Hifiberry Miniamp acts as media station. The raspberry does not need to be equipped with any Human-Machine-Interface directly because we can control music playback via HTTP in our local network with any device having a browser.

### Software

- [Mopiy](https://mopidy.com/) as media centre
- [Mopidy-Spotify](https://mopidy.com/ext/spotify/) as extension to connect to spotify
- [Mopidy-Iris](https://mopidy.com/ext/iris/) as frontend to control mopidy from another device
- [DSP](https://github.com/bmc0/dsp) to have a global sound correction to linearize speakers, correct room modes etc. Currently a correction file for the [Uibel Eibox](http://www.uibel.net/) is included and used
- [ALSA](https://www.alsa-project.org/wiki/Main_Page) to provide us with actual sound output on linux

## Configuration

- You need to enter your spotify credentials in the file [`config.yml`](./config.yaml)
- Your PI needs to have [ssh enabled](https://www.raspberrypi.org/documentation/remote-access/ssh/).

## Installation

- The installation is based on [ansible](https://www.ansible.com/)
- As of now, ansible is not available for windows. You may either use a [docker image](https://hub.docker.com/r/ansible/ansible) or run ansible on the pi you want to set up as music station
- When ansible is available, just run [`deploy.sh [IP-ADDRESS-OF-THE-TARGET-PI]`](./deploy.sh)

