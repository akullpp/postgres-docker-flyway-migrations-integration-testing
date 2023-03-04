#!/bin/bash
set -o errexit
set -o pipefail
set -o nounset

flyway -jdbcProperties.socketFactory='org.newsclub.net.unix.AFUNIXSocketFactory$FactoryArg' -jdbcProperties.socketFactoryArg=/var/run/postgresql/.s.PGSQL.5432 -jdbcProperties.sslMode=disable migrate
