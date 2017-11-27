FROM drecom/ubuntu-ruby:latest

RUN \
  apt-get update && apt-get upgrade -q -y && \
  apt-get install -y --no-install-recommends build-essential libpq-dev nodejs

ENV APP_HOME /web
RUN mkdir $APP_HOME
WORKDIR $APP_HOME
COPY Gemfile* $APP_HOME/

ENV BUNDLE_GEMFILE=$APP_HOME/Gemfile \
    BUNDLE_JOBS=4 \
    BUNDLE_PATH=/bundle
RUN bundle install
