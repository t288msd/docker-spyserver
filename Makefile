build:
	docker build -t t288msd/spyserver -f Dockerfile .

.PHONY: build

push: 
	docker push t288msd/spyserver:latest