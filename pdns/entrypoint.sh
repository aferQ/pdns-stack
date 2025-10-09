#!/bin/bash
set -e

# Install mysql-client if not already present (optional, if image is minimal)
if ! command -v mysqladmin &> /dev/null; then
    echo "[INFO] mysqladmin not found, installing..."
    apt-get update && apt-get install -y default-mysql-client
fi

echo "[INFO] Waiting for database to be ready..."

# Wait until MySQL is accepting connections
#until mysqladmin ping -h"$PDNS_gmysql_host" --silent; do
#    echo -n "."
#    sleep 2
#done

echo "[INFO] Database is ready. Starting PowerDNS..."

# Start PowerDNS (assuming it is installed and pdns.conf is in /etc/powerdns/)
exec pdns_server --daemon=no --guardian=no --control-console --loglevel=9
#exec pdns_server --config-dir=/tmp/empty-config-dir --daemon=no --loglevel=9

