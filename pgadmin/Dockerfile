FROM dpage/pgadmin4:latest as base

USER pgadmin4
FROM base as dev
COPY ./pgadmin4/config_local.dev.py /pgadmin4/config.local.py