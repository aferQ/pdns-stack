-- PowerDNS Auth database
CREATE DATABASE IF NOT EXISTS pdns CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'pdns'@'%' IDENTIFIED BY 'zaq1@WSX';
GRANT ALL PRIVILEGES ON pdns.* TO 'pdns'@'%';

-- PowerDNS-Admin database
CREATE DATABASE IF NOT EXISTS powerdnsadmin CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER IF NOT EXISTS 'pdnsadmin'@'%' IDENTIFIED BY 'adminpass';
GRANT ALL PRIVILEGES ON powerdnsadmin.* TO 'pdnsadmin'@'%';

FLUSH PRIVILEGES;
