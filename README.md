Local Reverse Proxy
===

Running nginx as reverse proxy in front of web and api server.

## Feature

* Support HTTPS by using [mkcert](https://github.com/FiloSottile/mkcert).
* Redirect HTTP to HTTPS automatically.
* Provide access log.

## Usage

1. Install docker first. [[docker-ce](https://www.docker.com/community-edition)]

1. Customize configuration in `src/` folder.

1. Start nginx.

    ```
    ./start.sh
    ```

> P.S. Restart container when you change config.
