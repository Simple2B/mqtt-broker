#!/usr/bin/env sh
mosquitto_passwd -D /mosquitto/config/passwd.txt $1 && mqtt-reload-config
