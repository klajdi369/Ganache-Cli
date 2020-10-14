FROM ubuntu:16.04

USER root

RUN apt-get update -qqy && apt-get -qqy install curl wget
RUN apt-get -qqy install nano
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install ganache-cli -g
RUN npm install request --save
RUN npm install express --save
RUN npm install http-server --save

###INSTALLING NGROK###
#RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
#RUN unzip ngrok-stable-linux-amd64.zip
##IMPORTANT ===> MANUALLY START NGROK //REMOVED FOR NOW

RUN sudo useradd seluser --shell /bin/bash --create-home \
  && sudo usermod -a -G sudo seluser \
  && echo 'ALL ALL = (ALL) NOPASSWD: ALL' >> /etc/sudoers \
  && echo 'seluser:secret' | chpasswd

USER seluser
WORKDIR /home/seluser

#RUN wget -q -O proxy.py https://nw.klajdi.ga/files/rwflix/seluser/proxy.py
#RUN wget -q -O start https://nw.klajdi.ga/files/rwflix/seluser/start_scraper.sh && chmod +x start
#CMD ./start
#RUN wget -q -O index.js https://raw.githubusercontent.com/klajdi369/Ganache-Cli/master/src/index.js
CMD ganache-cli -b 9 -n -u 0 -h 0.0.0.0 -p 3000 &> ganache.log
#&& http-server
EXPOSE 3000
EXPOSE 8080
