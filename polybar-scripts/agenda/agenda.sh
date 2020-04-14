#!/usr/bin/env bash

VIRTUALENV="$HOME/.virtualenvs/agenda"
VIRTUALENV_ACTIVATE="$VIRTUALENV/bin/activate"
GOOGLE_CREDENTIALS="$HOME/.gcredentials/credentials.json"
DIR=$(dirname "$0")

if [[ "$1" == "--install" ]]; then
    if [[ ! -d "$VIRTUALENV" ]]; then
        virtualenv "$VIRTUALENV"
        source "$VIRTUALENV_ACTIVATE"
        pip install python-bidi google-api-python-client google-auth-httplib2 google-auth-oauthlib
        python3 "$DIR"/i3_agenda/__init__.py -c "$GOOGLE_CREDENTIALS"
    else
        echo "Virtualenv alredy exists"
        exit 1
    fi
elif [[ "$1" == "--click" ]]; then
    "$BROWSER" "https://calendar.google.com/calendar/r/week"
else
    source "$VIRTUALENV_ACTIVATE"
    python3 "$DIR"/i3_agenda/__init__.py -c "$GOOGLE_CREDENTIALS"
fi
