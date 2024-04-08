CREATE TABLE IF NOT EXISTS `messages` (
	`id` int NOT NULL AUTO_INCREMENT,
	`username` varchar(255) NOT NULL,
	`message` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	PRIMARY KEY (`id`)
);
