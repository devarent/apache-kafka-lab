<div align="center">
<img src="assets/brand-logo.svg" alt="Arya Fatthurahman" width="120" />
</div>

# Apache Kafka Lab

<sub>Run a single-node Kafka 4 cluster in KRaft mode and practice topics, producers, and consumers.</sub>

<p>
  <img src="https://img.shields.io/badge/Database-Apache%20Kafka-231F20?style=flat-square" alt="Database: Apache Kafka" />
  <img src="https://img.shields.io/badge/Category-Event%20streaming-6366F1?style=flat-square" alt="Category: Event streaming" />
  <img src="https://img.shields.io/badge/Runs%20in-Docker-2496ED?style=flat-square&logo=docker&logoColor=white" alt="Runs in Docker" />
  <img src="https://img.shields.io/badge/License-MIT-22C55E?style=flat-square" alt="License: MIT" />
  <a href="https://github.com/devarent/apache-kafka-lab/actions/workflows/compose-check.yml"><img src="https://github.com/devarent/apache-kafka-lab/actions/workflows/compose-check.yml/badge.svg" alt="compose-check" /></a>
</p>

## What this lab is

Kafka is the backbone of event-driven architectures. This lab runs the official Apache Kafka image in KRaft mode (no ZooKeeper), creates a topic, produces JSON events, and consumes them from the command line.

## Quickstart

```bash
docker compose up -d
bash examples/01_create_topic.sh
bash examples/02_produce.sh
bash examples/03_consume.sh
docker compose exec kafka /opt/kafka/bin/kafka-topics.sh --bootstrap-server localhost:9092 --describe --topic lab-events
```

## Connection details

| Field | Value |
| --- | --- |
| Bootstrap server | `localhost:9092` |
| Topic | `lab-events` |
| Partitions | `3` |
| Replication factor | `1` |
| CLI path | `/opt/kafka/bin` |

## Examples

| File | What it shows |
| --- | --- |
| [`docker-compose.yml`](docker-compose.yml) | Engine, ports, and persistent volume. |
| [`.github/workflows/compose-check.yml`](.github/workflows/compose-check.yml) | Validates the Compose file on every push. |
| [`examples/01_create_topic.sh`](examples/01_create_topic.sh) | Create a three-partition topic. |
| [`examples/02_produce.sh`](examples/02_produce.sh) | Produce three JSON events. |
| [`examples/03_consume.sh`](examples/03_consume.sh) | Consume from the beginning and print message keys and values. |

## Exercises

1. Produce 100 events and inspect the per-partition offsets with `kafka-consumer-groups.sh --describe`.
2. Create a compacted topic and explain the difference from a delete-retention topic.
3. Add a second broker and set the replication factor to 2.
4. Write a small producer/consumer in Python with `kafka-python` or `confluent-kafka`.

## Notes and limits

- This is a single-node KRaft cluster. It is not a production topology.
- `KAFKA_ADVERTISED_LISTENERS` uses `localhost`, so clients running in other containers cannot reach the broker with that address. Add a second listener if you need container-to-container access.
- The `kafka-data` volume keeps topic data across restarts.
- Kafka 4 removed ZooKeeper; this lab uses the built-in KRaft controller.

## Run it from anywhere

This lab publishes its ports on `127.0.0.1` only. To use it from another country, do **not** open the database port to the internet. Pick one:

- **VPS + private tunnel:** run the lab on a small Ubuntu VPS, keep the port closed, and connect through WireGuard or `ssh -L`.
- **Managed service:** use a managed free tier for this engine and point the same examples at its connection string.
- **HTTP UI only:** if the engine has a web UI, put it behind Caddy with TLS and basic auth.

The shared checklist, provider map, and commands are in **[REMOTE-ACCESS.md](https://github.com/devarent/database-labs/blob/main/REMOTE-ACCESS.md)**.

## Cleanup

```bash
docker compose down -v
```

`-v` also removes the named volume, so the next start is a clean slate.

## References

- [Kafka documentation](https://kafka.apache.org/documentation/)
- [Kafka Docker image](https://hub.docker.com/r/apache/kafka)
- [KRaft mode](https://kafka.apache.org/documentation/#kraft)

---

<sub>Part of the <a href="https://github.com/devarent/database-labs">database-labs</a> collection: 26 database engines, one index.</sub>

## License

MIT (c) 2026 Arya Fatthurahman. See [LICENSE](LICENSE).
