FROM ubuntu:14.04

MAINTAINER steven@buffer.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update
RUN apt-get install -y curl
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-get install -y apt-transport-https

RUN useradd -ms /bin/bash ubuntu

COPY hal_k8s_run.sh /
RUN chmod +x /hal_k8s_run.sh
RUN /hal_k8s_run.sh

ENTRYPOINT ["/opt/halyard/bin/hal", "-v"]