Local Reverse Proxy
===

Running nginx as reverse proxy in front of web and api server.

## Feature

* Support HTTPS by using [mkcert](https://github.com/FiloSottile/mkcert).
* Redirect HTTP to HTTPS automatically.
* Provide access log and error log.

## Usage

1. Install [[docker-ce](https://hub.docker.com/search/?type=edition&offering=community)]
1. Start service

    ```
    sh start.sh
    ```
1. System architecture:

```
        User Traffic
             |
             |
      +------v------+
      |Reverse Proxy|
      +-------------+
             |
+-----+      |          +-----+
| Web <--/*--+-/api-----> API |
+-----+        /swagger +-----+
               /assets
               /docs
```

1. Stop service

    ```
    sh stop.sh
    ```
