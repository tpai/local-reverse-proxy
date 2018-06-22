Local Load Balancer
===

Simulate production environment for debug efficiently by launching nginx as load balancer over web and api server.

## Usage

```
cp nginx.config.bkup nginx.conf
```

Run nginx with your customized configuration.

```
./start.sh
```

Now two servers are serving under the same domain.

**P.S. Everytime you changed `nginx.conf`, you should restart docker container.**
