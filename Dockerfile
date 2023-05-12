ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.2.0.198.0
ARG IMAGE=intersystemsdc/iris-community:latest
ARG IMAGE=intersystemsdc/iris-community:preview
FROM $IMAGE

WORKDIR /home/irisowner/dev

## Embedded Python environment
ENV IRISUSERNAME "_SYSTEM"
ENV IRISPASSWORD "SYS"
ENV IRISNAMESPACE "USER"
ENV PYTHON_PATH=/usr/irissys/bin/
ENV PATH "/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"


RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS && \
	iris session IRIS < iris.script && \
    iris stop IRIS quietly


