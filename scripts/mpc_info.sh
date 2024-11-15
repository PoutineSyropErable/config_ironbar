#!/bin/bash
port=6600
volume=$( mpc -p $port | sed -n 's/.*volume: *\([0-9]\+%\).*/\1/p')
time=$(mpc -p $port | sed -n '2p' | awk '{print $3}')

echo "$time  $volume"


