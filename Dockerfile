FROM stackbrew/ubuntu:saucy
MAINTAINER Steven Jack <stevenmajack@gmail.com>

RUN apt-get -y update

RUN apt-get -y install ruby ruby-dev build-essential
RUN gem install fake_elasticache

EXPOSE 11212

ENV CONTAINER true
ENV FAKEELASTICACHE_BIND 0.0.0.0

ENTRYPOINT fake_elasticache
