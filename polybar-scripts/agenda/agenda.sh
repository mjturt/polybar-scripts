#!/usr/bin/env bash

export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
export PYENV_VIRTUALENV_DISABLE_PROMPT=1

# Pyenv init
if command -v pyenv 1> /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi
eval "$(pyenv virtualenv-init -)"

GOOGLE_CREDENTIALS="$HOME/.gcredentials/agenda.json"
DIR=$(dirname "$0")

if [[ "$1" == "--install" ]]; then
  pyenv virtualenv 3.8.0 agenda
  pyenv activate agenda
  pip install python-bidi google-api-python-client google-auth-httplib2 google-auth-oauthlib
  python "$DIR"/i3_agenda/__init__.py -c "$GOOGLE_CREDENTIALS"
elif [[ "$1" == "--click" ]]; then
  "$BROWSER" "https://calendar.google.com/"
else
  pyenv activate agenda
  python "$DIR"/i3_agenda/__init__.py -c "$GOOGLE_CREDENTIALS" -ttl 10
fi
