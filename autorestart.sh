#!/bin/bash

CONTAINERS=$(sudo docker ps --format '{{.Names}}' | wc -l)

if [ $CONTAINERS -lt 3 ]; then
    echo "Restarting Docker containers..."
    cd ~/avail-indexer
    sudo docker-compose down
    nohup sudo docker-compose up  </dev/null &>/dev/null &
    echo "Restarted"
fi

echo "All Containers running"