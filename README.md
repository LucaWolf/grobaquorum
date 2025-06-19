About
-----

This is a simple demo application for testing the quorum queues via the [grabbit](https://github.com/LucaWolf/grabbit) library. The application
creates a queue with a particular `amqp.Table{"x-queue-type": "quorum"}` toplogy and then publishes a small number of messages, 
with the end goal of testing if:
  - the publsiher awaiting completes fine
  - the messages are publsihed and recorded fine on server side

Use the `infra/cluster_up.sh` script in order to setup the required RabbitMQ cluster server instance.
