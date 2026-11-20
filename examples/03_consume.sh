#!/usr/bin/env bash
set -euo pipefail
docker compose exec -T kafka /opt/kafka/bin/kafka-console-consumer.sh \
  --bootstrap-server localhost:9092 \
  --topic lab-events \
  --from-beginning \
  --max-messages 3 \
  --property print.key=true \
  --property print.value=true
