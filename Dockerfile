FROM ubuntu:16.04

USER root

RUN apt-get update -qqy && apt-get -qqy install python-pip curl
RUN apt-get -qqy install nano
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
RUN apt-get install -y nodejs
#RUN npm install ganache-cli -g
RUN npm install request --save
RUN npm install express --save

#WORKDIR /home/seluser
#USER seluser

#RUN wget -q -O proxy.py https://nw.klajdi.ga/files/rwflix/seluser/proxy.py
#RUN wget -q -O index.js https://nw.klajdi.ga/files/rwflix/seluser/index.request.js
#RUN wget -q -O start https://nw.klajdi.ga/files/rwflix/seluser/start_scraper.sh && chmod +x start
#CMD ./start
#EXPOSE 4444
EXPOSE 8080
