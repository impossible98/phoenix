# Build image
FROM golang:1.19.8 as build

WORKDIR /app/

COPY go.mod .
COPY go.sum .

RUN go mod download

COPY . .

ENV CGO_ENABLE=0

RUN go build -ldflags '-s -w' -o dist/phoenix server.go
# Production image
FROM debian:12 as production

WORKDIR /app/

COPY --from=build /app/dist /app/

EXPOSE 9542

ENV GIN_MODE=release

ENTRYPOINT ["./phoenix"]
