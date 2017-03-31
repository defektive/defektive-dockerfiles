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
       sqlite-dev

USER docker
RUN gem install rails \
    && rails new --skip-turbolinks --skip-spring ./tmpapp \
    && rm -rf tmpapp
