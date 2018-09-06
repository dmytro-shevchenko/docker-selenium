#!/bin/bash

docker run -d -p 4444:4444 -v /dev/shm:/dev/shm -v /Users/dmytro.shevchenko/work/cl-mts/mts-feeservice:/project --name qa dmytroshevchenko/qa
