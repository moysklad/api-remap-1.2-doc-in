FROM ruby:2.5-alpine
COPY . /usr/src/app
#VOLUME /usr/src/app
EXPOSE 4567
WORKDIR /usr/src/app
RUN apk add --no-cache bash && \
    /bin/sh && \
    apk update && \
    apk add --virtual build-dependencies build-base nodejs && \
    gem install bundler -v 2.3.26 && \
    bundle install
CMD ["bundle", "exec", "middleman", "server", "--watcher-force-polling"]
