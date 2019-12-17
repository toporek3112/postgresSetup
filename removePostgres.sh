#!/bin/bash

apt-get --purge remove pgdg-keyring -y
apt-get --purge remove postgresql-10 -y
apt-get --purge remove postgresql-client-10 -y
apt-get --purge remove postgresql-client-common -y
apt-get --purge remove postgresql-common -y
