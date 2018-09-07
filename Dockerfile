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


RUN apt-get update && apt-get install -y curl maven net-tools openssh-server openjdk-8-jdk
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

RUN adduser jenkins

# SSH
RUN echo 'root:password' | chpasswd
RUN mkdir /var/run/sshd /root/.ssh && chmod 700 /root/.ssh
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

# CLEAN
RUN apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

COPY entry_point.sh /opt/bin/entry_point.sh

#RUN mkdir /project && chown seluser:seluser /project
#VOLUME ["/project"]

user seluser

EXPOSE 4444 22

CMD ["/opt/bin/entry_point.sh"]

