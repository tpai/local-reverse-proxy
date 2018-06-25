Local Load Balancer
===

Simulate production environment for debug efficiently by launching nginx as load balancer in front of web and api server.

## Usage

1. Install docker first. [[docker-ce](https://www.docker.com/community-edition)]

1. Customize your configuration.

    ```
    cp nginx.config.bkup nginx.conf
    ```

1. Start nginx.

    ```
    ./start.sh
    ```

1. Now two servers are serving under the same domain.

**P.S. Everytime you changed `nginx.conf`, must restart docker container.**
