#Vars:
VANILLA=vanilla
MULTISTAGE=multistage
DISTROLESS=distroless
ALPINE=alpine

VERSION=1.0
APP_PORT=3000
HOST_PORT=${APP_PORT}

install:
	cd app && npm install

run-app:
	cd app && npm start

build-vanilla:
	docker build --tag node-${VANILLA}:${VERSION} --file Dockerfile-${VANILLA} app
	@echo
	docker image ls node-${VANILLA}

run-vanilla: build-vanilla
	@echo
	# Check app: curl localhost:HOST_PORT
	docker run -p ${HOST_PORT}:${APP_PORT} -ti --rm --init node-${VANILLA}:${VERSION}

build-multistage:
	docker build --tag node-${MULTISTAGE}:${VERSION} --file Dockerfile-${MULTISTAGE} app
	@echo
	docker image ls node-${MULTISTAGE}

run-multistage: build-multistage
	@echo
	# Check app: curl localhost:HOST_PORT
	docker run -p ${HOST_PORT}:${APP_PORT} -ti --rm --init node-${MULTISTAGE}:${VERSION}

build-distroless:
	docker build --tag node-${DISTROLESS}:${VERSION} --file Dockerfile-${DISTROLESS} app
	@echo
	docker image ls node-${DISTROLESS}

run-distroless: build-distroless
	@echo
	# Check app: curl localhost:HOST_PORT
	docker run -p ${HOST_PORT}:${APP_PORT} -ti --rm --init node-${DISTROLESS}:${VERSION}

build-alpine:
	docker build --tag node-${ALPINE}:${VERSION} --file Dockerfile-${ALPINE} app
	@echo
	docker image ls node-${ALPINE}

run-alpine: build-alpine
	@echo
	# Check app: curl localhost:HOST_PORT
	docker run -p ${HOST_PORT}:${APP_PORT} -ti --rm --init node-${ALPINE}:${VERSION}

all: build-vanilla build-multistage build-distroless build-alpine
	@echo
	@echo "All images built: vanilla, multistage, distroless, alpine"
	docker image ls -f "reference=node-*"
