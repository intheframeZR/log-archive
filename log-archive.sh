#!/usr/bin/env bash
set -euo pipefail


if [[ $# -ne 1 ]]; then
    echo "Usage: $(basename "$0") <log-directory>" >&2
    exit 1
fi

FULL_PATH=$1
BASE_NAME=$(basename ${FULL_PATH})
TIMESTAMP=$(date +"%Y-%m-%d_%H-%M")
ARCHIVE_DIR=/srv/log_archive

mkdir -p /srv/log_archive


echo "----------Archive Log file in $ARCHIVE_DIR---------------"

tar czf $ARCHIVE_DIR/$BASE_NAME-log-archive-$TIMESTAMP.tar.gz $1

echo 
echo "Log-Archive form $TIMESTAMP archived in $ARCHIVE_DIR"
