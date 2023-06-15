FROM debian:latest
ARG DEBIAN_FRONTEND=noninteractive
RUN set -ex; \
    apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get -qq -y --no-install-recommends install \
      cpanminus libdancer-perl libplack-perl libplack-middleware-deflater-perl \
    cpanm Plack::Middleware::ETag
#       & apt-get -y autoremove & apt-get clean \
#       ; \
#    rm -rf /var/lib/apt/lists/* ; \
#    rm -rf /tmp/*

WORKDIR /workspace/public
COPY . /workspace/
EXPOSE 8080/tcp
ENTRYPOINT ["perl", "index.pl", "--port=8080"]
