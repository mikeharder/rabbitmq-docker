FROM rabbitmq:management
RUN rabbitmq-plugins enable --offline rabbitmq_amqp1_0
