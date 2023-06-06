#!/bin/bash
docker network create todo
docker run --name todolist-db-server -d -p 3306:3306 --network todo -e MYSQL_USER=adam -e MYSQL_PASSWORD=<password> -e MYSQL_DATABASE=todo_db -e MYSQL_ROOT_PASSWORD=<password> mysql
docker build -t todolist-flask .
docker build -t todolist-webapp -f Dockerfile-nginx .
docker run --rm -itd --name todo-webapp -p 9876:80 todolist-webapp

echo '
copy/paste this command once the script is finished idk why it wont work in the script

docker run --rm -itd --network todo --name todo-flask_c -p 80:80 -e MYSQL_DATABASE_HOST=todolist-db-server -e MYSQL_DATABASE_USER=adam -e MYSQL_DATABASE_PASSWORD=<password> -e MYSQL_DATABASE_DB=todo_db -e MYSQL_DATABASE_PORT=3306 todolist-flask

'