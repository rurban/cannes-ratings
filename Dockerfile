FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
       apt-get update && \
       apt-get dist-upgrade -y && \
       apt-get -qq -y --no-install-recommends install \
       libdancer-perl libplack-perl
#       & apt-get -y autoremove & apt-get clean \
#       ; \
#    rm -rf /var/lib/apt/lists/* ; \
#    rm -rf /tmp/*

WORKDIR /workspace/public
COPY . /workspace/
EXPOSE 8080/tcp
ENTRYPOINT ["perl", "index.pl", "--port=8080"]
