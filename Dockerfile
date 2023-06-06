FROM python:alpine

ENV MYSQL_DATABASE_HOST=todolist-db-server
ENV MYSQL_DATABASE_DB=todo_db
ENV MYSQL_DATABASE_PORT=3306
ENV MYSQL_DATABASE_USER=chandra
ENV MYSQL_DATABASE_PASSWORD=<password>

RUN apk update && \
    apk add --no-cache build-base libffi-dev openssl-dev
COPY . /app
WORKDIR /app
RUN pip install -r requirements.txt
# EXPOSE matches todo.py port specification
EXPOSE 80       
CMD python todo.py
