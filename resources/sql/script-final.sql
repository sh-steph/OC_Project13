CREATE TABLE IF NOT EXISTS `USERS` (
	`id` int AUTO_INCREMENT NOT NULL,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`admin` boolean NOT NULL,
	`email` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	`update_at` timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `SESSIONS` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp,
	`user_id` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `MESSAGES` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`session_id` int NOT NULL,
	`user_id` int NOT NULL,
	`content` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp,
	PRIMARY KEY (`id`)
);


ALTER TABLE `SESSIONS` ADD CONSTRAINT `SESSIONS_fk3` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`id`);
ALTER TABLE `MESSAGES` ADD CONSTRAINT `MESSAGES_fk1` FOREIGN KEY (`session_id`) REFERENCES `SESSIONS`(`id`);

ALTER TABLE `MESSAGES` ADD CONSTRAINT `MESSAGES_fk2` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`id`);