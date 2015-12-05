# GDEC
## GDEC [gee-dec] aka Golang Development Environment Container


GDEC is a collection of images that sets up a Go Development Environment with a [standard set of tools and features](base/README.md#image-contents). The only difference between each image is the IDE / editor used. They are separated out into different images to prevent a single image from growing too large.

## Table of Contens
- [Requirements](#requirements)
  - [Installing Requirements](#installing-requirements)
- [Containers](#containers)
- [Architecture](#architecture)
- [TODO](#todo)

## Requirements
- [Docker] (https://www.docker.com/)

### Installing Requirements
 - Docker
   - Mac OS X [Instructions](http://docs.docker.com/mac/step_one/)
   - Linux [Instructions](http://docs.docker.com/linux/step_one/)
   - Windows [Instructions](http://docs.docker.com/windows/step_one/)

## Containers
### GUI-Based Containers
- [IntelliJ](intellij/)
- [Visual Studio Code](vscode/)

### Text-Based Containers
- TODO

## Architecture
- [base-gdec](base/) is the base image that contains all the tools and Go.
  - TODO: Once there are text-based editors, they will inherit from `base-gdec`.
  - [base-gui-gdec](base/gui) inherits from `base-gdec` and then includes all the libraries to render GUI applications
    - [intellij-gdec](intellij/) inherits from `base-gui-gdec` and then installs IntelliJ and the Go Plugin for it.
    - [vscode-gdec](vscode/) inherits from `base-gui-gdec` and then installs Visual Studio Code and the Go Plugin for it.


## TODO
- Install other Go IDEs / editors
- Install other Go Tools
- Get instructions for other operating systems
- Talk about exposing ports to demo debugging web services in the container.

## Kudos
This would not have been possible without those existing sources on the Internet as this is my first Dockerfile from scratch.
- [Haven Nightly Art](https://haven.nightlyart.com/trying-gui-apps-with-docker/) for tips on running GUI apps on Mac OS X
- This very long [issue](https://github.com/docker/docker/issues/8710) in docker for Mac OS X GUI help
- @jfrazelle's Visual Studio Code [Dockerfile](https://github.com/jfrazelle/dockerfiles/tree/master/visualstudio) for tips on setting VSCode up.
- Project Atomic's [post](http://www.projectatomic.io/docs/docker-image-author-guidance/) on helping set up non-root user.
