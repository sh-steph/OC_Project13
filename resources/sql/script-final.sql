CREATE TABLE IF NOT EXISTS `authentication` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`username` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`password` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `user` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`auth_id` int NOT NULL,
	`firstname` varchar(255) NOT NULL,
	`lastname` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	`postal_code` varchar(255) NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `support` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`first_name` int NOT NULL,
	`last_name` int NOT NULL,
	`email` int NOT NULL,
	`password` int NOT NULL,
	`role` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `support_chat` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id` int NOT NULL,
	`support_id` int NOT NULL,
	`message` text NOT NULL,
	`created_at` timestamp NOT NULL,
	`updated_at` timestamp,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `rentals` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`car_id` int NOT NULL,
	`agency_id` int NOT NULL,
	`price_id` int NOT NULL,
	`status` boolean NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `rental_prices` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`car_model` varchar(255) NOT NULL,
	`price` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `cars` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`car_name` varchar(255) NOT NULL,
	`details` text NOT NULL,
	`photo_url` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `agencies` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`agency_name` varchar(255) NOT NULL,
	`email` varchar(255) NOT NULL,
	`phone` varchar(255) NOT NULL,
	`address` varchar(255) NOT NULL,
	`postal_code` varchar(255) NOT NULL,
	`country_code` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `user_rentals` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id` int NOT NULL,
	`car_id` int NOT NULL,
	`agency_id` int NOT NULL,
	`start_rent_date` int NOT NULL,
	`end_rent_date` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `reservation` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id` int NOT NULL,
	`user_rental_id` int NOT NULL,
	`status` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `payment_details` (
	`id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`user_id` int NOT NULL,
	`rental_id` int NOT NULL,
	`total` int NOT NULL,
	`payment_date` timestamp NOT NULL,
	`status` varchar(255) NOT NULL,
	PRIMARY KEY (`id`)
);


ALTER TABLE `user` ADD CONSTRAINT `user_fk1` FOREIGN KEY (`auth_id`) REFERENCES `authentication`(`id`);

ALTER TABLE `support_chat` ADD CONSTRAINT `support_chat_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `support_chat` ADD CONSTRAINT `support_chat_fk2` FOREIGN KEY (`support_id`) REFERENCES `support`(`id`);
ALTER TABLE `rentals` ADD CONSTRAINT `rentals_fk1` FOREIGN KEY (`car_id`) REFERENCES `cars`(`id`);

ALTER TABLE `rentals` ADD CONSTRAINT `rentals_fk2` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`);

ALTER TABLE `rentals` ADD CONSTRAINT `rentals_fk3` FOREIGN KEY (`price_id`) REFERENCES `rental_prices`(`id`);



ALTER TABLE `user_rentals` ADD CONSTRAINT `user_rentals_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `user_rentals` ADD CONSTRAINT `user_rentals_fk2` FOREIGN KEY (`car_id`) REFERENCES `cars`(`id`);

ALTER TABLE `user_rentals` ADD CONSTRAINT `user_rentals_fk3` FOREIGN KEY (`agency_id`) REFERENCES `agencies`(`id`);
ALTER TABLE `reservation` ADD CONSTRAINT `reservation_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `reservation` ADD CONSTRAINT `reservation_fk2` FOREIGN KEY (`user_rental_id`) REFERENCES `user_rentals`(`id`);
ALTER TABLE `payment_details` ADD CONSTRAINT `payment_details_fk1` FOREIGN KEY (`user_id`) REFERENCES `user`(`id`);

ALTER TABLE `payment_details` ADD CONSTRAINT `payment_details_fk2` FOREIGN KEY (`rental_id`) REFERENCES `rentals`(`id`);