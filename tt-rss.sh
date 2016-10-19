#!/usr/bin/env bash
#      author: lislon
# description:

LOCAL_PORT=5000

INITIAL_DUMP=dump.sql
CONTAINER_DB=ttrss_db_1

function docker-status {
    RUNNING=$(docker inspect --format="{{ .State.Running }}" $1 2> /dev/null)
    if [ $? -eq 1 ]; then
        echo "none"
    else
        $RUNNING == "true" && echo "up" || echo "down"
    fi
}

function import {
    echo "loading dump ..."
    docker exec -i $CONTAINER_DB mysql -uttrss -pttrss ttrss < ${2:-$INITIAL_DUMP}
    echo "done"
}

function dump {
    echo "loading dump..."
    docker exec $CONTAINER_DB mysqldump -uttrss -pttrss ttrss > ${2:-$INITIAL_DUMP}
    echo "done"
}

function install {
    docker-compose build
}

function start {
    docker-compose up --no-recreate
}
function stop {
    docker-compose stop
}

function status {
    docker-compose ps
}

function uninstall {
    echo "Uninstalling"
    docker stop ttrss 2>/dev/null
    docker stop ttrss-db 2>/dev/null
    docker rm ttrss
    docker rm ttrss-db
    echo "done"
}

SCRIPT_HOME="$( cd "$( dirname "$0" )" && pwd )"
cd $SCRIPT_HOME

case "$1" in
    start)
        start
        ;;
    stop)
        stop
        ;;
    status)
        status
        ;;
    install)
        install
        ;;
    uninstall)
        uninstall
        ;;
    import)
        import "$@"
        ;;
    export)
        dump "$@"
        ;;
    *)
        cat << EOF
usage: $0 <command>

The following commands availiable:
 - start      start existing or install new tt-rss instance. Well look for dump.sql script
 - stop       stops running container
 - docker-status     show docker-status of tt-rss
 - install    install containers
 - uninstall  delete containers (YOU WILL LOSE DATA IN MYSQL!). Make backup first
 - import     import file from dump.sql (container should be installed)
 - export     export mysql dump data to dump.sql

EOF
        ;;
esac
