DNA Project Base
================

Homepage: [http://neamlabs.com/dna-project-base/](http://neamlabs.com/dna-project-base/)

An extremely biased PHP-oriented* Docker+LEMP-based Project Base that allows rapid generation of deployable, testable and maintainable custom applications for enrichment and publishing of user-generated data, which in turn are made available for consumption by end user frontends through a RESTful API.

It's main focus is to enable automation in as many aspects of the development process as viable, so that the developers' energy is focused on custom business logic (the "DNA").

Also includes sample documentation on how to use the stack for a wide range of web app development workflows. 

*Since the architecture is Docker-centric, micro-services within the project can be written in any server-side language. Most extensions and boilerplate for code-reuse however are currently written in PHP, heavily oriented around the Yii Framework.

## The DNA Project Base Project Goals

DNA Project Base should assist in:
* Providing a useful Content and User Management UI with publishing/authoring workflows
* Providing a useful RESTful API (for end user frontends and machine-machine communication)
* Quickly and properly adapting to changes in the databases, metadata and configuration
* Testing the above applications
* Deploying the above applications (to a Docker container platform)
* Monitoring deployed projects
* Providing best-practice development routines and workflows

## Requirements

You need to maintain the following in your DNA Project Base projects (the project's DNA):
* An RDBMS database schema (the Data Model)
* Application-specific metadata and configuration (Generated by [Codegeneration.IO](https://codegeneration.io))

## Basic workflow from scratch to live project

1. Set up the DNA-driven project structure and install dependencies
2. Add your SQL as your project's first data profile
3. Generate your content model metadata JSON by using [Codegeneration.IO](https://codegeneration.io)
4. Generate the models, the RESTful API controllers and Angular frontend CRUD by using [DNA Code Generator](https://github.com/neam/dna-code-generator)
5. Test your application locally
6. Deploy your frontend to Amazon S3
7. Deploy your backend to [Tutum](https://www.tutum.co/)
8. Set up monitoring for your deployment (logs, server health, uptime)
9. Set up automated builds and continuous integration (CI)

## The anatomy of a DNA-driven project

A certain directory structure and file contents / conventions are imposed in order to facilitate a high level of code re-use between projects. 

See the full documentation here: [./docs/anatomy.md](./docs/anatomy.md)

# Getting started

## 1. Set up the DNA-driven project structure and install dependencies

Whether you are starting from scratch or migrating previous project code, the easiest way to get started may be to generate a new project and then move existing code (if any) into the new project after you have got the basics up and running.

Begin by cloning this repository to a local directory so that we have access to the helper scripts:

    git clone https://github.com/neam/dna-project-base.git

Then prepare the base project repo with submodules:

    cd dna-project-base
    export PROJECT=example
    export PUBLISHER=softwareinc
    export REMOTE_URL_TEMPLATE=git@github.com:$PUBLISHER/$PROJECT-_COMPONENT_.git
    #export REMOTE_URL_TEMPLATE=git@bitbucket.org:$PUBLISHER/$PROJECT-_COMPONENT_.git
    docker-compose run shell util/init-project.sh $PROJECT $REMOTE_URL_TEMPLATE

Open the base project repo in SourceTree:

    stree projects/$PROJECT-project
    
Push. Other developers may then get the complete source code of the project by cloning the main project repo.

## 2. Add your SQL as your project's first data profile

... TODO
