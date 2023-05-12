ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.2.0.198.0
ARG IMAGE=intersystemsdc/iris-community:preview
ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE

WORKDIR /home/irisowner/dev

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly


