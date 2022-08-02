FROM ruby:3.0
RUN gem install rails
WORKDIR /
COPY /app /app
WORKDIR /app
RUN bundle
EXPOSE 3000
CMD ["rails", "server","-b","0.0.0.0"]
