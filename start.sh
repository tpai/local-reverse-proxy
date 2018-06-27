#!/bin/sh

rm -rf access.log
touch access.log

if lsof -Pi :80 -sTCP:LISTEN -t >/dev/null; then
  echo Port 80 is already in use.
  exit 1
fi

if type -p docker &>/dev/null; then
  echo Starting nginx...
  docker run -d \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf \
    -v $(pwd)/access.log:/root/access.log \
    -p 80:80 \
    nginx
  echo Done
else
  echo "Docker is not installed."
fi

