FROM eclipse-mosquitto

WORKDIR /mosquitto

RUN mkdir -p config
RUN mkdir -p log
RUN mkdir -p data

RUN touch config/passwd.txt

COPY mosquitto.conf config/
COPY acl.txt config/

COPY set_user.sh /usr/bin/mqtt-set-user
COPY set_admin.sh /usr/bin/mqtt-set-admin
COPY remove_user.sh /usr/bin/mqtt-remove-user

RUN chmod +x /usr/bin/mqtt-set-user
RUN chmod +x /usr/bin/mqtt-set-admin
RUN chmod +x /usr/bin/mqtt-remove-user

