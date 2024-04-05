#!/bin/bash

set -ex

wget https://downloads.mysql.com/docs/sakila-db.zip

unzip sakila-db.zip

wget https://downloads.mysql.com/docs/world-db.zip

unzip world-db.zip

#wget https://downloads.mysql.com/docs/airport-db.zip

#unzip airport-db.zip

wget https://downloads.mysql.com/docs/menagerie-db.zip

unzip menagerie-db.zip

git clone --recursive --depth=1 https://github.com/datacharmer/test_db employee-db
