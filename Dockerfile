FROM ruby:3.2.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs postgresql-client ffmpeg
WORKDIR /athenas_lab
COPY Gemfile /athenas_lab/Gemfile
COPY Gemfile.lock /athenas_lab/Gemfile.lock
RUN bundle install
RUN gem install foreman

# Install Python and Tiktoken Library
RUN apt-get install -y python3-pip
RUN pip3 install tiktoken

# Install ffmpeg
RUN apt-get install -y wget
RUN wget https://archive.mozilla.org/pub/opus/opus-1.3.1.tar.gz
RUN tar -xvf opus-1.3.1.tar.gz
RUN cd opus-1.3.1 && ./configure && make && make install
RUN rm -rf opus-1.3.1.tar.gz opus-1.3.1

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 80
EXPOSE 5432

# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
