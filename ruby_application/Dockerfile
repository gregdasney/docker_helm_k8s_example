FROM ruby:3.0
RUN gem install rails

# throw errors if Gemfile has been modified since Gemfile.lock
# RUN bundle config --global frozen 1

# WORKDIR /usr/src/app

# COPY Gemfile Gemfile.lock ./


# COPY . .

# CMD ["./your-daemon-or-script.rb"]
ENTRYPOINT [ "rails" ]
# CMD rails