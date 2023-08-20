build:
	docker build --platform arm64 -t t288msd/spyserver -f Dockerfile .
	

push:
	docker push t288msd/spyserver:latest

.PHONY: build
