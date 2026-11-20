#!/usr/bin/env bash
set -euo pipefail
printf '%s\n' \
  '{"event":"signup","user":1001}' \
  '{"event":"login","user":1001}' \
  '{"event":"purchase","user":1001,"amount":42.50}' \
| docker compose exec -T kafka /opt/kafka/bin/kafka-console-producer.sh \
    --bootstrap-server localhost:9092 \
    --topic lab-events
