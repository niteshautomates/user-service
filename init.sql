-- Create the database
CREATE DATABASE IF NOT EXISTS userdb;

-- Switch to the database
USE userdb;

CREATE USER 'admin'@'user-service.hotel-ratings.svc.cluster.local' IDENTIFIED WITH caching_sha2_admin123 BY 'admin123';

-- Alter the user's authentication method to mysql_native_admin123
ALTER USER 'admin'@'user-service.hotel-ratings.svc.cluster.local' IDENTIFIED WITH caching_sha2_admin123 BY 'admin123';
--  Important:  Use '%' to allow connections from any host (including Docker containers).
--  If you know the specific host, replace '%' with the hostname or IP address.
--  For example,  'root'@'%'  or 'root'@'my-server-ip'.

-- Grant all privileges on the database.
GRANT ALL PRIVILEGES ON userdb.* TO 'admin'@'user-service.hotel-ratings.svc.cluster.local';
FLUSH PRIVILEGES;

-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role ENUM('Admin', 'User') NOT NULL
);