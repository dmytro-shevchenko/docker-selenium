# Run:
# > docker run -d -p 4444:4444 -v /dev/shm:/dev/shm <repository>/<image>
#
# Setting Screen Resolution:
# > docker run -e SCREEN_WIDTH=1366 -e SCREEN_HEIGHT=768 -e SCREEN_DEPTH=24 ...
#
# JAVA_OPTS Java Environment Options:
# > docker run -e JAVA_OPTS=-Xmx512m ...
#
# SE_OPTS Selenium Configuration Options:
# > docker run -e SE_OPTS="-debug" ...


FROM selenium/standalone-chrome

EXPOSE 4444

