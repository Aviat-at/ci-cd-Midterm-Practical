#!/bin/bash

echo "🚀 Waiting for MySQL to start..."

# Use MySQL service name instead of localhost
until mysqladmin ping -h "mysql-db" --silent; do
    echo "⏳ MySQL is unavailable - sleeping..."
    sleep 5
done

echo "✅ MySQL is up - waiting 10 more seconds for full readiness..."
sleep 10  # Extra wait to ensure MySQL is stable

export MYSQL_PWD=${MYSQL_ROOT_PASSWORD}

echo "✅ Checking employees database..."
if ! mysql -h mysql-db -u root -e "USE employees"; then
    echo "🛠 Employees database does not exist. Creating and loading data..."
    mysql -h mysql-db -u root -e "CREATE DATABASE employees;"
    mysql -h mysql-db -u root employees < /docker-entrypoint-initdb.d/employees.sql
    echo "🎉 Employees database successfully loaded!"
else
    echo "✅ Employees database already exists, skipping import."
fi
