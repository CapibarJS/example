FROM postgres:14.1-alpine3.15

#ADD scripts/01_setup.sql /docker-entrypoint-initdb.d
ADD scripts/02_structure.sql /docker-entrypoint-initdb.d
ADD scripts/03_data.sql /docker-entrypoint-initdb.d

RUN chmod a+r /docker-entrypoint-initdb.d/*

EXPOSE 5432
