FROM ruby:3.2.2
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client ffmpeg
WORKDIR /athenas_ai
COPY Gemfile /athenas_ai/Gemfile
COPY Gemfile.lock /athenas_ai/Gemfile.lock
RUN bundle install

RUN apt-get install -y wget
RUN wget https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
RUN tar -xvf opus-1.3.1.tar.gz
RUN cd opus-1.3.1 && ./configure && make && make install
RUN rm -rf opus-1.3.1.tar.gz opus-1.3.1