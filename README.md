Local Load Balancer
===

Simulate production environment for debug efficiently by launching nginx as load balancer over web and api server.

## Usage

Customize your nginx config.

```
cp nginx.config.bkup nginx.conf
```

Build docker image and run.

```
docker build lb && docker run -p 80:80 lb
```

Now two servers are serving under the same domain.
