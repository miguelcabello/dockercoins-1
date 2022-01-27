FROM ruby
RUN gem install sinatra
RUN gem install thin
FROM scratch
COPY --from=0 / /
