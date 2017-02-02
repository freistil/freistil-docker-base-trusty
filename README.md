freistil-docker-base-trusty
===========================

Docker base image for Ubuntu Trusty

This container comes with an init system. Scripts in `/docker/init.d` will
automatically be executed during container launch.

Usage
-----

To create the image `freistil/base-trusty`, execute the following command:

    rake build

Test the container by running it:

    rake run

You can now push your new image to the Docker Hub:

    rake push
