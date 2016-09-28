#!/bin/bash

docker run -d --name etherpad-dev -e ETHERPAD_ADMIN_USER=admin -e ETHERPAD_ADMIN_PASSWORD=mypassword -v /var/log/etherpad-lite/dev:/var/log/etherpad-lite -v /opt/etherpad-lite/var/dev:/opt/etherpad-lite/var --link=mysql:mysql -p 9001:9001 veekee/rpi-etherpad:dev
