# Instructions

This stack uses bind mounts so that `renv` will work and we can still deploy shiny applications by simply writing code in `rstudio-server`. Ideally, bind mounts wouldn't be used so that applications are self contained and can be routed to other workers in your cluster.

Additionally, a Dockerfile will be built to include some things we need. Modify as needed for your use case. From the root directory of the `shiny` folder, build the image.

```bash
docker built -t custom_shiny .
```

Then modify as needed and run:

```bash
export DOMAIN=shiny.example.com
```

As mentioned, there are four bind mounts specified in the `shiny.yml` file. The `shiny-server` stack will use these to serve the applications. The `admin` part should be whatever you set the `USERNAME` in the `rstudio.yml` stack. Modify to the path that meets your environment:

```yaml
- /rstats-cluster/rstudio/projects/:/srv/shiny-server/
- /rstats-cluster/shiny/logs/:/var/log/shiny-server/
- /rstats-cluster/shiny/conf/:/etc/shiny-server/
- /rstats-cluster/rstudio/renv:/home/admin/.local/share/renv/
```

Then deploy the stack:

```bash
docker stack deploy -c shiny.yml shiny
```