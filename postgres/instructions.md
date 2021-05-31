# Instructions

_Note: This stack depends on bind mounts._

First, determine where you want to store necessary `postgres` files. In my case, I made a directory on a worker node:

```bash
mkdir /mnt/wdpassport/pgdata
```

Modify the the environment variables below prior to deploying the stack:

```bash
export DOMAIN=db.example.com
export USERNAME=admin
export PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
export POSTGRES_DB=dev
export POSTGRES_DATA=/directory/to/your/pgdata
export HOSTNAME=worker-02
```

From the `pirate/postgres` folder, deploy:

```bash
docker stack deploy -c postgres.yml postgres
```
