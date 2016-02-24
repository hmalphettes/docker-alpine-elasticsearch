FROM hmalphettes/alpine-zulujre

# Export HTTP & Transport
EXPOSE 9200 9300

ENV VERSION 2.2.0

# Install Elasticsearch.
RUN apk add --update curl ca-certificates sudo && \
  ( curl -Lskj https://download.elasticsearch.org/elasticsearch/release/org/elasticsearch/distribution/tar/elasticsearch/$VERSION/elasticsearch-$VERSION.tar.gz | \
  gunzip -c - | tar xf - ) && \
  mv /elasticsearch-$VERSION /elasticsearch && \
  rm -rf $(find /elasticsearch | egrep "(\.(exe|bat)$|sigar/.*(dll|winnt|x86-linux|solaris|ia64|freebsd|macosx))") && \
  apk del curl wget ca-certificates && \
  mkdir -p /elasticsearch/plugins && mkdir -p /data && chown -R nobody:nobody /data && \
  /elasticsearch/bin/elasticsearch --version && \
  rm -rf /tmp/* /var/cache/apk/*

# Volume for Elasticsearch data
VOLUME ["/data"]

# Copy configuration
COPY config /elasticsearch/config
COPY docker-entrypoint.sh /elasticsearch/bin/start.sh

ENTRYPOINT [ "/elasticsearch/bin/start.sh" ]
