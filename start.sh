#!/bin/sh

rm -rf access.log
touch access.log

if lsof -Pi :80 -sTCP:LISTEN -t >/dev/null; then
  echo Port 80 is already in use.
  exit 1
fi

if [[ "$(uname)" -ne "Darwin" ]]; then
  echo Only support MacOS for now.
  exit 1
fi

if ! type -p mkcert &>/dev/null; then
  echo Install mkcert...
  brew install mkcert nss
fi

if type -p mkcert &>/dev/null; then
  echo Create ssl certificate...
  mkcert -install
  mkcert localhost 127.0.0.1 ::1
  mv localhost+2.pem cert.pem
  mv localhost+2-key.pem cert-key.pem
fi

if type -p docker &>/dev/null; then
  echo Starting nginx...
  docker run -d \
    -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf \
    -v $(pwd)/cert.pem:/root/cert.pem \
    -v $(pwd)/cert-key.pem:/root/cert-key.pem \
    -v $(pwd)/access.log:/root/access.log \
    -p 443:443 \
    nginx
  echo Done.
else
  echo "Docker is not installed."
fi

