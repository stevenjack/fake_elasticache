FROM ruby:2.1.4
MAINTAINER Steven Jack <stevenmajack@gmail.com>

RUN bundle config --global frozen 1
WORKDIR /usr/src/app
ADD . /usr/src/app
RUN bundle install

EXPOSE 11212

ENV CONTAINER true
ENV FAKEELASTICACHE_BIND 0.0.0.0

ENTRYPOINT bin/fake_elasticache
