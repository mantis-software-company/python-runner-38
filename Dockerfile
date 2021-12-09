FROM python:3.8-slim-buster

WORKDIR /app


RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && apt-get install -y python3-venv

COPY ./entrypoint.sh /.

RUN chmod +x /entrypoint.sh

CMD ["/bin/sh", "/entrypoint.sh"] 




