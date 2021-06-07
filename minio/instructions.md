# Instructions

_Note: This stack depends on bind mounts._

The minio service is API compatible with AWS S3. You can use this to self host a S3-like object storage system. Once it's deployed, you can use a package like `aws.s3` to read and write to it!

First, determine where you want to store `minio` data. In my case, I made a directory on a worker node:

```bash
mkdir /mnt/wdpassport/minio
```

Modify the the environment variables below prior to deploying the stack:

```bash
export DOMAIN=minio.example.com
export USERNAME=changethis
export PASSWORD=changethis
export HOST_DATA=/path/for/minio/data
export HOSTNAME=changethis
```

From the `pirate/minio` folder, deploy:

```bash
docker stack deploy -c minio.yml minio
```

To actually interact with minio from a package like `aws.s3` you need to override the default region. This is a bit of a hack but it works. Consider the example where we have deployed to minio.example.com:

```r
Sys.setenv(
  "AWS_ACCESS_KEY_ID" = "your key",
  "AWS_SECRET_ACCESS_KEY" = "your secret", 
  "AWS_DEFAULT_REGION" = "minio",
  "AWS_S3_ENDPOINT" = "example.com"
)
```

As you can see, the default region needs to be mapped to the subdomain so that requests are pulling from the correct endpoint. For more information on this hack, you can read https://github.com/cloudyr/aws.s3/issues/371.