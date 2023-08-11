build:
	docker build -t t288msd/spyserver -f Dockerfile --build-arg TARGETPLATFORM=linux/arm64 .

run:
	docker run -it --rm \
	-e LIST_IN_DIRECTORY=0 \
	spyserver

buildx:
	docker buildx build --platform linux/arm/v8 -t t288msd/spyserver --push .

.PHONY: build
