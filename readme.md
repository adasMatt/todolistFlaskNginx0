# Dockerized to do list flask app with nginx
With the correct Dockerfiles this set of commands will get the todolist app up and running

## Network creation
```
docker network create todo
```

## Server container creation 
```
docker run --name todolist-db-server -d -p 3306:3306 --network todo -e MYSQL_USER=adam -e MYSQL_PASSWORD=<password> -e MYSQL_DATABASE=todo_db -e MYSQL_ROOT_PASSWORD=<root_password> mysql
```

## Web app frontend creation
```
docker build -t todolist-webapp -f Dockerfile-nginx .
docker run --rm -itd --name todo-webapp -p 9876:80 todolist-webapp
```

## Flask application creation
```
docker build -t todolist-flask .
docker run --rm -itd --network todo --name todo-flask_c -p 80:8080 -e MYSQL_DATABASE_HOST=todolist-db-server -e MYSQL_DATABASE_USER=adam -e MYSQL_DATABASE_PASSWORD=<password> -e MYSQL_DATABASE_DB=todo_db -e MYSQL_DATABASE_PORT=3306 todolist-flask
```