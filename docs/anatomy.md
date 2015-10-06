The anatomy of a DNA-driven project
===================================

A certain directory structure and file contents / conventions are imposed in order to facilitate a high level of code re-use between projects.

A typical DNA-driven project will contain the following:

    .
    ├── .db
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
    │   ├── rest-api
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    ├── tools
    │   └── code-generator
    │   │   ├── composer.json
    │   │   ├── composer.lock
    │   │   └── vendor
    ├── ui
    │   ├── angular-frontend
    │   │   ├── Gruntfile.js
    │   │   ├── README.md
    │   │   ├── app
    │   │   │   ├── less
    │   │   │   ├── scripts
    │   │   │   ├── styles
    │   │   │   └── views
    │   │   ├── bower.json
    │   │   ├── bower_components
    │   │   ├── build.sh
    │   │   ├── deploy.sh
    │   │   ├── develop.sh
    │   │   ├── dist
    │   │   ├── dna-boilerplate
    │   │   ├── full-build.sh
    │   │   ├── node_modules
    │   │   └── package.json
    │   └── angular-frontend-dna
    │      ├── app
    │      │   ├── crud
    │      │   ├── images
    │      │   ├── index.html
    │      │   ├── less
    │      │   ├── modals
    │      │   ├── scripts
    │      │   ├── styles
    │      │   └── views
    │      └── provider-bootstrap.php
    └── vendor
        ├── autoload.php
        ├── bin
        ├── composer
        ├── neam
        └── yiisoft

# Breakdown

Let's break that down...

## The DNA

Houses the common dependencies and code/components shared by all PHP-backed applications - mostly models and content model metadata.

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
    │   ├── generated-classes
    │   ├── generated-conf
    │   ├── generated-reversed-database
    │   ├── exceptions
    │   ├── fixtures
    │   ├── models
    │   ├── traits
    │   ├── tests
    │   └── vendor

## Docker/docker-stack
    
The server stack is used for local development and for remote deployment. 

Full documentation available here: [DNA Project Base Stack (Based on Debian PHP/Nginx)](https://github.com/neam/docker-stack/blob/develop/stacks/debian-php-nginx.dna-project-base/README.md)
    
    ├── .docker-stack
    ├── .dockerignore
    ├── .stack.nginx.Dockerfile
    ├── .stack.php.Dockerfile
    ├── docker-compose.yml
    ├── stack
    │   ├── .gitignore
    │   ├── README.md
    │   ├── docker-compose-production-tutum-router.yml
    │   ├── docker-compose-production-tutum.yml
    │   ├── docker-compose-production.yml
    │   ├── localdb
    │   │   ├── .db
    │   │   └── run.sh
    │   ├── logs.sh
    │   ├── nginx
    │   │   ├── conf.d
    │   │   │   ├── 00-basics.conf
    │   │   │   ├── app.conf
    │   │   │   └── php-fpm.conf
    │   │   ├── include
    │   │   │   ├── backend-location-defaults.conf
    │   │   │   └── location-defaults.conf
    │   │   ├── nginx.conf
    │   │   └── run.sh
    │   ├── open-browser.sh
    │   ├── php
    │   │   ├── conf.d
    │   │   │   ├── 00-basics.ini
    │   │   │   └── app.ini
    │   │   ├── conf.d-local
    │   │   │   └── local.ini
    │   │   ├── image
    │   │   │   ├── Dockerfile
    │   │   ├── php-fpm.conf
    │   │   ├── pool.d
    │   │   │   └── www.conf
    │   │   ├── run.sh
    │   │   └── yet-unused
    │   │       ├── newrelic.ini
    │   │       └── xdebug.ini
    │   ├── setup.sh
    │   ├── shell.sh
    │   ├── src
    │   │   ├── build.sh
    │   │   ├── git-pull-recursive.sh
    │   │   ├── install-deps.sh
    │   │   ├── reset-vendor.sh
    │   │   ├── set-writable-local.sh
    │   │   └── set-writable-remote.sh
    │   ├── start.sh
    │   ├── stop.sh
    │   └── tester-shell.sh

## Local development configuration

The $_ENV array is populated by the contents of the `.env` file when running the software locally.

    ├── .env
    ├── .env.dist

## Local development /files host mount directory    

Used if your project requires local file handling (such as file uploads directly to your software).

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

External re-usable dependencies are mainly handled by Composer while internal division of project components/modules is managed via git submodules. 

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
    ├── stack
    │   ├── src
    │   │   ├── install-deps.sh

## Config-management

12-factor config handling

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
    │   ├── 22-local-dev-pulling-in-changes-from-teammates.md
    │   ├── 23-local-dev-working-with-data.md
    │   ├── 24-local-dev-working-with-tests.md
    │   ├── 25-local-dev-code-generation.md
    │   ├── 50-deploy-overview.md
    │   ├── 52-deploy-tutum.md
    │   ├── 60-release-routines.md
    │   ├── 61-live-troubleshooting.md
    │   ├── 62-if-something-is-wrong-with-the-latest-release.md
    │   ├── 63-staging-new-features.md
    │   └── README.md

## DNA Code Generator

    ├── tools
    │   └── code-generator
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor
    
## The public applications within the 12-factor app

PHP-powered REST API: 

    ├── external-apis
    │   └── rest-api
    │       ├── composer.json
    │       ├── composer.lock
    │       └── vendor

Javascript-based frontend:

    ├── ui
    
The Angular.JS frontend is deployed separately from the PHP-backed application(s) and is divided between two folders: `angular-frontend` and `angular-frontend-dna`.

The `angular-frontend` folder contains the common dependencies and shared code to be re-used across all DNA-driven projects. 

    │   ├── angular-frontend
    │   │   ├── Gruntfile.js
    │   │   ├── README.md
    │   │   ├── app
    │   │   │   ├── less
    │   │   │   ├── scripts
    │   │   │   ├── styles
    │   │   │   └── views
    │   │   ├── bower.json
    │   │   ├── bower_components
    │   │   ├── build.sh
    │   │   ├── deploy.sh
    │   │   ├── develop.sh
    │   │   ├── dist
    │   │   ├── dna-boilerplate
    │   │   ├── full-build.sh
    │   │   ├── node_modules
    │   │   └── package.json

The `angular-frontend-dna` folder contains the data-model/product/brand-specific parts that differentiate the project from others.
    
    │   └── angular-frontend-dna
    │      ├── app
    │      │   ├── crud
    │      │   ├── images
    │      │   ├── index.html
    │      │   ├── less
    │      │   ├── modals
    │      │   ├── scripts
    │      │   ├── styles
    │      │   └── views
    │      └── provider-bootstrap.php
