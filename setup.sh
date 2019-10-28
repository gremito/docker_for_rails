#!/bin/sh -v

# check .env
if [[ ! -e ./.env ]]; then
    echo "ERROR: config not found."
    exit
fi

# make config
cp config/database.yml.sample config/database.yml

# migration
bundle install
bundle exec rake db:create
bundle exec rake db:seed
