podman network create --subnet 192.168.33.0/24  rmq-cluster-network

podman run -d --name haproxy --replace \
    -p 15672:15672 -p 5672:5672 \
    -v $(pwd)/ha_proxy.cfg:/usr/local/etc/haproxy/haproxy.cfg \
    --network=rmq-cluster-network \
    --ip 192.168.33.1 \
    haproxy

podman run -d --replace \
    --name="rabbit1" \
    --hostname="rabbit1" \
    -e RABBITMQ_ERLANG_COOKIE="secret string" \
    -e RABBITMQ_NODENAME="rabbit1" \
    --volume=$(pwd)/rmq.conf:/etc/rabbitmq/rabbitmq.conf \
    --publish="8080:15672" \
    --network=rmq-cluster-network \
    --ip 192.168.33.100 \
    rabbitmq:4-management

podman run -d --replace \
    --name="rabbit2" \
    --hostname="rabbit2" \
    -e RABBITMQ_ERLANG_COOKIE="secret string" \
    -e RABBITMQ_NODENAME="rabbit2" \
    --volume=$(pwd)/rmq.conf:/etc/rabbitmq/rabbitmq.conf \
    --publish="8081:15672" \
    --network=rmq-cluster-network \
    --ip 192.168.33.101 \
    rabbitmq:4-management

podman run -d --replace \
    --name="rabbit3" \
    --hostname="rabbit3" \
    -e RABBITMQ_ERLANG_COOKIE="secret string" \
    -e RABBITMQ_NODENAME="rabbit3" \
    --volume=$(pwd)/rmq.conf:/etc/rabbitmq/rabbitmq.conf \
    --publish="8082:15672" \
    --network=rmq-cluster-network \
    --ip 192.168.33.102 \
    rabbitmq:4-management