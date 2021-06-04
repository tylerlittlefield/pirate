# Instructions

The gitea project is a self hosted git service. I use this service to mirror some repositories of mine from github to gitea. If you have already deployed the postgres stack, we can use it for gitea! You can also just use SQLite, read more about set up instructions here: https://docs.gitea.io/en-us/install-with-docker/

The instructions below assume have deployed the postgres stack found in `pirate/postgres`. Modify the the environment variables below prior to deploying the gitea stack:

```bash
export DOMAIN=git.example.com
export DBHOST=db.example.com
export DBNAME=yourdbname
export DBUSER=yourusername
export DBPASS=yourpassword
```

From the `pirate/gitea` folder, deploy:

```bash
docker stack deploy -c gitea.yml gitea
```

Navigate to `git.example.com` and you will be prompted to fill out some things to complete the installation.