#!/usr/bin/env bash
#      author: lislon
# description: Wait's till mysql is running

RETRY=5
while [[ ! $(nc -z db 3306) && $RETRY > 1 ]]; do sleep 1; RETRY=$(($RETRY-1)); done
