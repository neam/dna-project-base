The anatomy of a DNA-driven project
===================================

A certain directory structure and file contents / conventions are imposed in order to facilitate a high level of code re-use between projects.

A typical DNA-driven project will contain the following:

    .
    ├── .docker-stack
    ├── .dockerignore
    ├── .env
    ├── .env.dist
    ├── .files
    │   ├── data1
    │   │   └── media
    │   │       └── 1
    │   ├── data2
    │   │   └── media
    │   │       ├── 1
    │   │       └── trash
    │   └── data3
    │       └── media
    │           ├── 1
    │           ├── media
    │           └── trash
    ├── .git
    ├── .gitignore
    ├── .gitmodules
    ├── .stack.nginx.Dockerfile
    ├── .stack.php.Dockerfile
    ├── README.md
    ├── bin
    │   ├── create-migration.sh
    │   ├── generate-content-model-metadata.sh
    │   ├── generate-internal-db-crud.sh
    │   ├── generate-models.sh
    │   ├── generate-yii-workflow-ui-crud.sh
    │   ├── migrate.sh
    │   ├── new-data-profile.sh
    │   ├── reset-db.sh
    │   ├── reset-user-generated-files.sh
    │   ├── upload-current-files-to-cdn.sh
    │   └── upload-current-user-data.sh
    ├── bootstrap.php
    ├── composer.json
    ├── composer.lock
    ├── composer.phar
    ├── config
    │   ├── local
    │   └── remote
    ├── deploy
    │   ├── build.sh
    │   ├── config
    │   │   ├── .gitignore
    │   │   ├── identity.php
    │   │   ├── secrets.dist.php
    │   │   └── secrets.php
    │   ├── generate-config.sh
    │   ├── prepare.sh
    │   └── ssh.sh
    ├── deployments
    │   ├── 2015-04-17_151556-develop-data1.exampledev.com-2cead77
    │   ├── 2015-04-21_111337-master-data1.example.com-16ecb25
    │   ├── 2015-04-22_011222-master-data2.example.com-b440157
    │   ├── 2015-04-23_021649-data1customdomain.com-a815d66
    │   └── inactive
    ├── dna
    │   ├── .git
    │   ├── .gitignore
    │   ├── app
    │   ├── code-generation
    │   ├── commands
    │   ├── components
    │   ├── composer.json
    │   ├── composer.lock
    │   ├── config
    │   ├── console
    │   ├── db
    │   ├── dna-api-revisions
    │   ├── exceptions
    │   ├── fixtures
    │   ├── models
    │   ├── tests
    │   └── vendor
    ├── docker-compose.yml
    ├── docs
    │   ├── 11-overview-components.md
    │   ├── 20-local-dev-introduction.md
    │   ├── 21-local-dev-first-time-set-up.md
    │   ├── 22-local-dev-update-to-the-latest-changes.md
    │   ├── 23-local-dev-working-with-data.md
    │   ├── 50-deploy-overview.md
    │   ├── 52-deploy-tutum.md
    │   └── README.md
    ├── stack
    │   ├── .gitignore
    │   ├── README.md
    │   ├── db-set-local-config.sh
    │   ├── db-start.sh
    │   ├── docker-compose-production-tutum-router.yml
    │   ├── docker-compose-production-tutum.yml
    │   ├── docker-compose-production.yml
    │   ├── logs.sh
    │   ├── nginx
    │   ├── php
    │   ├── setup.sh
    │   ├── shell.sh
    │   ├── src
    │   ├── start.sh
    │   ├── stop.sh
    │   └── tester-shell.sh
    ├── external-apis
    │   ├── files-api
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   ├── stats-api
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   └── partner-api
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor
    ├── tools
    │   └── code-generator
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    ├── ui
    │   ├── backend
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   ├── consumer
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   └── partner
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor
    └── vendor
        ├── autoload.php
        ├── bin
        ├── composer
        ├── neam
        └── yiisoft

# Breakdown

Let's break that down...

