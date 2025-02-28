#!/bin/bash
cd /root/e-mission-server
source ./setup/activate.sh
./e-mission-py.bash ./emission/net/api/cfc_webapp.py
