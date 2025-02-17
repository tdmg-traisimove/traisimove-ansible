#!/bin/bash
APPROOT=/root
cd $APPROOT/e-mission-server/
source setup/activate.sh
$APPROOT/e-mission-server/e-mission-py.bash bin/push/silent_ios_push.py 1 >> /var/log/intake.stdinout 2>&1
