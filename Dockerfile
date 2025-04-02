FROM golang:1.24 AS builder
WORKDIR /app
COPY ./src/ .
RUN go build -ldflags="-s -w" -gcflags="all=-l -B" main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT [ "./main" ]
