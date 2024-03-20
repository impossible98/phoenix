build:
	go build -ldflags '-s -w' -o dist/phoenix server.go
dev:
	go run server.go
fmt:
	go fmt ./...
