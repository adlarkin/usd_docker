# usd_docker
This repository contains a Dockerfile for [Pixar's Universal Scene Description](https://graphics.pixar.com/usd/release/index.html) (USD).
The Dockerfile uses `ubuntu:bionic` as the base image.
A pre-built image that uses this Dockerfile can be pulled from `Dockerhub`: https://hub.docker.com/r/adlarkin/usd

In order to use USD graphical tools such as `usdview`, a Docker container with visualization capabilities is required.
[Rocker](https://github.com/osrf/rocker) is an example of a tool that can be used to run a container with visualization capabilities.
The following command would run the image pulled from `Dockerhub` with access to `X11` and the host's nvidia GPU:
```
rocker --nvidia --x11 adlarkin/usd:bionic bash
```

Once a container has been started, you can test the USD installation by running `usdview` on one of the examples from the [USD repository](https://github.com/PixarAnimationStudios/USD):
```
cd /tmp/USD/extras/usd/examples/usdGeomExamples/
usdview basisCurves.usda
```
