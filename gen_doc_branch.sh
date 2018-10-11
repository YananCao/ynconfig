#!/bin/bash

DOC_BRANCH="docs"
WORK_BRANCH="develop"
GIT_REMOTE="origin"

# Add doc branch folder
echo "$DOC_BRANCH" >> .gitignore

# Add docs branch as an empty orphan(孤儿) branch
git checkout --orphan $DOC_BRANCH
git reset --hard
git commit --allow-empty -m "Initializing $DOC_BRANCH branch"
git push $GIT_REMOTE $DOC_BRANCH
git checkout $WORK_BRANCH
