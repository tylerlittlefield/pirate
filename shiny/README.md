# shiny-server-arm

![build](https://github.com/tyluRp/shiny-server-arm/workflows/build/badge.svg)
[![image-size](https://img.shields.io/docker/image-size/tylurp/shiny-server-arm)](https://hub.docker.com/repository/docker/tylurp/shiny-server-arm)
[![pulls](https://img.shields.io/docker/pulls/tylurp/shiny-server-arm)](https://hub.docker.com/repository/docker/tylurp/shiny-server-arm)

Run the lines below to get shiny-server running on a Raspberry Pi. Note that the lines assume you have a user `pirate`, so replace that with your preferred user.

```bash
# download docker
curl -sSL https://get.docker.com | sh

# add user to docker group
sudo usermod -aG docker pirate

# create directories to communicate with container
cd ~
mkdir shiny-server
mkdir shiny-server/logs
mkdir shiny-server/conf
mkdir shiny-server/apps

# bind directories
docker volume create --name shiny-apps --opt type=none --opt device=/home/pirate/shiny-server/apps/ --opt o=bind
docker volume create --name shiny-logs --opt type=none --opt device=/home/pirate/shiny-server/logs/ --opt o=bind
docker volume create --name shiny-conf --opt type=none --opt device=/home/pirate/shiny-server/conf/ --opt o=bind

# run the container
docker run \
    --detach \
    --publish 3838:3838 \
    --volume shiny-apps:/srv/shiny-server/ \
    --volume shiny-logs:/var/log/shiny-server/ \
    --volume shiny-conf:/etc/shiny-server/ \
    --name shiny-server \
    tylurp/shiny-server-arm
```

## Add apps

Start adding shiny apps with:

```bash
cd ~/shiny-server/apps
git clone <your app here>
```

Then navigate to `http://<your ip>:3838/`.

## Acknowledgements

A lot of the Dockerfile is based on existing work, please see [`hvalev/shiny-server-arm-docker`](https://github.com/hvalev/shiny-server-arm-docker).