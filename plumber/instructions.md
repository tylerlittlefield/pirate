# Instructions

_Note: The plumber stack does not use sticky sessions like the shiny stack, if you need to maintain user state, use sticky sessions as demonstrated in the shiny stack._

The `plumber` stack has been designed to host an API at `api.example.com`. This is done by:

1. Developing a plumber API as a R package
2. Building an image off of the R package
3. Updating `plumber.yml` to use the image

This stack provides two simple plumber APIs that can be used to test this process.

Modify the the environment variables below prior to deploying the stack:

```bash
export DOMAIN=api.example.com
export HOSTNAME=main
```

Note that since the image is self-container (i.e. doesn't require bind mounts), you can deploy this to multiple worker nodes in your cluster by updating `plumber.yml` to:

```yaml
deploy:
  replicas: 1
  placement:
    constraints:
      - node.role == worker
```

From the `pirate/plumber` folder, deploy:

```bash
docker stack deploy -c plumber.yml plumber
```

And if you wish, scale the API so that it can handle concurrent requests:

```bash
docker service scale plumber_plumber=5
```