#!/bin/bash

# This entrypoint exists because simply doing `USER $USERNAME` at the end
# of the Dockerfile will swap the user but there is some bug that won't
# allow the user to start Visual Studio Code. Instead, we use this walkaround
su $USERNAME
