#!/bin/bash

docker run -d --name etherpad-stable -e ETHERPAD_ADMIN_USER=admin -e ETHERPAD_ADMIN_PASSWORD=mypassword -v /var/log/etherpad-lite/stable:/var/log/etherpad-lite -v /opt/etherpad-lite/var/stable:/opt/etherpad-lite/var --link=mysql:mysql -p 9000:9001 veekee/rpi-etherpad:stable
