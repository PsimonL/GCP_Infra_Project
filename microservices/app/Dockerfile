########## BUILDER ##########
FROM golang:1.19 AS builder
WORKDIR /app
COPY main.go go.mod go.sum ./
#COPY . .
RUN go mod tidy
RUN go build -o time-service .

########## PRODUCTION ##########
FROM alpine:3.21.2 AS production
RUN apk --no-cache add ca-certificates libc6-compat curl
WORKDIR /root/
COPY --from=builder /app/time-service .
EXPOSE 8081
HEALTHCHECK --interval=10s --timeout=3s --retries=3 CMD curl -f http://localhost:8081/health || exit 1
CMD ["./time-service"]
