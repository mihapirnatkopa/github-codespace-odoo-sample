# -*- coding: utf-8 -*-
import debugpy
try:
    debugpy.listen(("0.0.0.0", 5678))
except ConnectionRefusedError as error:
    print(error)

from odoo import models

class Partner(models.Model):
    _inherit = 'res.partner'
