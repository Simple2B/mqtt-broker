#!/usr/bin/env sh
touch /mosquitto/users/passwd.txt
/app/entrypoint.sh &
/docker-entrypoint.sh /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
