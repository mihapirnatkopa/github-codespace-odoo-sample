# Any generic, debian-based image. ( https://github.com/devcontainers/features#usage )
FROM odoo:17.0

USER root

# Install some additional things
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client git sudo wget screen inotify-tools psmisc procps

# Add sudo support for user odoo
RUN usermod -aG sudo odoo
RUN echo "odoo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN pip3 install pytest-odoo coverage pytest-html debugpy ruff hunter

# https://github.com/nodesource/distributions/issues/1157
RUN apt remove -y nodejs nodejs-doc libnode-dev

# Nodesource https://github.com/nodesource/distributions?tab=readme-ov-file#ubuntu-versions
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | sudo -E bash - && sudo apt-get install -y nodejs

RUN npm install -g npm eslint

# change shell to bash for terminal to work https://stackoverflow.com/a/72897273/4078503
USER odoo
ENV SHELL /bin/bash

# We will delay starting odoo until devcontainer postAttachCommand
CMD [ "sleep", "infinity" ]