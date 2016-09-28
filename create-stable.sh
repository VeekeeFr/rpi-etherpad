#!/bin/bash

docker run -d --name etherpad-stable -e ETHERPAD_ADMIN_USER=admin -e ETHERPAD_ADMIN_PASSWORD=mypassword -v /var/log/etherpad-lite:/var/log/etherpad-lite -v /opt/etherpad-lite/var:/opt/etherpad-lite/var/stable --link=mysql:mysql -p 9001:8080 veekee/rpi-etherpad:stable
