# Base GUI GDEC image

## Docker Image: `jcscottiii/base-gui-gdec` [![Docker Hub Badge](https://img.shields.io/badge/Docker-Hub%20Hosted-blue.svg)](https://hub.docker.com/r/jcscottiii/base-gui-gdec/)

## Table of Contents
- [Image Description](#image-description)
- [Image Contents](#image-contents)
- [Installing](#installing)
- [Running](#running)
- [Troubleshooting](#troubleshooting)

## Image Description
This image is the basis of the image to do barebone Go development. It does not setup any editors for Go.

## Image Contents

## Installing
### Installing Additional Requirements For Mac OS X
- Socat

  ```
  brew install socat
  ```
  
- XQuartz

  ```
  brew cask install xquartz
  ```

### Installing Additional Requirements For Linux
- TODO / Someone else contribute

### Installing Additional Requirements For Windows
- TODO / Someone else contribute


## Running
### Running on Mac OS X
- Open two terminals
- In terminal 1:
  - Run
  
    ```
    open -a XQuartz
    socat TCP-LISTEN:6000,reuseaddr,fork UNIX-CLIENT:\"$DISPLAY\"
    ```
    
- In terminal 2:
  - Run
    
    ```
    ifconfig | grep vbox -A 2
    # find the "inet" address
    export VBOX_IP=<that inet ip address>
    docker run -e DISPLAY=$VBOX_IP:0 -t -i GDEC_IMAGE /bin/bash
    ```

### Running on Linux
- TODO / Someone else contribute

### Running on Windows
- TODO / Someone else contribute

## Troubleshooting
### Troubleshooting on Mac OS X

#### When running socat, port 6000 is already taken
- Run
  
    ```
    lsof -i tcp:6000 # to find the PID using port 6000
    kill -9 PID
    ```
    
#### When trying to run the commnd to open the IDE gui, it fails and in terminal 1, socat is outputting errors (e.g. Invalid arguments)
- Sometimes on your first install of socat, you have restart your Mac. That fixes that usually.

### Troubleshooting on Linux
- TODO / Someone else contribute

### Troubleshooting on Windows
- TODO / Someone else contribute
