# Instructions

This stack uses bind mounts so that `renv` will work and we can still deploy shiny applications by simply writing code in `rstudio-server`. Ideally, bind mounts wouldn't be used so that applications are self contained and can be routed to other workers in your cluster.

Additionally, a Dockerfile will be built to include some things we need. Modify as needed for your use case. From the root directory of the `rstudio` folder, build the image.

```bash
docker built -t custom_rstudio .
```

Then modify as needed and run:

```bash
export DOMAIN=rstudio.example.com
export USERNAME=admin
export PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
```

As mentioned, there are two bind mounts specified in the `rstudio.yml` file. The `shiny-server` stack will use these to serve the applications. The `admin` part should be whatever you set the `USERNAME`. Modify to the path that meets your environment:

```yaml
- /rstats-cluster/rstudio/projects/:/home/admin/
- /rstats-cluster/rstudio/renv/:/home/admin/.local/share/renv/
```

Then deploy the stack:

```bash
docker stack deploy -c rstudio.yml rstudio
```