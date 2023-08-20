build:
	docker build -t t288msd/docker-spyserver -f Dockerfile .
	

push:
	docker push t288msd/docker-spyserver:latest

.PHONY: build
 