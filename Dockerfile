FROM ubuntu:trusty
MAINTAINER freistil IT Ltd <ops@freistil.it>

# Image setup scripts
RUN mkdir /docker
ADD docker/ /docker/
RUN chmod a+x /docker/bin/*

# Boot container
ENTRYPOINT ["/docker/entrypoint.sh"]
CMD /bin/bash
