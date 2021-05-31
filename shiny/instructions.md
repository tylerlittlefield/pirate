# Instructions

_Note: This stack depends on bind mounts._

For this stack, I would typically already have `rstudio-server` up and running. This is because I share a [bind mount](https://docs.docker.com/storage/bind-mounts/) between `rstudio-server` and `shiny-server` so that applications developed in `rstudio-server` are magically deployed and placed in `/srv/shiny-server`. 

First, determine where you want to store necessary `shiny-server` files. In my case, I made a directory like so:

```bash
mkdir /mnt/shiny
mkdir /mnt/shiny/conf
mkdir /mnt/shiny/logs
```

Make sure to copy the necessary shiny configs:

```bash
cp pirate/shiny/conf/shiny-server.conf /mnt/shiny/conf
cp pirate/shiny/conf/init.sh /mnt/shiny/conf
```

You may have issues deploying the stack due to permissions, if that happens you can:

```bash
chmod +x /mnt/shiny/conf
chmod +x /mnt/shiny/conf/shiny-server.conf
chmod +x /mnt/shiny/conf/init.sh
```

If you already followed the `rstudio-server` instructions, you should already have a directory for `rstudio-server` related files. In my case, this is located at:

```bash
mkdir /mnt/rstudio
mkdir /mnt/renv
```

So my folder structure looks like:

```bash
/mnt/
├── renv
│   ├── cache
│   │   └── v5
│   ├── projects
│   └── source
│       └── repository
├── rstudio
│   ├── R
│   │   └── aarch64-unknown-linux-gnu-library
│   ├── hello
│   │   ├── app.R
│   │   ├── hello.Rproj
│   │   ├── renv
│   │   └── renv.lock
│   └── rstudio
└── shiny
    ├── conf
    │   ├── init.sh
    │   ├── init_done
    │   └── shiny-server.conf
    └── logs
        ├── system-info-shiny-20210531-060248-35771.log
        └── system-info-shiny-20210531-154513-40905.log
```

Once you have the a directory for:

* renv
* rstudio
* shiny configs
* shiny logs

Modify the the environment variables below prior to deploying the stack:

```bash
export DOMAIN=apps.example.com
export SHINY_RENV=/home/pirate/.local/share/renv/
export HOST_HOME=/mnt/rstudio/
export HOST_RENV=/mnt/renv/
export HOST_LOGS=/mnt/shiny/logs
export HOST_CONF=/mnt/shiny/conf
```

From the `pirate/shiny` folder, deploy:

```bash
docker stack deploy -c shiny.yml shiny
```

From this point, you can scale `shiny-server` so that multiple instances are running. The benefit of doing this is that there are more R sessions available and as a result, users are less likely to 'block' each other during long running tasks. Scale `shiny-server` by running:

```bash
docker service scale shiny_shiny=10 # change number to however many instances you want running
```

Keep in mind that we are using [sticky sessions](https://doc.traefik.io/traefik/routing/services/#sticky-sessions) which is required so that the users session persists. The way it works (as I understand it) is that traefik will assign cookies to users accessing the app and this essentially assigns them to one of the 10 instances we deployed. In this way we are trying to distribute the usage across multiple instances. You can see this in action by visiting https://apps.tylerlittlefield.com/hello. This application prints the node name and should remain the same for you every time you refresh the page. If you clear your cookies or open an incognito window, you will likely see a different node name!