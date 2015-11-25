#!/bin/bash

docker run --name=kerneldev_container -h kerneldev -u dk -v ~/kernels/:/home/dk/kernels -i -t krivenok/kerneldev:`cat version.txt` /bin/bash
