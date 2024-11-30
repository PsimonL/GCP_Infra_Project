########## BUILDER ##########
FROM golang:1.19 AS builder
WORKDIR /app
COPY main.go go.mod go.sum ./
#COPY . .
RUN go mod tidy
RUN go build -o time-service .

########## PRODUCTION ##########
FROM alpine:3.20.3 AS production
RUN apk --no-cache add ca-certificates libc6-compat
WORKDIR /root/
COPY --from=builder /app/time-service .
EXPOSE 8081
CMD ["./time-service"]
