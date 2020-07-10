FROM debian:buster-slim

LABEL MAINTAINER="catcherwong <catcher_hwq@outlook.com>"

COPY src/bootstrap.sh /usr/bin/

# Install wget, download and install jexus, then cleanup
COPY src/install.sh /tmp/
RUN /tmp/install.sh

# COPY src/cacert.pem /etc/curlssl/cacert.pem
# ENV CURL_CA_BUNDLE=/etc/curlssl/cacert.pem

# Expost ports
EXPOSE 80

# Define workdir
WORKDIR /usr/jexus
# Define startup scripts;
ENTRYPOINT ["/usr/bin/bootstrap.sh"]
