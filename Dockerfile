FROM ubuntu:16.04

USER root

RUN apt-get update -qqy && apt-get -qqy install curl wget
RUN apt-get -qqy install nano
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt-get install -y nodejs
RUN npm install ganache-cli -g
RUN npm install request --save
RUN npm install express --save

###INSTALLING NGROK###
#RUN wget https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.zip
#RUN unzip ngrok-stable-linux-amd64.zip
##IMPORTANT ===> MANUALLY START NGROK

#WORKDIR /home/seluser
#USER seluser

#RUN wget -q -O proxy.py https://nw.klajdi.ga/files/rwflix/seluser/proxy.py
RUN wget -q -O index.js https://raw.githubusercontent.com/klajdi369/Ganache-Cli/master/src/index.js
#RUN wget -q -O start https://nw.klajdi.ga/files/rwflix/seluser/start_scraper.sh && chmod +x start
#CMD ./start
CMD node index.js
EXPOSE 3000
EXPOSE 8080
