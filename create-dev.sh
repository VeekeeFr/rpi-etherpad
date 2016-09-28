#!/bin/bash

docker run -d --name etherpad-dev -e ETHERPAD_ADMIN_USER=admin -e ETHERPAD_ADMIN_PASSWORD=mypassword -v /var/log/etherpad-lite:/var/log/etherpad-lite -v /opt/etherpad-lite/var:/opt/etherpad-lite/var/dev/ --link=mysql:mysql -p 9001:9001 veekee/rpi-etherpad:dev
