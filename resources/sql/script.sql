CREATE TABLE IF NOT EXISTS `USERS` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`admin` BOOLEAN NOT NULL DEFAULT false,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `MESSAGES` (
	`id` int NOT NULL AUTO_INCREMENT,
	`user_id` int NOT NULL,
	`message` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	PRIMARY KEY (`id`)
);


ALTER TABLE `MESSAGES` ADD CONSTRAINT `MESSAGES_fk2` FOREIGN KEY (`user_id`) REFERENCES `USERS`(`id`);

