#!/bin/bash
cd "$(dirname $0)"

REPO_DIR="/path/to/repository/directory/"
BASE_DIR=$(pwd)

echo "$BASE_DIR"
cd $REPO_DIR
git fetch origin master 
ORIGIN_HASH=$(git rev-parse origin/master)
MIRROR_HASH=$(cat "$BASE_DIR/last_commit")
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

