# Instructions

Modify the the environment variables below prior to deploying the stack:

```bash
export ADMIN_USER=changethis
export ADMIN_PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $ADMIN_PASSWORD)
export DOMAIN=example.com
```

From the `pirate/monitor` folder, deploy:

```bash
docker stack deploy -c monitor.yml monitor
```

Once the stack completes, you should have a couple of URL's you can check:

* https://grafana.example.com
* https://prometheus.example.com
* https://alertmanager.example.com