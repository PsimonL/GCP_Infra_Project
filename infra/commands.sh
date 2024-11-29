#! /bin/bash

tree /f
go run main.go
go mod init myapp

docker build -t time-api .
docker run -p 8080:8081 time-api

curl http://localhost:8081/time

