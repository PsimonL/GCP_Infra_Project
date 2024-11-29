#! /bin/bash

tree /f
go run main.go
go mod init myapp

docker build -t time-service .
docker build --no-cache -t time-service .
docker run -d -p 8081:8081 time-service # host port : container port
docker run -it --entrypoint /bin/sh -p 8081:8081 time-service
docker run -it -p 8081:8081 time-service

curl http://localhost:8081/time

