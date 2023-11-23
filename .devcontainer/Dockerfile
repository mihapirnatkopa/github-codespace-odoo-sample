# Any generic, debian-based image. ( https://github.com/devcontainers/features#usage )
FROM odoo:16.0

USER root

# Install some additional things
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client git sudo wget screen inotify-tools psmisc procps

# Add sudo support for user odoo
RUN usermod -aG sudo odoo
RUN echo "odoo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN pip3 install pytest-odoo coverage pytest-html debugpy ruff

# Nodesource https://github.com/nodesource/distributions#debian-versions
RUN apt-get install -y ca-certificates curl gnupg
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
RUN echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | tee /etc/apt/sources.list.d/nodesource.list
RUN apt-get update
RUN apt-get install nodejs -y
RUN npm install -g npm eslint

# change shell to bash for terminal to work https://stackoverflow.com/a/72897273/4078503
USER odoo
ENV SHELL /bin/bash

# We will delay starting odoo until devcontainer postAttachCommand
CMD [ "sleep", "infinity" ]