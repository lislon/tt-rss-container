#!/usr/bin/env bash
# description: export mysql dump to stdout
#       usage: export.sh > dump.sql

docker exec ttrss_db_1 mysqldump -uttrss -pttrss ttrss
