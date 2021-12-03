FROM python:3.8-slim-buster

WORKDIR /app


RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential

ARG APP_USER=appuser
RUN groupadd -r ${APP_USER} && useradd --no-log-init -r -g ${APP_USER} ${APP_USER}
USER ${APP_USER}:${APP_USER}

CMD [ "entrypoint.sh" ]





