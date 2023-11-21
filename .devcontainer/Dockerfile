# Any generic, debian-based image. ( https://github.com/devcontainers/features#usage )
FROM odoo:16.0

USER root

# Install some additional things
RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends postgresql-client git sudo wget

# Add sudo support for user odoo
RUN usermod -aG sudo odoo
RUN echo "odoo ALL=(ALL:ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN pip3 install pytest-odoo coverage pytest-html debugpy

# change shell to bash for terminal to work https://stackoverflow.com/a/72897273/4078503
USER odoo
ENV SHELL /bin/bash

# We will delay starting odoo until devcontainer postAttachCommand
CMD [ "sleep", "infinity" ]