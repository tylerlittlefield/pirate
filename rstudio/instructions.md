# Instructions

_Note: This stack depends on bind mounts._

I have always deployed this stack prior to deploying the `shiny-server` stack because the contents of `rstudio-server` will be used in `shiny-server`. 

First, determine where you want to store necessary `rstudio-server` files. In my case, I made a directory like so:

```bash
mkdir /mnt/rstudio
mkdir /mnt/renv
```

Modify the the environment variables below prior to deploying the stack:

```bash
export DOMAIN=rstudio.example.com
export USERNAME=changethis
export PASSWORD=changethis
export RSTUDIO_HOME=/home/changethis/
export RSTUDIO_RENV=/home/changethis/.local/share/renv/
export HOST_HOME=/mnt/rstudio/
export HOST_RENV=/mnt/renv/
```

Note that in `RSTUDIO_HOME` and `RSTUDIO_RENV`, the `changethis` should be whatever you assigned `USERNAME` to.

From the `pirate/rstudio` folder, deploy:

```bash
docker stack deploy -c rstudio.yml rstudio
```