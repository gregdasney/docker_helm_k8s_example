# simple docker file with entrypoint that can be used as the ruby cli.  
FROM ruby:3.0
EXPOSE 3000
RUN gem install rails

WORKDIR /
ENTRYPOINT [ "/bin/bash"]