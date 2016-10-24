#!/usr/bin/env bash
#      author: lislon
# description: Waits for mysql and then exit with 0 (success) or 1 (code)

RETRY=10
DB_HOST=db
DB_PORT=3306

echo "Waiting for mysql on $DB_HOST:$DB_PORT..."
while ! $(nc -z $DB_HOST $DB_PORT) && (( $RETRY > 1 )); do
    sleep 1;
    ((RETRY--))
done

if (( $RETRY <= 1 )) ; then
    echo "Can't access db at host $DB_HOST port $DB_PORT" >&2
    exit 1
fi

echo "mysql is running"
