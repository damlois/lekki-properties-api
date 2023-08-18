# FROM ruby:3.2.2

# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# WORKDIR /rails

# COPY Gemfile Gemfile.lock ./

# COPY . .

# RUN bundle install

# RUN chmod +x docker-entrypoint.sh
# ENTRYPOINT ["/bin/docker-entrypoint.sh"]
# EXPOSE 3000

# CMD ["rails", "server", "-b", "0.0.0.0"]

# Put the ruby ​​version you are using
# FROM ruby:3.2.2

# # Install the necessary libraries
# RUN apt-get update -qq && apt-get install -y postgresql-client

# # BUNDLE_FROZEN setting
# RUN bundle config --global frozen 1

# # Set working directory
# WORKDIR /lekki-properties-api

# # Copy and install the project gems
# COPY Gemfile /lekki-properties-api/Gemfile
# COPY Gemfile.lock /lekki-properties-api/Gemfile.lock
# RUN bundle install

# # Run entrypoint.sh to delete server.pid
# COPY entrypoint.sh /usr/bin/
# RUN chmod +x /usr/bin/entrypoint.sh
# ENTRYPOINT ["entrypoint.sh"]

# # Listen on this specified network port
# EXPOSE 3000

# # Run rails server
# CMD ["rails", "server", "-b", "0.0.0.0"]

FROM ruby:3.2.2
# Set working directory
WORKDIR /app
# Install dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    libpq-dev \
    nodejs
# Install bundler
RUN gem install bundler
# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./
# Install gems
RUN bundle install
# Copy the rest of the application code
COPY . .
# Start the Rails server
CMD ["rails", "server", "-b", "0.0.0.0"]