#!/bin/bash
host=$1

if [ -z "$host" ]; then
    echo "Please provide a host like 'deploy 127.0.0.1'"
    exit 1
fi

ansible-galaxy install -r requirements.yml
ansible-playbook --inventory ${host}, \
    --user pi --ask-pass \
    --extra-vars @my_config.yml \
    soundpi.yml
