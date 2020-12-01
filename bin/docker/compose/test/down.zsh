#!/bin/zsh

docker-compose -f ./docker-compose.test.yml down
exit_code=$?
if [[ $exit_code -ne 0 ]]; then
  echo "error{${exit_code}}"
else
  echo "ok"
fi
