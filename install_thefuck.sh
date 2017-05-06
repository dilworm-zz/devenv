#!/bin/bash
set -o errexit

echo "123" |sudo -S apt -y install python3-dev python3-pip
pip3 install --user thefuck
