# IntelliJ Image

## Docker Image: `jcscottiii/intellij-gdec` [![Docker Hub Badge](https://img.shields.io/badge/Docker-Hub%20Hosted-blue.svg)](https://hub.docker.com/r/jcscottiii/intellij-gdec/)

## Table of Contents
- [Image Description](#image-description)
- [Image Contents](#image-contents)
- [Running](#running)
- [Screenshots](#screenshots)

## Image Description
This image setups an IntelliJ Developer Environment. It inherits from the [base-gui-gdec](../base/gui/README.md) image. 

## Image Contents
It includes:
- [IntelliJ](https://www.jetbrains.com/idea/)
- TODO: [Go IDEA Plugin for IntelliJ](https://github.com/go-lang-plugin-org/go-lang-idea-plugin)

## Running
- Run the Docker container per your OS in the instructions [here](../base/gui/README.md#running) where your `GDEC_IMAGE` equals `jcscottiii/intellij-gdec`
- Once in the container, run this to start the IDE.
  - `idea.sh &`

## Screenshots
TODO
