#!/bin/bash -i

# load enviroment variables from initializeCommand.sh
source .devcontainer/.env

# install Odoo App DebugPY for Visual Studio Code
mkdir ../addons/odoo-vscode && git clone https://github.com/tosolini/odoo-vscode.git ../addons/odoo-vscode

# stop odoo service until we set some things up
sudo service odoo stop

# local dev-container workaround
if [[ $localWorkspaceFolder != "/var/lib/docker/codespacemount"* ]]; then    

    # remove existing links in /mnt/extra-addons 
    find /mnt/extra-addons -maxdepth 1 -type l -delete

    # if /mnt/extra-addons is empty, create symbolic links to addons/* folders
    if [ -z \"$(ls -A /mnt/extra-addons)\" ]; then sudo ln -snf ${localWorkspaceFolder}/addons/* /mnt/extra-addons; fi

    # link odoo.conf
    sudo rm /etc/odoo/odoo.conf
    sudo ln -s ${localWorkspaceFolder}/odoo/config/odoo.conf /etc/odoo/
fi

# start odoo service again
sudo service odoo start

# install python requirements
sudo pip3 install -r ./requirements.txt



