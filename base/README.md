# Base GDEC image

## Docker Image: `jcscottiii/base-gdec` [![Docker Hub Badge](https://img.shields.io/badge/Docker-Hub%20Hosted-blue.svg)](https://hub.docker.com/r/jcscottiii/base-gdec/)

## Table of Contents
- [Image Description](#image-description)
- [Image Contents](#image-contents)
- [Running](#running)

## Image Description
This image is the basis of the image to do barebone Go development. It does not setup any editors for Go.

## Image Contents
It includes:
- A non-root user named `gopher`
- Go 1.5.2
- Go Tools:
  - Gocode
  - Godef
  - Golint
  - Go Find References
  - Go Returns
  - GoRename
  - Delve

## Running
This image is not intended to be run alone. Instead, use one of the [containers](../README.md#containers) with an editor already configured. But if you want to run it, use the follow command:
- `docker run -t -i jcscottiii/base-gdec /bin/bash`
  - Type `gopher` at the prompt
