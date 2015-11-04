#!/bin/bash
sudo apt-get update
sudo apt-get install graphite-web graphite-carbon --yes
sudo apt-get install postgresql libpq-dev python-psycopg2

# sudo -u postgres psql
# CREATE USER graphite WITH PASSWORD 'password';
# CREATE DATABASE graphite WITH OWNER graphite;

# --configure graphite--
# sudo nano /etc/graphite/local_settings.py
# SECRET_KEY = 'a_salty_string'
# TIME_ZONE = 'America/Los_Angeles'
# DATABASES = {
#     'default': {
#         'NAME': 'graphite',
#         'ENGINE': 'django.db.backends.postgresql_psycopg2',
#         'USER': 'graphite',
#         'PASSWORD': 'password',
#         'HOST': '127.0.0.1',
#         'PORT': ''
#     }
# }
# --sync the db--
# sudo graphite-manage syncdb

# --configure carbon--
# sudo nano /etc/default/graphite-carbon
# CARBON_CACHE_ENABLED=true
# sudo nano /etc/carbon/carbon.conf
# ENABLE_LOGROTATION = True

# --configure storage schemas--
# sudo nano /etc/carbon/storage-schemas.conf
# add as needed

# --configue aggregation methods--
# sudo cp /usr/share/doc/graphite-carbon/examples/storage-aggregation.conf.example /etc/carbon/storage-aggregation.conf
# sudo nano /etc/carbon/storage-aggregation.conf
# sudo service carbon-cache start

# --installing apache--
sudo apt-get install apache2 libapache2-mod-wsgi
# sudo a2dissite 000-default
# sudo cp /usr/share/graphite-web/apache2-graphite.conf /etc/apache2/sites-available
# sudo a2ensite apache2-graphite
# sudo service apache2 reload

sudo apt-get install git nodejs devscripts debhelper
mkdir ~/build
cd ~/build
git clone https://github.com/etsy/statsd.git
cd statsd
dpkg-buildpackage
cd ..
sudo service carbon-cache stop
sudo dpkg -i statsd*.deb
# sudo service statsd stop
# sudo service carbon-cache start


# --configure statsd--
# {
#   graphitePort: 2003
# , graphiteHost: "localhost"
# , port: 8125
# , graphite: {
#     legacyNamespace: false
#   }
# }

# --create storage schema--
# sudo nano /etc/carbon/storage-schemas.conf
# [statsd]
# pattern = ^stats.*
# retentions = 10s:1d,1m:7d,10m:1y

# --create data aggregation--
# sudo nano /etc/carbon/storage-aggregation.conf
# [min]
# pattern = \.min$
# xFilesFactor = 0.1
# aggregationMethod = min
#
# [max]
# pattern = \.max$
# xFilesFactor = 0.1
# aggregationMethod = max
#
# [count]
# pattern = \.count$
# xFilesFactor = 0
# aggregationMethod = sum
#
# [lower]
# pattern = \.lower(_\d+)?$
# xFilesFactor = 0.1
# aggregationMethod = min
#
# [upper]
# pattern = \.upper(_\d+)?$
# xFilesFactor = 0.1
# aggregationMethod = max
#
# [sum]
# pattern = \.sum$
# xFilesFactor = 0
# aggregationMethod = sum
#
# [gauges]
# pattern = ^.*\.gauges\..*
# xFilesFactor = 0
# aggregationMethod = last
#
# [default_average]
# pattern = .*
# xFilesFactor = 0.5
# aggregationMethod = average
# sudo service carbon-cache stop      ## wait a few seconds here
# sudo service carbon-cache start

# sudo service statsd start


