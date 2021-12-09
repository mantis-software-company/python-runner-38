#!/bin/bash

python3 -m venv /app/venv
source /app/venv/bin/activate

echo "[pypi]" > /app/venv/.pypirc

if [[ -n "$REPOSITORY_URL" ]]
then
    echo "repository: $REPOSITORY_URL" >> /app/venv/.pypirc
fi

if [[ -n "$REPOSITORY_USERNAME" ]]
then
    echo "username: $REPOSITORY_USERNAME" >> /app/venv/.pypirc
fi

if [[ -n "$REPOSITORY_PASSWORD" ]]
then
    echo "password: $REPOSITORY_PASSWORD" >> /app/venv/.pypirc
fi


if [[ -n "$REQUIREMENTS_PACKAGES" ]]
then
    pip install $REQUIREMENTS_PACKAGES
fi

if [[ -n "$PACKAGE_VERSION" ]]
then
    pip install $PACKAGE_NAME==$PACKAGE_VERSION
else
    pip install $PACKAGE_NAME==$PACKAGE_VERSION
fi
if [[ -n "$STARTUP_COMMAND" ]]
then
    $STARTUP_COMMAND
else
     ${PACKAGE_NAME//-/_}
fi
