FROM ruby:3.0
EXPOSE 3000
RUN gem install rails

workdir /
COPY /app /app
workdir /app/helloworld
RUN bundle
CMD ["rails", "server"]
# ENTRYPOINT [ "/bin/bash","-c" ]
# CMD rails