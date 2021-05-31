# Instructions

_Note: This stack depends on bind mounts._

First, determine where you want to store necessary `cran` files (~300 GB). In my case, I made a directory on a worker node:

```bash
mkdir /mnt/wdpassport/cran-mirror
```

Define your environment variables:

```bash
export DOMAIN=cran.example.com
export CRAN_DATA=/mnt/wdpassport/cran-mirror
export HOSTNAME=worker-02
```

From the `pirate/cran` folder, deploy:

```bash
docker stack deploy -c cran.yml cran
```
