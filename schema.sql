
-- Schema MySQL pour Médiateur.com
CREATE DATABASE IF NOT EXISTS mediateur DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE mediateur;
CREATE TABLE users (id INT AUTO_INCREMENT PRIMARY KEY, role ENUM('user','company','admin','mediator') DEFAULT 'user', name VARCHAR(200), email VARCHAR(200) UNIQUE, password_hash VARCHAR(255), phone VARCHAR(50), created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
CREATE TABLE products (id INT AUTO_INCREMENT PRIMARY KEY, seller_id INT, title VARCHAR(255), description TEXT, price DECIMAL(10,2), stock INT DEFAULT 0, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (seller_id) REFERENCES users(id) ON DELETE CASCADE);
CREATE TABLE orders (id INT AUTO_INCREMENT PRIMARY KEY, buyer_id INT, total DECIMAL(10,2), status ENUM('pending','paid','shipped','completed','disputed','cancelled') DEFAULT 'pending', created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP, FOREIGN KEY (buyer_id) REFERENCES users(id) ON DELETE CASCADE);
CREATE TABLE mediation_tickets (id INT AUTO_INCREMENT PRIMARY KEY, title VARCHAR(255), description TEXT, party_a INT, party_b INT, status ENUM('open','in_progress','resolved','closed') DEFAULT 'open', assigned_mediator INT, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);
