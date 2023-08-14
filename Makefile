build:
	docker build -t t288msd/spyserver -f Dockerfile --build-arg TARGETPLATFORM=linux/arm64 .

run:
	docker run -it --rm \
	-e LIST_IN_DIRECTORY=0 \
	spyserver

buildx:
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t t288msd/spyserver --push .

.PHONY: build
