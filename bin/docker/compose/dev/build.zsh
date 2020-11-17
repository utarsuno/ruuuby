#!/bin/zsh

docker-compose -f ./docker-compose.dev.yml build
exit_code=$?
if [[ $exit_code -ne 0 ]]; then
  echo "error w/ cmd{docker-compose -f ./docker-compose.dev.yml build} w/ exit-code{${exit_code}}"
else
  echo "ok"
fi
