FROM ruby:2.6.3-stretch

RUN apt-get update -y && \
    apt-get install curl

ENV RACK_ENV=development \
    BUNDLE_PATH=/usr/src/app/vendor/bundle \
    GEM_HOME=/usr/src/app/vendor/bundle

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./parser /usr/src/app
RUN bundle install

CMD irb
