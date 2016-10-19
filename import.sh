#!/usr/bin/env bash
# description: Loads a dump to ttrss image (should be running)
#       usage: import.sh < dump.sql

docker exec -i ttrss_db_1 mysql -uttrss -pttrss ttrss
