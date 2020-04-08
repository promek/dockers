FROM fluent/fluentd:v1.10-debian-1

LABEL maintainer="ibrahim SEN<ibrahim@promek.net>"

USER root

RUN buildDeps="sudo make gcc g++ libc-dev" \
 && apt-get update \
 && apt-get install -y libpq-dev \
 && apt-get install -y --no-install-recommends $buildDeps \
 && sudo gem install fluent-plugin-postgres \
 && sudo gem sources --clear-all \
 && SUDO_FORCE_REMOVE=yes \
    apt-get purge -y --auto-remove \
                  -o APT::AutoRemove::RecommendsImportant=false \
                  $buildDeps \
 && rm -rf /var/lib/apt/lists/* \
 && rm -rf /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

USER fluent
