FROM golang:1.24.6-alpine3.22

WORKDIR /app

COPY . .

RUN go build -o some-donkus

CMD ["./some-donkus"]
