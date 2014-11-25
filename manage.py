#!/usr/bin/env python
import os
import sys

# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
# NOTICE - 25/11/2014 - This only for alterantive configuration backup.
# Patch only for PyMySql python conector. Don use it otherwise.
# See further, on: 
# ( https://wiki.enredaos.net/index.php?title=CICICdev/november#PyDev_.2F_Eclipse )
# import pymysql
# pymysql.install_as_MySQLdb()
# ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

#os.environ['DJANGO_SETTINGS_MODULE'] = 'Config.settings'

if __name__ == "__main__":
    os.environ.setdefault("DJANGO_SETTINGS_MODULE", "Config.settings")

    from django.core.management import execute_from_command_line

    execute_from_command_line(sys.argv)
