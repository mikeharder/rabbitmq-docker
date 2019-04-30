# Generate self-signed certs
FROM paulczar/omgwtfssl as certs
WORKDIR /tmp/certs
RUN /usr/local/bin/generate-certs

FROM rabbitmq:management

# Enable AMQP 1.0
RUN rabbitmq-plugins enable --offline rabbitmq_amqp1_0

# Enable SSL
COPY --from=certs /tmp/certs/*.pem /certs/
ENV RABBITMQ_SSL_CERT_FILE /certs/cert.pem
ENV RABBITMQ_SSL_KEY_FILE /certs/key.pem
ENV RABBITMQ_SSL_CA_FILE /certs/ca.pem
ENV RABBITMQ_SSL_FAIL_IF_NO_PEER_CERT false
ENV RABBITMQ_SSL_VERIFY verify_none
