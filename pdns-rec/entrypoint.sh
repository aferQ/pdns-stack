#!/bin/bash
set -e

# Optional: print some info
echo "Starting PowerDNS Recursor..."

# Making socket dir
mkdir -p /var/run/pdns-recursor
chown -R $(whoami) /var/run/pdns-recursor


# Start pdns_recursor in foreground with proper options for Docker
exec pdns_recursor --config-dir=/etc/powerdns/ --daemon=no
