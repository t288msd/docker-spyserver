build:
	docker build -t t288msd/spyserver -f Dockerfile .
	

push:
	docker push t288msd/spyserver:latest

.PHONY: build
 