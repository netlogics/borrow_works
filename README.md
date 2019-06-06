# Borrow Works

## Overview
* Uploading, parsing, storing and searching is broken up into services.
* Services are orchestrated using docker-compose.
* The uploader service saves files to public/tmp/storage. This was to avoid configuration and costs of any external services such as s3. After a file is saved an event/sidekiq job is created.
* The parser service runs the Sidekiq workers which trigger parsing. After the files are parsed they are saved to elasticsearch
* The api search service is the public api for searching location data

## Whats working
* The uploader uploads files and notifies the parser
* The parser runs sidekiq
* Parsing has been tested in the repl but the implementation is incomplete
* The parser can save and search elasticsearch
* The sidekiq UI is functional
* Elasticsearch is functional
* Postgres is functional
* Redis is functional

## TODO
1. Finish parsers
1. Write tests for parsers
1. Save parsed data to elasticsearch
1. Implement search api
1. Add test services to automatically run tests when files are changed

## Issues
* Services require running bundle to properly install gems. This should work on build

## Setup
* Install Docker
* Install Docker compose if not installed with Docker
* Run docker-compose build
* Run docker-compose up

All services should start but they may require bundle to be run separately for each rails/ruby service.
To run bundle for a service

`docker-compose run service-name-here bundle install`
