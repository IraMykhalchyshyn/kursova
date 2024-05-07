CREATE TABLE IF NOT EXISTS `Appointment` (
	`appointmant_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`description` text NOT NULL,
	`appointmant_date` date NOT NULL,
	`client_id` int NOT NULL,
	`ageny_id` int,
	`seller_id` int,
	`status` varchar(50) NOT NULL,
	PRIMARY KEY (`appointmant_id`)
);

CREATE TABLE IF NOT EXISTS `Client` (
	`client_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`contacts` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`username` varchar(50) NOT NULL,
	`password` varchar(20) NOT NULL,
	PRIMARY KEY (`client_id`)
);

CREATE TABLE IF NOT EXISTS `Object` (
	`Object_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Seller_id` int NOT NULL,
	`description` text NOT NULL,
	`price` int NOT NULL,
	`Object_type` int NOT NULL,
	`Image` varchar(100) NOT NULL,
	`Floor` int NOT NULL,
	`Adding_date` datetime NOT NULL,
	`Rooms` int NOT NULL,
	`Area` float NOT NULL,
	`Repair_type` int NOT NULL,
	PRIMARY KEY (`Object_id`)
);

CREATE TABLE IF NOT EXISTS `Seller` (
	`Seller_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`contacts` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`username` varchar(50) NOT NULL,
	`password` varchar(20) NOT NULL,
	PRIMARY KEY (`Seller_id`)
);

CREATE TABLE IF NOT EXISTS `Agency` (
	`Agency_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Company_name` varchar(30) NOT NULL,
	`contacts` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`username` varchar(50) NOT NULL,
	`password` varchar(20) NOT NULL,
	PRIMARY KEY (`Agency_id`)
);

CREATE TABLE IF NOT EXISTS `Admin` (
	`Admin_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`first_name` varchar(30) NOT NULL,
	`last_name` varchar(30) NOT NULL,
	`contacts` varchar(20) NOT NULL,
	`email` varchar(50) NOT NULL,
	`username` varchar(50) NOT NULL,
	`password` varchar(20) NOT NULL,
	`autorization_id` int NOT NULL,
	PRIMARY KEY (`Admin_id`)
);

CREATE TABLE IF NOT EXISTS `Autorization` (
	`authKey` int AUTO_INCREMENT NOT NULL UNIQUE,
	`username` varchar(50) NOT NULL,
	`password` varchar(20) NOT NULL,
	`role` int NOT NULL,
	PRIMARY KEY (`authKey`)
);

CREATE TABLE IF NOT EXISTS `Content_Monitoring` (
	`Report_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Client_id` int,
	`Object_id` int,
	`Agency_id` int,
	`Seller_id` int,
	`Reason` varchar(255) NOT NULL,
	`Description` text NOT NULL,
	`Date_reported` date NOT NULL,
	PRIMARY KEY (`Report_id`)
);

CREATE TABLE IF NOT EXISTS `Recently_Viewed_Object` (
	`Object_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Client_id` int NOT NULL,
	`Date_reported` date NOT NULL,
	PRIMARY KEY (`Object_id`)
);

CREATE TABLE IF NOT EXISTS `Review` (
	`Review_id` int AUTO_INCREMENT NOT NULL UNIQUE,
	`Client_id` int NOT NULL,
	`Object_id` int NOT NULL,
	`Text` text NOT NULL,
	`Rating` int NOT NULL,
	PRIMARY KEY (`Review_id`)
);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk3` FOREIGN KEY (`client_id`) REFERENCES `Client`(`client_id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk4` FOREIGN KEY (`ageny_id`) REFERENCES `Agency`(`Agency_id`);

ALTER TABLE `Appointment` ADD CONSTRAINT `Appointment_fk5` FOREIGN KEY (`seller_id`) REFERENCES `Seller`(`Seller_id`);






ALTER TABLE `Content_Monitoring` ADD CONSTRAINT `Content_Monitoring_fk1` FOREIGN KEY (`Client_id`) REFERENCES `Client`(`client_id`);

ALTER TABLE `Content_Monitoring` ADD CONSTRAINT `Content_Monitoring_fk2` FOREIGN KEY (`Object_id`) REFERENCES `Object`(`Object_id`);

ALTER TABLE `Content_Monitoring` ADD CONSTRAINT `Content_Monitoring_fk3` FOREIGN KEY (`Agency_id`) REFERENCES `Agency`(`Agency_id`);

ALTER TABLE `Content_Monitoring` ADD CONSTRAINT `Content_Monitoring_fk4` FOREIGN KEY (`Seller_id`) REFERENCES `Seller`(`Seller_id`);
ALTER TABLE `Recently_Viewed_Object` ADD CONSTRAINT `Recently_Viewed_Object_fk0` FOREIGN KEY (`Object_id`) REFERENCES `Object`(`Object_id`);

ALTER TABLE `Recently_Viewed_Object` ADD CONSTRAINT `Recently_Viewed_Object_fk1` FOREIGN KEY (`Client_id`) REFERENCES `Client`(`client_id`);
ALTER TABLE `Review` ADD CONSTRAINT `Review_fk1` FOREIGN KEY (`Client_id`) REFERENCES `Client`(`client_id`);

ALTER TABLE `Review` ADD CONSTRAINT `Review_fk2` FOREIGN KEY (`Object_id`) REFERENCES `Object`(`Object_id`);