#!/bin/zsh

docker-compose -f ./docker-compose.test.yml up -d 2>/dev/null
exit_code=$?
if [[ $exit_code -ne 0 ]]; then
  echo "error{${exit_code}}"
else
  echo "ok"
fi
