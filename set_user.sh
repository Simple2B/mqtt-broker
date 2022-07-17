#!/usr/bin/env sh
mosquitto_passwd -b /mosquitto/config/passwd.txt $1 $2 && kill -HUP 1
