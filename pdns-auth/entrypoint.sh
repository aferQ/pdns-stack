#!/bin/bash
set -e

# Install mysql-client if not already present 
if ! command -v mysqladmin &> /dev/null; then
    echo "[INFO] mysqladmin not found, installing..."
    apt-get update && apt-get install -y default-mysql-client
fi

# Start PowerDNS (assuming it is installed and pdns.conf is in /etc/powerdns/)
exec pdns_server --daemon=no --guardian=no --control-console --config-dir=/etc/powerdns/
