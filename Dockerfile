FROM ruby

# throw errors if Gemfile has been modified since Gemfile.lock
RUN bundle config --global frozen 1

WORKDIR ./

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

CMD ["ruby","flowerTexter.rb"]