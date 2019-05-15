FROM ruby:2-alpine

# build-base is required to build gems' native extensions
RUN apk add --no-cache build-base

WORKDIR /site

# Copy the Gemfile and lock file before running bundle install
# This allows Docker to cache the image up through the `bundle install` command
# If we copied the whole site and then ran bundle, the gems would have to be
# re-installed every time any file in the app changed
COPY Gemfile ./

RUN bundle install

COPY . ./

EXPOSE 4000

CMD ["bundle", "exec", "jekyll", "serve", "-H", "0.0.0.0", "-P", "4000"]
