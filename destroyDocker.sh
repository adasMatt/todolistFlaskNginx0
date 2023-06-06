#!/bin/bash
docker stop $(docker ps -aq)
docker rm todolist-db-server
docker network rm todo
docker rmi $(docker images)
