#!/bin/bash

# Database credentials
DB_USER="your_db_user"
DB_PASS="your_db_password"
DB_HOST="localhost"

# Initialize database
echo "Initializing database..."
mysql -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" < mbdatabase_create.sql

# Insert test data
echo "Inserting room data..."
mysql -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" < insertRoomData.sql

echo "Database setup and test data insertion complete!"