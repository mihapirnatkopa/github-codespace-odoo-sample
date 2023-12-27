# GitHub Codespaces ♥️ Odoo sample

Trying to support both GitHub Codespaces and local VS Code Dev-Containers

A bug in local dev-containers:
>NOENT: no such file or directory, lstat no such file /root/.vscode-dev-container' .... node_modules/vscode-dev-containers/container-features\

*Workaround:* install older version `v0.299.0` of extension `ms-vscode-remote.remote-containers`, see [microsoft/vscode-remote-release ISSUE "ENOENT: no such file or directory"](https://github.com/microsoft/vscode-remote-release/issues/6844#issuecomment-1252288457)

## Devcontainer features
- Unit tests with [pytest](https://docs.pytest.org/) and [pytest-odoo](https://github.com/camptocamp/pytest-odoo)
- Debugging with [debugpy](https://github.com/microsoft/debugpy) and [odoo-vscode](https://github.com/tosolini/odoo-vscode)

## Odoo login
User: admin\
Pass: admin


## Pgadmin connection setup
Host: db\
Database: odoodb\
User: odoo\
Pass: myodoo

## Odoo server log in terminal
tail -f /var/log/odoo/odoo-server.log 

## Enterprise
- Unpack enterprise modules under */workspace/enterprise*
- Rebuild container
- Install *web_enterprise* module

Documentation: [Switch from Community to Enterprise](https://www.odoo.com/documentation/16.0/administration/maintain/enterprise.html)