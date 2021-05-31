# Instructions

_Note: This stack depends on bind mounts._

First, determine where you want to store necessary `homepage` files. In my case, I made a directory on a worker node:

```bash
mkdir /home/tyler/homepage
```

Modify the the environment variables below prior to deploying the stack:

```bash
export HOSTNAME=worker-02
export CONTENT=/home/tyler/homepage
export DOMAIN=example.com
```

From the `pirate/homepage` folder, deploy:

```bash
docker stack deploy -c homepage.yml homepage
```