FROM golang:1.12.7 AS builder
WORKDIR /app
COPY . .
RUN go build -mod=vendor -o /app/transcend

FROM centos:centos7
COPY --from=builder /app/transcend /app/
CMD ["/app/transcend"]
