# Postgres Docker image with Flyway migrations for integration testing

[See article](https://chrysanthium.com/postgres-docker-flyway-migrations-integration-testing).

```shell
docker build . -t foobar
docker run -e POSTGRES_USER=admin -e POSTGRES_PASSWORD=admin -e POSTGRES_DB=platform foobar
```
