FROM golang:1.24-alpine AS builder

WORKDIR /src/usr/app/

COPY go.mod go.sum ./

RUN go mod download 

COPY . .
RUN go build -o /go/bin/checkout/ ./


FROM alpine

WORKDIR /src/usr/app/


COPY --from=builer /go/bin/checkout/ ./

EXPOSE ${CHECKOUT_PORT}
CMD ["./checkout"]