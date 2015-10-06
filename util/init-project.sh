#!/bin/bash
shopt -s extglob

# Debug
set -x

# Fail on any error
set -o errexit

# Args
PROJECT_ROOT="$1"
PROJECT="$2"
REMOTE_URL_TEMPLATE="$3"
UTIL_SCRIPT_PATH=$(cd $(dirname $0); pwd)
WEBAPPREF=core

# Helper function
function initcomponent {

    local COMPONENT_PATH=$1
    local COMPONENT_REF=$2

    mkdir -p $COMPONENT_PATH
    $UTIL_SCRIPT_PATH/init-git-flow.sh $COMPONENT_PATH
    cd $COMPONENT_PATH
    git remote add origin "${REMOTE_URL_TEMPLATE/_COMPONENT_/$COMPONENT_REF}"
    cd -

}

# Project root repository
initcomponent $PROJECT_ROOT project
initcomponent $PROJECT_ROOT/$PROJECT-$WEBAPPREF app
cp -r components/boilerplates/dna-project-boilerplate/* $PROJECT_ROOT/$PROJECT-$WEBAPPREF/
cp -r components/boilerplates/dna-project-boilerplate/.!(|.|git) $PROJECT_ROOT/$PROJECT-$WEBAPPREF/
cd $PROJECT_ROOT/$PROJECT-$WEBAPPREF

git add --all
git commit -m 'Initial DNA Project Boilerplate import'

# Initial config files
cp .env.dist .env
cp deploy/config/secrets.dist.php deploy/config/secrets.php

# REST API external submodule
git submodule add https://github.com/neam/dna-project-base-rest-api.git external-apis/rest-api

# REST API project-specific files
initcomponent external-apis/rest-api-dna rest-api-dna
git submodule add "${REMOTE_URL_TEMPLATE/_COMPONENT_/rest-api-dna}" external-apis/rest-api

# Angular Frontend external submodule
git submodule add https://github.com/neam/dna-project-base-angular-frontend.git ui/angular-frontend

# Angular Frontend project-specific files
initcomponent ui/angular-frontend-dna angular-frontend-dna
git submodule add "${REMOTE_URL_TEMPLATE/_COMPONENT_/rest-api-dna}" external-apis/rest-api

# DNA Code Generator external submodule
git submodule add https://github.com/neam/dna-code-generator.git tools/code-generator

git commit -a -m 'Initial DNA Project Base Components import'

exit 0
