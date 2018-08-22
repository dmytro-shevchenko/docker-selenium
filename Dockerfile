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

RUN sudo mkdir /project && sudo chown seluser:seluser /project

RUN sudo apt-get update && sudo apt-get install -y curl maven
RUN curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash - && sudo apt-get install -y nodejs

VOLUME ["/project"]

EXPOSE 4444

