FROM alpine:3.5

ENV PK_VERSION "1.0.0"

RUN apk --update add \
      bash \
      curl \
    && curl -Ls https://releases.hashicorp.com/packer/${PK_VERSION}/packer_${PK_VERSION}_linux_amd64.zip > /tmp/pk.zip \
    && unzip /tmp/pk.zip -d /bin/ \
    && rm /tmp/* /var/cache/apk/*

VOLUME /app
WORKDIR /app

ENTRYPOINT ["/bin/packer"]
