FROM golang:1.22-alpine AS builder

WORKDIR /usr/share/go
#WORKDIR /app

COPY . .
COPY go.mod .
COPY go.sum .

#Download go module dependencies
RUN go mod download

RUN go build -o product-catalog /usr/share/go

#Stage2
FROM alpine as run

WORKDIR /usr/share/go
COPY ./products ./products

COPY --from=builder /usr/share/go /usr/share/go

ENV PRODUCT_CATALOG_PORT 8088
# EXPOSE 8080
CMD [ "./product-catalog" ]
