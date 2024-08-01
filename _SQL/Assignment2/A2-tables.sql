CREATE DATABASE `assignment1`;
USE `assignment1`;
CREATE TABLE `t_provider`(
	`provider_id` VARCHAR(50) NOT NULL,
    `provider_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`provider_id`)
);
CREATE TABLE `t_expertise`(
	`expertise_id` VARCHAR(50) NOT NULL,
    `expertise_name` VARCHAR(50) NOT NULL,
    PRIMARY KEY (`expertise_id`)
    
);
CREATE TABLE `t_provider_expertise`(
	`provider_id` VARCHAR(50) NOT NULL,
    `expertise_id` VARCHAR(50) NOT NULL,
	FOREIGN KEY (`provider_id`)
		REFERENCES `t_provider`(`provider_id`),
	FOREIGN KEY (`expertise_id`)
		REFERENCES `t_expertise`(`expertise_id`),
	PRIMARY KEY (`provider_id` , `expertise_id`)
);
CREATE TABLE `t_service`(
	`service_id` VARCHAR(50) NOT NULL,
    `service_name` VARCHAR(50) NOT NULL,
    `provider_id` VARCHAR(50) NOT NULL,
    `price` DECIMAL NOT NULL,
    PRIMARY KEY (`service_id`),
    FOREIGN KEY (`provider_id`)
		REFERENCES `t_provider`(`provider_id`)
);
CREATE TABLE `t_consumer` (
	`consumer_id` VARCHAR(50) NOT NULL,
	`consumer_name` VARCHAR(50) NOT NULL,
    `email` VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY (`consumer_id`)
);
CREATE TABLE `t_consumer_referrer`(
	`consumer_id` VARCHAR(50) NOT NULL,
    `referrer_consumer_id` VARCHAR(50) NOT NULL,
    `time` TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (`consumer_id`),
    FOREIGN KEY (`consumer_id`)
		REFERENCES `t_consumer`(`consumer_id`),
    FOREIGN KEY (`referrer_consumer_id`)
		REFERENCES `t_consumer`(`consumer_id`)
);
CREATE TABLE `t_appointment` (
	`appointment_id` VARCHAR(50) NOT NULL,
    `consumer_id` VARCHAR(50) NOT NULL,
    `provider_id` VARCHAR(50) NOT NULL,
    `service_id` VARCHAR(50) NOT NULL,
    `time` TIMESTAMP DEFAULT NOW(),
    PRIMARY KEY (`appointment_id`),
    FOREIGN KEY (`consumer_id`)
		REFERENCES `t_consumer`(`consumer_id`),
    FOREIGN KEY (`provider_id`)	
		REFERENCES `t_provider`(`provider_id`),
	FOREIGN KEY (`service_id`)
		REFERENCES `t_service`(`service_id`)
);
CREATE TABLE `t_review` (
	`review_id` VARCHAR(50) NOT NULL,
	`appointment_id` VARCHAR(50) NOT NULL UNIQUE,
    `rating` DECIMAL(2,1) NOT NULL CHECK (`rating` >= 0.0 AND `rating` <= 5.0 ),
    `comment` TEXT NULL,
    PRIMARY KEY (`review_id`),
    FOREIGN KEY (`appointment_id`)
		REFERENCES `t_appointment`(`appointment_id`)
);