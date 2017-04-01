FROM defektive/ruby-base
USER root
RUN apk add --no-cache --virtual .build-deps \
       binutils-gold \
       curl \
       g++ \
       gcc \
       gnupg \
       libgcc \
       linux-headers \
       make \
       python \
       postgresql-dev

USER docker
RUN gem install rails \
    && rails new --api -d postgresql ./tmpapp \
    && rm -rf tmpapp
