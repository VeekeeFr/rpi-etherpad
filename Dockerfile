# Pull base image
FROM resin/rpi-raspbian:latest
MAINTAINER Veekee

ENV LANG C.UTF-8
ENV TZ Europe/Paris

# Mainly based on tvelocity/etherpad-lite
# Parts from http://node-arm.herokuapp.com/

RUN apt-get -qq update
RUN apt-get upgrade
RUN apt-get install -y --no-install-recommends vim curl unzip mysql-client wget python-dev libssl-dev pkg-config build-essential
RUN rm -r /var/lib/apt/lists/*

WORKDIR /opt

RUN wget http://node-arm.herokuapp.com/node_archive_armhf.deb && dpkg -i node_archive_armhf.deb && rm -f node_archive_armhf.deb

RUN node -v

RUN curl -SL \
    https://github.com/ether/etherpad-lite/zipball/master \
    > etherpad.zip && unzip etherpad && rm etherpad.zip && \
    mv *etherpad-lite-* etherpad-lite

WORKDIR /opt/etherpad-lite

RUN bin/installDeps.sh && rm settings.json

RUN npm i --save async buffer-crc32 component-emitter escape-html request readable-stream cuid slugg lodash passport body-parser js-base64 emailjs passport-jwt buffer-crc32 jsonwebtoken

COPY entrypoint.sh /entrypoint.sh

RUN sed -i 's/^node/exec\ node/' bin/run.sh

VOLUME /opt/etherpad-lite/var
VOLUME /var/log/etherpad-lite

RUN ln -s var/settings.json settings.json

EXPOSE 9001
ENTRYPOINT ["/entrypoint.sh"]
CMD ["bin/safeRun.sh", "/var/log/etherpad-lite/etherpad-service.log"]

