# ARG RUBY_VERSION=3.2.2
# FROM ruby:$RUBY_VERSION

# RUN apt-get update -qq && \
#     apt-get install -y build-essential libvips bash bash-completion libffi-dev tzdata postgresql nodejs npm yarn && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /usr/share/doc /usr/share/man

# WORKDIR /rails

# ENV RAILS_LOG_TO_STDOUT="1" \
#     RAILS_SERVE_STATIC_FILES="true" \
#     RAILS_ENV="production" \
#     BUNDLE_WITHOUT="development"

# COPY Gemfile Gemfile.lock ./
# COPY bin/docker-entrypoint ./
# RUN bundle install

# COPY . .

# RUN bundle exec bootsnap precompile --gemfile app/ lib/
# # RUN SECRET_KEY_BASE_DUMMY=1 bundle exec rails assets:precompile

# ENTRYPOINT ["/bin/docker-entrypoint"]

# EXPOSE 3000
# CMD ["./bin/rails", "server"]

FROM ruby:3.2.2

RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /rails

COPY Gemfile Gemfile.lock docker-entrypoint ./

COPY . .

RUN bundle install

ENTRYPOINT ["/rails/docker-entrypoint"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]