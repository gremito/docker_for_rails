# docker_for_rails

mysql db of [Quickstart: Compose and Rails](https://docs.docker.com/compose/rails/)

## Define the project

- [Dockerfile](https://github.com/gremito/docker_for_rails/blob/master/Dockerfile)
- [docker-compose.yml](https://github.com/gremito/docker_for_rails/blob/master/docker-compose.yml)

### Gemfile

```
source 'https://rubygems.org'
gem 'rails', '~>5'
```

### Gemfile.lock

```
$ touch Gemfile.lock
```

### entrypoint.sh

```
#!/bin/bash
set -e

# Remove a potentially pre-existing server.pid for Rails.
rm -f /myapp/tmp/pids/server.pid

# Then exec the container's main process (what's set as CMD in the Dockerfile).
exec "$@"
```


## Build the project

```
$ docker-compose run web rails new . --force --no-deps --database=mysql

$ docker-compose build
```

## Connect the database

```
$ cp config/database.yml.sample config/database.yml

$ docker-compose run web rake db:create
```

## View the Rails welcome page!

```
$ docker-compose up
```

## Stop the application

```
$ docker-compose stop
```

## Rebuild the application

```
$ docker-compose up --build
```
