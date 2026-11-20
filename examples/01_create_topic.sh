#!/usr/bin/env bash
set -euo pipefail
docker compose exec -T kafka /opt/kafka/bin/kafka-topics.sh \
  --bootstrap-server localhost:9092 \
  --create --if-not-exists \
  --topic lab-events \
  --partitions 3 \
  --replication-factor 1
