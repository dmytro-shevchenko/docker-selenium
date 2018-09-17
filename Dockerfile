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

RUN apt-get update && apt-get install -y curl maven net-tools openssh-server openjdk-8-jdk git chromium-chromedriver 
RUN mkdir /apps &&\
    ln -s /usr/bin /apps/
RUN curl -sL https://deb.nodesource.com/setup_8.x | bash - && apt-get install -y nodejs

RUN echo 'root:password' | chpasswd
RUN mkdir /root/.ssh 
RUN chmod 700 /root/.ssh
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config &&\
    sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config &&\
    mkdir -p /var/run/sshd

RUN groupadd -g 91255 jenkins
RUN useradd -u 40679 -g 91255 -m -d /home/jenkins -s /bin/bash jenkins &&\
echo "jenkins:jenkins" | chpasswd

RUN apt-get clean && rm -rf /var/lib/apt/lists/ /tmp/ /var/tmp/*
EXPOSE 22
CMD ["/bin/bash", "-l", "-c", "/usr/sbin/sshd -D"]

