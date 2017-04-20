# Ruby 2.3, Node 6.2, PostgreSQL Client, and base Rails gems pre-installed

## Setting up a new app

```bash
mkdir app_name
cd app_name
docker run -v `pwd`:/tmp/app defektive/ruby-rails rails new --skip-bundle /tmp/app/my_awesome_app
sudo chown -R `whoami` ./
mv my_awesome_app src
```

I recommend removing `config/databse.yml` and use the `DATABASE_URL` environment variable.
