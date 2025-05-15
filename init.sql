-- Create the database
CREATE DATABASE IF NOT EXISTS userdb;

-- Switch to the database
USE userdb;

-- CREATE USER 'root'@'%' IDENTIFIED WITH caching_sha2_password BY 'root';


-- Alter the user's authentication method to mysql_native_admin123
ALTER USER 'root'@'%' IDENTIFIED WITH caching_sha2_password BY 'root';
--  Important:  Use '%' to allow connections from any host (including Docker containers).
--  If you know the specific host, replace '%' with the hostname or IP address.
--  For example,  'root'@'%'  or 'root'@'my-server-ip'.

-- Grant all privileges on the database.
GRANT ALL PRIVILEGES ON userdb.* TO 'root'@'%';
FLUSH PRIVILEGES;


GRANT SELECT, INSERT, UPDATE, DELETE ON userdb.* TO 'root'@'%';
FLUSH PRIVILEGES;
-- Create the users table
CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    role ENUM('Admin', 'User') NOT NULL
);