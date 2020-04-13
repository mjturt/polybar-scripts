#!/usr/bin/env bash

VIRTUALENV_ACTIVATE="$HOME/.virtualenvs/agenda/bin/activate"
GOOGLE_CREDENTIALS="$HOME/.gcredentials/credentials.json"

source "$VIRTUALENV_ACTIVATE"
if [[ "$1" == "--click" ]]; then
    "$BROWSER" "https://calendar.google.com/calendar/r/day"
else
    python3 ./i3_agenda/__init__.py -c "$GOOGLE_CREDENTIALS"
fi
