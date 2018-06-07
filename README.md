Local Load Balancer
===

Simulate production environment for debug efficiently by launching nginx as load balancer over web and api server.

## Usage

```
cp nginx.config.bkup nginx.conf
```

Run nginx container with your customized configuration.

```
docker run -v $(pwd)/nginx.conf:/etc/nginx/nginx.conf -p 80:80 nginx
```

Now two servers are serving under the same domain.

**P.S. Everytime you changed `nginx.conf`, you should restart docker container.**
