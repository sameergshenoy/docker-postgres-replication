FROM postgres:10.14
MAINTAINER Daniel Dent (https://www.danieldent.com)
ENV PG_MAX_WAL_SENDERS 8
ENV PG_WAL_KEEP_SEGMENTS 8
RUN apt-get update
RUN apt-get install iputils-ping -y
COPY setup-replication.sh /docker-entrypoint-initdb.d/
COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint-initdb.d/setup-replication.sh /docker-entrypoint.sh
