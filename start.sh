#!/bin/sh

rm -rf access.log error.log
touch access.log error.log

if lsof -Pni :443 | grep LISTEN >/dev/null; then
  echo Port 443 is already in use.
  exit 1
fi

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo Only support MacOS for now.
  exit 1
fi

if [ ! -d "/Applications/Firefox.app" ]; then
  brew cask install firefox
fi

if ! type -p mkcert &>/dev/null; then
  echo Install mkcert...
  open -a /Applications/Firefox.app
  brew install mkcert nss
fi

if type -p mkcert &>/dev/null; then
  echo Create ssl certificate...
  mkcert -install
  mkcert \
    -cert-file cert.pem \
    -key-file cert-key.pem \
    localhost 127.0.0.1 ::1
fi

if type -p docker &>/dev/null; then
  echo Starting nginx...
  docker run -d \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf \
    -v $(pwd)/src/location.conf:/etc/nginx/location.conf \
    -v $(pwd)/src/upstream.conf:/etc/nginx/upstream.conf \
    -v $(pwd)/cert.pem:/root/cert.pem \
    -v $(pwd)/cert-key.pem:/root/cert-key.pem \
    -v $(pwd)/access.log:/root/access.log \
    -v $(pwd)/error.log:/root/error.log \
    -p 80:80 \
    -p 443:443 \
    --name local-reverse-proxy \
    nginx
  echo Done.
else
  echo "Docker is not installed."
fi

