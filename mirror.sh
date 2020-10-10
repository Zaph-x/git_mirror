#!/bin/bash

REPO_DIR='/path/to/your/repo/' # Must be postfixed with '/'
BASE_DIR=$(pwd)

ORIGIN_HASH=$(git --git-dir="$REPO_DIR".git rev-parse origin/master)
MIRROR_HASH=$(cat last_commit)
if [ "$ORIGIN_HASH" == "$MIRROR_HASH" ]; then
	echo "SAME"
else
	echo "NOT SAME. PUSHING"
	cd $REPO_DIR
	git pull origin master
	git push -u mirror master
	cd $BASE_DIR
	echo "$ORIGIN_HASH" > last_commit		
	echo "$(date) - Updated repository..." >> log.txt
fi

