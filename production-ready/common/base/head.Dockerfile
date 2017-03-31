RUN adduser -u 9999 -g docker -D -g "Docker User" docker && \
    apk --update upgrade && \
    apk add curl ca-certificates && \
    update-ca-certificates && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /usr/src && \
    chown -R docker:docker /usr/src
WORKDIR /usr/src
