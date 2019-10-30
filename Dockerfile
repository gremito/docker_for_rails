FROM ruby:2.5

ENV LANG C.UTF-8

RUN ruby --version
RUN gem --version

RUN apt-get update -qq && \
    apt-get install -y build-essential \
                       libpq-dev \
                       nodejs

RUN mkdir /web
WORKDIR /web
RUN ls -lta /

COPY Gemfile /web/Gemfile
COPY Gemfile.lock /web/Gemfile.lock
RUN ls -lta /web

RUN gem update --system
RUN gem install bundler
RUN bundle install
COPY . /web
RUN ls -lta /web

COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
