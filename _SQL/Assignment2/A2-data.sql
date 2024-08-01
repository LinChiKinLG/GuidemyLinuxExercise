USE `assignment1`;

INSERT INTO t_consumer (consumer_id, consumer_name, email) VALUES 
('1', 'John Doe', 'john.doe@example.com'),
('2', 'Mary Jane', 'mary.jane@example.com'),
('3', 'Jack Black', 'jack.black@example.com');

INSERT INTO t_consumer_referrer (consumer_id,referrer_consumer_id,`time`) VALUES
('1', '2',NOW());

INSERT INTO t_provider (provider_id, provider_name) VALUES
('1', 'Provider #1'),
('2', 'Provider #2');

INSERT INTO t_expertise (expertise_id, expertise_name) VALUES
('1', 'Haircut'),
('2', 'Yoga Training');

INSERT INTO t_provider_expertise (provider_id, expertise_id) VALUES
('1', '1'),
('2', '2');

INSERT INTO t_service (service_id, service_name, price, provider_id) VALUES
('1', 'Super Cool Haircut Service', 29.99, '1');

INSERT INTO t_appointment (appointment_id, provider_id, consumer_id, service_id) VALUES
('1', '1', '1', '1');

INSERT INTO t_review (review_id, appointment_id, rating, `comment`) VALUES
('1', '1', 4.5, 'I love it! Awesome haircut!');