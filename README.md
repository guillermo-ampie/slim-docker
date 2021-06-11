# Slim Docker

Sample code from article: [3 simple tricks for smaller Docker images](https://learnk8s.io/blog/smaller-docker-images) written by [Daniele Polencic](https://linkedin.com/in/danielepolencic)

## Building the Docker images

To build the images use the provided [Makefile](./Makefile)

* `make vanilla`: It uses a 'plain-vanilla' Dockerfile (no optimizations)
* `make multistage`: It uses a Dockerfile with [multi-stage-builds](https://docs.docker.com/develop/develop-images/multistage-build/)
* `make distroless`: It uses a base image from Google's [Distroless](https://github.com/GoogleContainerTools/distroless) Docker images
* `make alpine`: It uses [Alpine Linux distro](https://alpinelinux.org/) as base image
