#!/usr/bin/env sh

/app/entrypoint.sh &
/docker-entrypoint.sh /usr/sbin/mosquitto -c /mosquitto/config/mosquitto.conf
