#!/bin/sh

if type -p docker &>/dev/null; then
  docker rm -f local-reverse-proxy
else
  echo "Docker is not installed."
fi
