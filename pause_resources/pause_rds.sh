#!/bin/bash
# Stop RDS instance
aws rds stop-db-instance --db-instance-identifier rds-db

# Wait for stopped state
aws rds wait db-instance-stopped --db-instance-identifier rds-db
echo "RDS instance stopped."

# To start later, run:
# aws rds start-db-instance --db-instance-identifier rds-db
 #aws rds wait db-instance-available --db-instance-identifier rds-db
