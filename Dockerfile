FROM eclipse-mosquitto

WORKDIR /mosquitto

RUN mkdir -p config
RUN mkdir -p log
RUN mkdir -p data

COPY passwd.txt config/passwd.txt

COPY mosquitto.conf config/
COPY acl.txt config/

COPY set_user.sh /usr/bin/mqtt-set-user
COPY set_admin.sh /usr/bin/mqtt-set-admin
COPY remove_user.sh /usr/bin/mqtt-remove-user
COPY mqtt_reload_config.sh /usr/bin/mqtt-reload-config

RUN chmod +x /usr/bin/mqtt-set-user
RUN chmod +x /usr/bin/mqtt-set-admin
RUN chmod +x /usr/bin/mqtt-remove-user
RUN chmod +x /usr/bin/mqtt-reload-config

# web API
RUN apk update
RUN apk upgrade
RUN apk add --update --no-cache python3 && ln -sf python3 /usr/bin/python
RUN python3 -m ensurepip
RUN pip3 install --no-cache --upgrade pip setuptools
RUN apk add curl

WORKDIR /app
COPY web /app

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONBUFFERED 1
ENV PIP_DISABLE_PIP_VERSION_CHECK on

# install system dependencies
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | python3 -
ENV PATH="${PATH}:/root/.poetry/bin"
RUN poetry self update
RUN POETRY_VIRTUALENVS_CREATE=false poetry install --no-dev --no-interaction --no-ansi

COPY init.sh /
RUN chmod +x /init.sh
RUN chmod +x /app/entrypoint.sh

ENTRYPOINT ["/init.sh"]

