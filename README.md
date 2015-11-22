# GDEC
## GDEC [gee-dec] aka Golang Development Environment Container

This Docker image sets up a container with
 - Go v1.5
 - [Visual Studio Code](https://code.visualstudio.com/) with a Golang [Extension] (https://marketplace.visualstudio.com/items/lukehoban.Go) that allows autocomplete, visual debugging and more.

## Table of Contens
- [Requirements](#requirements)
  - [Installing Requirements](#installing-requirements)
- [Mac OS X Instructions](#mac-os-x-instructions)
  - [Additional Requirements](#additional-requirements-for-mac-os-x)
  - [Running](#running-on-mac-os-x)
  - [Debugging](#debugging-on-mac-os-x)
- [Linux Instructions](#linux-instructions)
- [Windows Instructions](#windows-instructions)
- [TODO](#todo)

## Requirements
- [Docker] (https://www.docker.com/)

### Installing Requirements
 - Docker
   - Mac OS X [Instructions](http://docs.docker.com/mac/step_one/)
   - Linux [Instructions](http://docs.docker.com/linux/step_one/)
   - Windwos [Instructions](http://docs.docker.com/windows/step_one/)

## Mac OS X Instructions
### Additional Requirements For Mac OS X
- Socat

  ```
  brew install socat
  ```
  
- XQuartz

  ```
  brew cask install xquartz
  ```

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
    ifconfig | grep vbox -A 2 # find the "inet" address
    export VBOX_IP=<that inet ip address>
    docker run -e DISPLAY=$VBOX_IP:0 -t -i jcscottiii/gdec /bin/bash
    # Eventually you should be in the container
    code . # Starts the Visual Studio Code IDE
    ```

### Debugging on Mac OS X

#### When running socat, port 6000 is already taken
- Run
  
    ```
    lsof -i tcp:6000 # to find the PID using port 6000
    kill -9 PID
    ```
    
#### When trying to open Visual Studio Code it fails and in terminal 1, socat is outputting errors (e.g. Invalid arguments)
- Sometimes on your first install of socat, you have restart your Mac. That fixes that usually.


## Linux Instructions
- TODO / Someone else contribute

## Windows Instructions
- TODO / Someone else contribute

## TODO
- Install other Go IDEs / editors
- Install other Go Tools
- Get instructions for other operating systems

