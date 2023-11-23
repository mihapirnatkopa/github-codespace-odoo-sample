#!/bin/bash -i

# load enviroment variables from initializeCommand.sh
source .devcontainer/.env

# local dev-container workaround
if [[ $localWorkspaceFolder != "/var/lib/docker/codespacemount"* ]]; then    
    # link odoo.conf
    sudo rm /etc/odoo/odoo.conf
    sudo ln -s ${localWorkspaceFolder}/odoo/config/odoo.conf /etc/odoo/
    (sleep 5 && sudo ln -snf /usr/lib/python3/dist-packages/odoo ${localWorkspaceFolder}/odoo/src) &
    screen -d -m env WS=${localWorkspaceFolder} bash -c 'while true; do odoo -c /etc/odoo/odoo.conf --dev=all --log-level=debug --addons-path ${WS}/addons/; sleep 1; done'
else
    (sleep 5 && sudo ln -snf /usr/lib/python3/dist-packages/odoo /workspace/odoo/src) &
    screen -d -m env WS=/workspace bash -c 'while true; do odoo -c /etc/odoo/odoo.conf --dev=all --log-level=debug --addons-path /workspace/addons/; sleep 1; done'
fi

# install python requirements
sudo pip3 install -r ./requirements.txt
