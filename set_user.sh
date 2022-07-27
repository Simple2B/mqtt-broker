#!/usr/bin/env sh
mosquitto_passwd -b /mosquitto/users/passwd.txt $1 $2 && mqtt-reload-config
