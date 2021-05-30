# Instructions

Define your environment variables:

```bash
export DOMAIN=db.example.com
export USERNAME=admin
export PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $PASSWORD)
export POSTGRES_DB=dev
export POSTGRES_DATA=/directory/to/your/pgdata
export HOSTNAME=worker-02
```

Then deploy the stack:

```bash
docker stack deploy -c postgres.yml postgres
```
