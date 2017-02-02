FROM ubuntu:trusty
MAINTAINER freistil IT Ltd <ops@freistil.it>

# Install packages
ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && \
  apt-get -y install \
    git \
    strace \
  && apt-get clean && \
  rm -rf /var/lib/apt/lists/*

# Image setup scripts
RUN mkdir /docker
ADD docker/ /docker/
RUN chmod a+x /docker/bin/*

# Boot container
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD /bin/bash
