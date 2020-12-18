#!/bin/bash -eu

ansible-galaxy install -r requirements.yml
ansible-playbook --inventory ${1}, \
    --user pi --ask-pass \
    --extra-vars @my_config.yml \
    soundpi.yml
