# Instructions

Define your environment variables:

```bash
export DOMAIN=blog.example.com
export BLOG_DATA=/directory/to/your/blog/files
export HOSTNAME=worker-02
```

Then deploy the stack:

```bash
docker stack deploy -c blog.yml blog
```
