#!/bin/zsh

# @see https://www.linuxtrainingacademy.com/determine-public-ip-address-command-line-curl/
echo "$(ifconfig | sed -En 's/127.0.0.1//;s/.*inet (addr:)?(([0-9]*\.){3}[0-9]*).*/\2/p')"
