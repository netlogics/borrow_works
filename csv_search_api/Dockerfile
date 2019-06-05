FROM ruby:2.6.3-stretch

ENV RAILS_ENV=development \
    RACK_ENV=development \
    BUNDLE_PATH=/usr/src/app/vendor/bundle \
    GEM_HOME=/usr/src/app/vendor/bundle

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY ./csv_search_api /usr/src/app
RUN bundle install
RUN yes | bundle exec rails app:update:bin

CMD irb