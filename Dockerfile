FROM golang:1.24 AS builder
WORKDIR /app
COPY ./desafio1/ .
RUN go build main.go

FROM scratch
WORKDIR /app
COPY --from=builder /app/main .
ENTRYPOINT [ "./main" ]
