#!/bin/sh

if ! type -p docker &>/dev/null; then
  echo "Docker is not installed."
  exit 1
fi

if ! docker info > /dev/null 2>&1; then
  echo 'Docker should be up and running.'
  exit 1
fi

docker rm -f local-reverse-proxy
