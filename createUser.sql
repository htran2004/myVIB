# Create DB and username/password and Grant all privileges to this user.
CREATE DATABASE myproject;
CREATE USER 'myproject'@'%' IDENTIFIED BY 'mypassword';
GRANT ALL PRIVILEGES ON myproject.* TO 'myproject'@'%';
FLUSH PRIVILEGES;
