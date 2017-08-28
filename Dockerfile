FROM ruby:2.4.0-alpine

LABEL \
	io.voxbox.build-date=${BUILD_DATE} \
	io.voxbox.name=t2-airtime \
	io.voxbox.vendor=voxbox.io \
    maintainer=matteo@voxbox.io \
	io.voxbox.vcs-url=https://github.com/matteolc/docker-t2-airtime.git \
	io.voxbox.vcs-ref=${VCS_REF} \
	io.voxbox.license=MIT

ARG APP_NAME
ARG T2_SHOP_USER 
ARG T2_AIRTIME_KEY 
ARG T2_CURRENCY

ENV APP_HOME=app \
    APP_NAME=${APP_NAME:-app} \
    T2_CURRENCY=${T2_CURRENCY:-USD} \
    RAILS_ENV=production  

COPY app/ /${APP_NAME}/
WORKDIR ${APP_NAME}

RUN apk update && \
    apk add --no-cache \
      build-base && \
    gem install \
      bundler --no-rdoc --no-ri && \
    gem install \
      rails --no-rdoc --no-ri && \
    bundle install \
      --without development test --deployment -j4 && \
    apk del \
      build-base

RUN echo "T2_SHOP_USER=${T2_SHOP_USER}" > .env && \
    echo "T2_AIRTIME_KEY=${T2_AIRTIME_KEY}" >> .env && \
    echo "T2_CURRENCY=${T2_CURRENCY}" >> .env && \
    bundle exec rake secret | awk '{print "SECRET_KEY_BASE="$1}' >> .env

EXPOSE 3000/tcp
CMD bundle exec puma
