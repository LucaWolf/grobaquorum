About
-----

This is a simple demo application for testing the quorum queues via the [grabbit](https://github.com/LucaWolf/grabbit) library. The application
creates a queue with a particular `amqp.Table{"x-queue-type": "quorum"}` topology and then publishes a small number of messages, 
with the end goal of testing if:
  - awaiting the publisher setup completes fine
  - the messages are published and recorded fine on the server side

Use the `infra/cluster_up.sh` script in order to create the required RabbitMQ cluster server instance.
