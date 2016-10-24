#!/usr/bin/env bash
# description: Loads a dump to ttrss image (should be running)
#       usage: import.sh < dump.sql

if [ -t 0 ]; then
    echo "Usage $0 < dump.sql"
    exit 1
fi

docker exec -i ttrss_db_1 mysql -uttrss -pttrss ttrss
