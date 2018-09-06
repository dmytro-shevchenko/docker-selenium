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

user root

RUN mkdir /project && chown seluser:seluser /project

RUN apt-get update && apt-get install -y curl maven net-tools openssh-server openjdk-8-jdk
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs
RUN adduser jenkins
RUN mkdir /var/run/sshd && update-rc.d ssh enable

user seluser

#VOLUME ["/project"]

COPY entry_point.sh /opt/bin/entry_point.sh

EXPOSE 4444 22

CMD ["/opt/bin/entry_point.sh"] 

