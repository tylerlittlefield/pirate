# Instructions

_Note: This stack depends on bind mounts._

First, determine where you want to store necessary `blog` files. In my case, I made a directory on a worker node:

```bash
mkdir /home/tyler/blog
```

Modify the the environment variables below prior to deploying the stack:

```bash
export DOMAIN=blog.example.com
export BLOG_DATA=/home/tyler/blog
export HOSTNAME=worker-02
```

From the `pirate/blog` folder, deploy:

```bash
docker stack deploy -c blog.yml blog
```