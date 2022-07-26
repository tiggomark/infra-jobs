#!/bin/bash
set -eux

declare HOST=$1
declare STATUS=$2
declare TIMEOUT=$3



curl --retry 10 --retry-delay 5 -s -o /dev/null $HOST