## The DNA

    .
    ├── dna
    │   ├── .git
    │   ├── .gitignore
    │   ├── app
    │   ├── code-generation
    │   ├── commands
    │   ├── components
    │   ├── composer.json
    │   ├── composer.lock
    │   ├── config
    │   ├── console
    │   ├── db
    │   ├── dna-api-revisions
    │   ├── exceptions
    │   ├── fixtures
    │   ├── models
    │   ├── tests
    │   └── vendor

## Docker/docker-stack
    
The server stack is used for local development and for remote deployment
    
    ├── .docker-stack
    ├── .dockerignore
    ├── .stack.nginx.Dockerfile
    ├── .stack.php.Dockerfile
    ├── stack
    │   ├── .gitignore
    │   ├── README.md
    │   ├── db-set-local-config.sh
    │   ├── db-start.sh
    │   ├── docker-compose-production-tutum-router.yml
    │   ├── docker-compose-production-tutum.yml
    │   ├── docker-compose-production.yml
    │   ├── logs.sh
    │   ├── nginx
    │   ├── php
    │   ├── setup.sh
    │   ├── shell.sh
    │   ├── src
    │   ├── start.sh
    │   ├── stop.sh
    │   └── tester-shell.sh
    ├── docker-compose.yml

## Local development configuration

    ├── .env
    ├── .env.dist

## Local development /files host mount directory    
    
    ├── .files
    │   ├── data1
    │   │   └── media
    │   │       └── 1
    │   ├── data2
    │   │   └── media
    │   │       ├── 1
    │   │       └── trash
    │   └── data3
    │       └── media
    │           ├── 1
    │           ├── media
    │           └── trash

## Git core metadata
    
    ├── .git
    ├── .gitignore

## Shorthand bash script shortcuts for often recurring tasks

These are often simple shorthands that execute the re-usable and easily upgradable helper scripts distributed as DNA composer dependencies. 

    ├── bin
    │   ├── create-migration.sh
    │   ├── generate-content-model-metadata.sh
    │   ├── generate-internal-db-crud.sh
    │   ├── generate-models.sh
    │   ├── generate-yii-workflow-ui-crud.sh
    │   ├── migrate.sh
    │   ├── new-data-profile.sh
    │   ├── reset-db.sh
    │   ├── reset-user-generated-files.sh
    │   ├── upload-current-files-to-cdn.sh
    │   └── upload-current-user-data.sh

## Dependency-management

    ├── .gitmodules
    ├── composer.json
    ├── composer.lock
    ├── composer.phar
    ├── vendor
    │   ├── autoload.php
    │   ├── bin
    │   ├── composer
    │   ├── neam
    │   └── yiisoft

## Config-management

    ├── config
    │   ├── local
    │   └── remote
    ├── bootstrap.php

## Deployment

`deploy` - To prepare and generate deployment metadata
`deployments` - The deployments' metadata is stored here

    ├── deploy
    │   ├── build.sh
    │   ├── config
    │   │   ├── .gitignore
    │   │   ├── identity.php
    │   │   ├── secrets.dist.php
    │   │   └── secrets.php
    │   ├── generate-config.sh
    │   ├── prepare.sh
    │   └── ssh.sh
    ├── deployments
    │   ├── 2015-04-17_151556-develop-data1.exampledev.com-2cead77
    │   ├── 2015-04-21_111337-master-data1.example.com-16ecb25
    │   ├── 2015-04-22_011222-master-data2.example.com-b440157
    │   ├── 2015-04-23_021649-data1customdomain.com-a815d66
    │   └── inactive
    
## Documentation

    ├── README.md
    ├── docs
    │   ├── 11-overview-components.md
    │   ├── 20-local-dev-introduction.md
    │   ├── 21-local-dev-first-time-set-up.md
    │   ├── 22-local-dev-update-to-the-latest-changes.md
    │   ├── 23-local-dev-working-with-data.md
    │   ├── 50-deploy-overview.md
    │   ├── 52-deploy-tutum.md
    │   └── README.md

## DNA Code Generator

    ├── tools
    │   └── code-generator
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor
    
## The public internal applications within the 12-factor app

    ├── external-apis
    │   ├── files-api
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   ├── stats-api
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   └── partner-api
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor
    ├── ui
    │   ├── backend
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   ├── consumer
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    │   └── partner
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor
