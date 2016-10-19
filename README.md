# Docker container with tt-rss #

Docker installation for running tt-rss server.

## Prerequisites ##

 * docker
 * docker-compose

## Installation ##

Clone a repo onto your computer 

### arch-linux ###

``` shell
sudo pacman -S docker docker-compose
```
### General instructions ###

See official installation [docker](https://docs.docker.com/engine/installation/) and [docker-compose](https://docs.docker.com/compose/install)

Add your user to `docker` group to run docker commands without sudo:

``` shell
usermod -a -G docker $USER
sudo su - $USER
```

## Usage ##

To start docker containers use the following command inside repo directory:

``` shell
docker-compose start
```

Then container should be available on http://localhost

Default admin credentials:

``` abap
User: admin
Password: password
```

If you want to change port, use environment variable `TTRSS_PORT`

``` shell
TTRSS_PORT=5000 docker-compose start
```

## Import/Export database ##

At first run tt-rss database will be populated with empty structure. If you have existing ttrss database structure you can import it into container:

``` shell
./import.sh < dump.sql
```

to dump database schema use the following script;

``` shell
./export.sh > dump.sql
```

## Credits ##

Thanks to [https://github.com/clue/docker-ttrss](https://github.com/clue/docker-ttrss)
