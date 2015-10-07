#!/bin/bash
shopt -s extglob

# Debug
set -x

# Fail on any error
set -o errexit

# Args
PROJECT="$1"
REMOTE_URL_TEMPLATE="$2"
PROJECT_ROOT=projects/$PROJECT-project
DNA_PROJECT_BASE_REPO_PATH=$(cd $(dirname $0)/..; pwd)
APP_TYPE=product

# Helper function
function initcomponent {

    local COMPONENT_PATH=$1
    local COMPONENT_REF=$2

    mkdir -p $COMPONENT_PATH
    $DNA_PROJECT_BASE_REPO_PATH/util/init-git-flow.sh $COMPONENT_PATH
    cd $COMPONENT_PATH
    git remote add origin "${REMOTE_URL_TEMPLATE/_COMPONENT_/$COMPONENT_REF}"
    echo "* Remember to create the following remote repository: ${REMOTE_URL_TEMPLATE/_COMPONENT_/$COMPONENT_REF}"
    cd -

}

# Project root repository
initcomponent $PROJECT_ROOT project
cp -r $DNA_PROJECT_BASE_REPO_PATH/boilerplates/project-root/* $PROJECT_ROOT/
#cp -r $DNA_PROJECT_BASE_REPO_PATH/boilerplates/project-root/.!(|.|git) $PROJECT_ROOT/

# Add a 12-factor app repository
initcomponent $PROJECT_ROOT/$PROJECT-$APP_TYPE $APP_TYPE
cd $PROJECT_ROOT/
git checkout develop
git submodule add -b develop "${REMOTE_URL_TEMPLATE/_COMPONENT_/$APP_TYPE}" $PROJECT-$APP_TYPE
git config -f .gitmodules submodule.$PROJECT-$APP_TYPE.branch develop
git add --all
git commit -m 'Initial DNA Project Boilerplate import'

# Add base components
cd $PROJECT-$APP_TYPE

# REST API external submodule
git submodule add -b develop https://github.com/neam/dna-project-base-rest-api.git external-apis/rest-api
git config -f .gitmodules submodule.external-apis/rest-api.branch develop

# REST API project-specific files
initcomponent external-apis/rest-api-dna rest-api-dna
git submodule add -b develop "${REMOTE_URL_TEMPLATE/_COMPONENT_/rest-api-dna}" external-apis/rest-api-dna
git config -f .gitmodules submodule.external-apis/rest-api-dna.branch develop

# Angular Frontend external submodule
git submodule add -b develop https://github.com/neam/dna-project-base-angular-frontend.git ui/angular-frontend
git config -f .gitmodules submodule.ui/angular-frontend.branch develop

# Angular Frontend project-specific files
initcomponent ui/angular-frontend-dna angular-frontend-dna
git submodule add -b develop "${REMOTE_URL_TEMPLATE/_COMPONENT_/angular-frontend-dna}" ui/angular-frontend-dna
git config -f .gitmodules submodule.ui/angular-frontend-dna.branch develop

# DNA Code Generator external submodule
git submodule add -b phundament-as-dna-code-generator https://github.com/neam/dna-code-generator.git tools/code-generator
git config -f .gitmodules submodule.tools/code-generator.branch phundament-as-dna-code-generator

git add --all
git commit -m 'Initial DNA 12-Factor App Base Components import'

cd ..
git add --all
git commit -m 'Initial DNA 12-Factor App Base Components import'

# Initiate the 12-factor app with boilerplate contents
cp -r $DNA_PROJECT_BASE_REPO_PATH/boilerplates/12-factor-app/!(vendor) $PROJECT-$APP_TYPE/
cp -r $DNA_PROJECT_BASE_REPO_PATH/boilerplates/12-factor-app/.!(|.|git) $PROJECT-$APP_TYPE/
cd $PROJECT-$APP_TYPE
git add --all
git commit -m 'Initial DNA 12-Factor App Boilerplate import'

cd ..
git add --all
git commit -m 'Initial DNA 12-Factor App Boilerplate import'
cd $PROJECT-$APP_TYPE

# Initial config files
cp .env.dist .env
cp deploy/config/secrets.dist.php deploy/config/secrets.php

exit 0
