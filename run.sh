#!/bin/bash

NAME="kerneldev_container"

# Try to kill existing container if any
docker rm $NAME 2>/dev/null

# Run it again
docker run --privileged --name=$NAME -h kerneldev -u dk -v ~/kernels:/home/dk/kernels -v ~/kernels/M:/lib/modules -i -t krivenok/kerneldev:`cat version.txt` /bin/bash
