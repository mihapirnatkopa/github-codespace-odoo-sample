# Any generic, debian-based image. ( https://github.com/devcontainers/features#usage )
FROM odoo:16.0

USER root

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client git sudo
RUN usermod -aG sudo odoo
RUN echo "odoo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN pip3 install pytest-odoo coverage pytest-html

USER odoo
# change shell to bash for terminal to work https://stackoverflow.com/a/72897273/4078503
ENV SHELL /bin/bash