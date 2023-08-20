build:
	docker build --platform linux/arm64v8 -t t288msd/spyserver -f Dockerfile .
	

push:
	docker push t288msd/spyserver:latest

.PHONY: build
