#!/bin/bash

set -x

# Usage: util/init-git-flow.sh <path to folder in which a default git flow initialized git repo should be created>

RELPATH="$1"
DIR="$(basename $RELPATH)"
FULLPATH=$(cd "$RELPATH"; pwd)
FULLPATH=${FULLPATH%/}

mv "$FULLPATH" /tmp/
cd /tmp/"$DIR"
git flow init --defaults
mv /tmp/"$DIR" "$FULLPATH"

exit 0
