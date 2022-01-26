FROM ruby
RUN gem install sinatra
RUN gem install thin
FROM scratch
COPY --from=0 / /
ENV LANG C.UTF-8
ENV GEM_HOME /usr/local/bundle
ENV BUNDLE_SILENCE_ROOT_WARNING=1 \
	BUNDLE_APP_CONFIG="$GEM_HOME"
ENV PATH $GEM_HOME/bin:$PATH
