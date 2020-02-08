FROM ruby:2.6.5
ENV LANG C.UTF-8
RUN mkdir /bookmark-mini
WORKDIR /bookmark-mini

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
    && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client yarn vim

ENV GEM_HOME=/bundle
ENV BUNDLE_GEMFILE=Gemfile
ENV BUNDLE_JOBS=4
ENV BUNDLE_PATH=$GEM_HOME

COPY Gemfile /bookmark-mini/Gemfile
COPY Gemfile.lock /bookmark-mini/Gemfile.lock
RUN bundle install

COPY . /bookmark-mini

EXPOSE 3000
CMD ["rails", "server", "-b", "0.0.0.0"]
