#!/usr/bin/env sh
mosquitto_passwd -b /mosquitto/config/passwd.txt $1 $2 && mqtt-reload-config
