# Instructions

Make sure you are in the root directory of the `swarmprom` project.

```bash
export ADMIN_USER=admin
export ADMIN_PASSWORD=changethis
export HASHED_PASSWORD=$(openssl passwd -apr1 $ADMIN_PASSWORD)
export DOMAIN=example.com
```

If you want alerts with slack, also run:

```bash
export SLACK_URL=https://hooks.slack.com/services/TOKEN
export SLACK_CHANNEL=devops-alerts
export SLACK_USER=alertmanager
```

Next, build the grafana image:

```bash
docker built -t custom_grafana .
```

Then deploy the stack:

```bash
docker stack deploy -c monitor.yml monitor
```
