FROM ruby:2.6.3-stretch

ENV RACK_ENV=development \
    BUNDLE_PATH=/usr/src/app/vendor/bundle \
    GEM_HOME=/usr/src/app/vendor/bundle

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./sidekiq_web /usr/src/app
RUN bundle install
RUN bundle binstub rackup --force

CMD irb