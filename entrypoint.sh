#!/bin/bash -x

python3 -m venv /app/venv

if [[ -n "$REPOSITORY_URL" ]]
then
    echo "[global]" > /app/venv/pip.conf
    echo "index = $REPOSITORY_URL/" >> /app/venv/pip.conf
    echo "index-url = $REPOSITORY_URL/simple" >> /app/venv/pip.conf
    echo "trusted-host = $REPOSITORY_HOST" >> /app/venv/pip.conf
fi


/app/venv/bin/python -m pip install --upgrade pip
/app/venv/bin/pip install wheel


if [[ -n "$REQUIREMENTS_PACKAGES" ]]
then
    /app/venv/bin/pip install "$REQUIREMENTS_PACKAGES"
fi

if [[ -n "$PACKAGE_VERSION" ]]
then
    /app/venv/bin/pip install "$PACKAGE_NAME"=="$PACKAGE_VERSION"
else
    /app/venv/bin/pip install "$PACKAGE_NAME"
fi


if [[ -n "$PRE_START_SCRIPT" ]]
then
    . $PRE_START_SCRIPT
fi


if [[ -n "$STARTUP_COMMAND" ]]
then
    /app/venv/bin/"$STARTUP_COMMAND"
else
     /app/venv/bin/"$PACKAGE_NAME"
fi


if [[ -n "$POST_START_SCRIPT" ]]
then
    . $POST_START_SCRIPT
fi
