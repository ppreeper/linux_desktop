#!/bin/bash
#SQLite
sudo apt -y install sqlite3 libdbd-sqlite3
#PostgreSQL
sudo apt -y install postgresql-client postgresql-server-dev-all libdbd-pgsql
#FreeTDS
sudo apt -y install freetds-bin freetds-dev tdsodbc unixodbc unixodbc-bin unixodbc-dev libdbd-freetds 
#MDB Tools
sudo apt -y install mdbtools-gmdb
#MariaDB
sudo apt -y install mariadb-client libmariadbd-dev libdbd-mysql
#MongoDB
sudo apt -y install mongodb-clients mongodb-tools
