docker run -d \
  --hostname my-rabbit \
  --name some-rabbit \
  --network host \
  rabbitmq-amqp1_0:management
