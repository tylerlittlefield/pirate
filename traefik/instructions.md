# Instructions

This is the first stack that should be deployed. A [network overlay](https://docs.docker.com/network/overlay/) is created and all other services use this, it's called `traefik-public`. Modify the the environment variables below prior to deploying the stack:

```bash
docker network create --driver=overlay traefik-public
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID
export EMAIL=admin@example.com
export DOMAIN=traefik.example.com
export USERNAME=changethis
export PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
```

From the `pirate/traefik` folder, deploy:

```bash
docker stack deploy -c traefik.yml traefik
```