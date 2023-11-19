#!/bin/bash -i

# stop odoo service until we set some things up
sudo service odoo stop

# if /mnt/extra-addons is empty, create symbolic links to addons/* folders (local dev-container workaround)
if [ -z \"$(ls -A /mnt/extra-addons)\" ]; then sudo ln -snf ${localWorkspaceFolder}/addons/* /mnt/extra-addons; fi

# copy odoo.conf  (local dev-container workaround)
sudo cp ${localWorkspaceFolder}/odoo/config/odoo.conf /etc/odoo/

# install python requirements
sudo pip3 install -r ${localWorkspaceFolder}/requirements.txt

# start odoo service again
sudo service odoo start