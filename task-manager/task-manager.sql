CREATE DATABASE task_manager;

USE task_manager;

CREATE TABLE `users` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(60) NOT NULL,
  email VARCHAR(60) NOT NULL,
  password VARCHAR(60) NOT NULL,
  created_at DATE NOT NULL DEFAULT (CURRENT_DATE)
);

CREATE TABLE `tasks` (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(60),
  description TEXT,
  priority ENUM('low', 'medium', 'high') DEFAULT 'low',
  status ENUM('pending', 'doing', 'done') DEFAULT 'pending',
  user_id INT NOT NULL,
  created_at DATE NOT NULL DEFAULT (CURRENT_DATE),
  updated_at DATETIME NOT NULL DEFAULT (CURRENT_TIMESTAMP) ON UPDATE CURRENT_TIMESTAMP,
  CONSTRAINT fk_users_tasks FOREIGN KEY (user_id) REFERENCES users(id)
);