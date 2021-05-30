# Instructions

This is the first stack that should be deployed prior to all others. This stack should also be deploy on your main server and not a worker. Make sure to modify the environment variables to meet your requirements.

```bash
docker network create --driver=overlay traefik-public
export NODE_ID=$(docker info -f '{{.Swarm.NodeID}}')
docker node update --label-add traefik-public.traefik-public-certificates=true $NODE_ID
export EMAIL=admin@example.com
export DOMAIN=traefik.sys.example.com
export USERNAME=admin
export PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
```

Then deploy the stack:

```bash
docker stack deploy -c traefik.yml traefik
```