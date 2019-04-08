#!/bin/bash

echo -e "\033[0;32m Pushing to github..\033[0m"

# Add changes to git.
git add .

# Commit changes.
msg="Backup `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi
git commit -m "$msg"

# Push
git push origin master
