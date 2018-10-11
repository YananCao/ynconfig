#!/bin/bash

#DIR=$(dirname "$0")
PUB_DIR="docs"

#cd $DIR/..

if [ -n "$(git status -s)" ]
then
    echo "The working directory is dirty. Please commit any pending changes."
    exit 1;
fi

echo "Deleting old docs"
rm -rf $PUB_DIR
mkdir $PUB_DIR
git worktree prune
rm -rf .git/worktrees/$PUB_DIR

echo "Checking out docs branch into docs folder"
#git worktree add -B docs $PUB_DIR origin/docs
git worktree add $PUB_DIR $PUB_DIR

echo "Generate API doc"
apidoc -f ".*\\.py$" -i app/ -o docs/

echo "Updating docs branch"
cd $PUB_DIR && git add --all && git commit -m "update docs"
