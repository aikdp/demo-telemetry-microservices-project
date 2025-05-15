FROM golang:alpine AS builder

WORKDIR /usr/src/app
#WORKDIR /app


COPY go.mod go.sum ./

#Download go module dependencies
RUN go mod download
COPY . .
RUN go build -o product-catalog .

#Stage2
FROM alpine AS run

WORKDIR /usr/src/app
COPY ./products ./products

COPY --from=builder /usr/src/app/product-catalog/ ./

ENV PRODUCT_CATALOG_PORT=8088
# EXPOSE 8080
ENTRYPOINT [ "./product-catalog" ]