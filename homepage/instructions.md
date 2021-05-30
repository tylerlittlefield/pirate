# Instructions

Define your environment variables:

```bash
export HOSTNAME=worker-02
export CONTENT=/directory/with/your/content
export DOMAIN=example.com
```

Then deploy the stack:

```bash
docker stack deploy -c homepage.yml homepage
```