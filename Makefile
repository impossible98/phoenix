TAG := $(shell date +"%Y-%m-%d-%H-%M-%S")

build:
	go build -ldflags '-s -w' -o dist/phoenix server.go
dev:
	go run server.go
fmt:
	go fmt ./...
# Docker
build-docker:
	docker build . --tag impossible98/phoenix
	docker build . --tag impossible98/phoenix:$(TAG)	
push-docker: build-docker
	docker push impossible98/phoenix
	docker push impossible98/phoenix:$(TAG)
