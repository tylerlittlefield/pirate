# Instructions

Define your environment variables:

```bash
export DOMAIN=cran.example.com
export CRAN_DATA=/directory/to/your/cran/data
export HOSTNAME=worker-02
```

Then deploy the stack:

```bash
docker stack deploy -c cran.yml cran
```
