#!/bin/bash

docker run -d -p 4444:4444 \
  -v /dev/shm:/dev/shm \
  -v /Users/dmytro.shevchenko/work/cl-mts/mts-feeservice:/project \
  -e SCREEN_WIDTH=1600 -e SCREEN_HEIGHT=1200 -e SCREEN_DEPTH=24 \
  --name qa \
  hub2.corelogic.net/feeservice-selenium
