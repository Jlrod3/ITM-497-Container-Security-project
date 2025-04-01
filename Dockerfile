FROM golang:latest AS builder

WORKDIR /app

COPY helloWorld.go .

RUN go build -o server helloWorld.go

FROM alpine:latest

WORKDIR /app

COPY --from=builder /app/server .

EXPOSE 8069

CMD ["./server"] 