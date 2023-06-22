CREATE TABLE Customer (
  ID INTEGER PRIMARY KEY,
  fname varchar(255) NOT NULL,
  lname varchar(255) NOT NULL,
  email varchar(255),
  phone_no INTEGER,
  customer_password VARCHAR(255)
);


--@block
CREATE TABLE Movie (
title varchar(255) PRIMARY KEY,
genre varchar(255),
descriptions varchar(255),
movie_duration varchar(5),
rate varchar(255),
movie_language varchar(255)
);

--@block
CREATE TABLE Theatre (
ID_no INTEGER PRIMARY KEY,
theatre_type varchar(255),
Toatal_seats INTEGER
);


--@block
CREATE TABLE Seat (
seat_ID INTEGER PRIMARY KEY,
seat_type varchar(255),
availability char(1),
Theatre_ID INTEGER,
foreign KEY (Theatre_ID) references Theatre(ID_no)
);


--@block
CREATE TABLE Movie_Show (
Movie_Title varchar(255),
show_date varchar(10),
show_time varchar(5),
theatre_ID INTEGER,
PRIMARY KEY (Movie_Title, show_date, show_time),
foreign KEY (Movie_Title) references Movie(title),
foreign KEY (Theatre_ID) references Theatre(ID_no)
);

--@block
CREATE INDEX show_date ON Movie_Show (show_date);
CREATE INDEX show_time ON Movie_Show (show_time);
--@block
CREATE TABLE Ticket (
ticket_ID INTEGER PRIMARY KEY,
customer_ID INTEGER,
seat_ID INTEGER,
Ticket_date varchar(10),
Ticket_time varchar(5),
Movie_Title varchar(255),
foreign KEY (customer_ID) references Customer(ID),
foreign KEY (seat_ID) references Seat(seat_ID),
foreign KEY (Ticket_date) references Movie_Show(show_date),
foreign KEY (Ticket_time) references Movie_Show(show_time),
foreign KEY (Movie_Title) references Movie_show(movie_title)
);

--@block
CREATE TABLE Seat_Type(
  seat_type VARCHAR(255) PRIMARY KEY,
  price numeric(6, 3)
);

--@block 
ALTER TABLE seat ADD CONSTRAINT seat_type FOREIGN KEY (seat_type) REFERENCES Seat_Type(seat_type);

--@block
INSERT INTO Customer
VALUES
  (1, 'Zainab', 'Ali', 'za@hotmail.com', 33333333, 'za#@_333'),
  (2, 'Isa', 'Husain', 'isa65@gmail.com', 34567899, 'husain_isa6565'),
  (3, 'Yosaif', 'Mahmood', 'yosaiffff@gmail.com', 31223455, 'ASDFGHJKL;'),
  (4, 'Faisal', 'Abdulla', 'faisalA@outlook.com', 39999999, 'aboYosaif11'),
  (5, 'Kawthar', 'Ahmed', 'koko123@hotmail.com', 66748821, 'kokoAhmed123'),
  (6, 'Ali', 'Kayan', 'ali.kayan01@gmail.com', 32145433, 'a_k32145433'),
  (7, 'Fran', 'Fine', 'franny@yahoo.com', 65432212, 'frannyfine@nyc'),
  (8, 'Semba', 'Mufasa', 'sembaaaaa@hotmail.com', 34557800, 'sembaTHEking'),
  (9, 'Sara', 'John', 'sara2023@gmail.com', 31234500, '20232023@sara'),
  (10, 'Zahraa', 'Nasser', 'zahoora.08@hotmail.com', 38844359, 'zxcvbnm2008'),
  (11, 'Eman', 'Yaseen', 'e.yassen@outlook.com', 65432122, 'abc123456789');

--@block
INSERT INTO movie
VALUES
  ('The Super Mario Bros. Movie', 'adventure', 'With help from Princess Peach, Mario gets ready to square off against the all-powerful Bowser to stop his plans from conquering the world.', '1:32', 'PG', 'English'),
  ('Encanto', 'animation', 'A Colombian teenage girl has to face the frustration of being the only member of her family without magical powers.', '1:42', 'PG', 'English'),
  ('Interstellar', 'sci-fi', 'A newly discovered wormhole in the far reaches of our solar system allows a team of astronauts to go where no man has gone before, a planet that may have the right environment to sustain human life.', '2:49', '12A', 'English'),
  ('Parasite', 'thriller', 'Greed and class discrimination threaten the newly formed symbiotic relationship between the wealthy Park family and the destitute Kim clan.', '2:12', '15', 'Korean'),
  ('Back to the Future', 'adventure', 'Marty McFly, a 17-year-old high school student, is accidentally sent 30 years into the past in a time-traveling DeLorean invented by his close friend, the maverick scientist Doc Brown.', '1:56', 'PG', 'English'),
  ('Spirited Away', 'animation', 'During her family move to the suburbs, a sullen 10-year-old girl wanders into a world ruled by gods, witches and spirits, a world where humans are changed into beasts.', '2:05', 'PG', 'Japanese'),
  ('Grave of the Fireflies', 'animation', 'A young boy and his little sister struggle to survive in Japan during World War II.', '1:29', '12A', 'Japanese'),
  ('Avengers: Infinity War', 'action', 'The Avengers and their allies must be willing to sacrifice all in an attempt to defeat the powerful Thanos before his blitz of devastation and ruin puts an end to the universe.', '2:29', '12A', 'English'),
  ('Joker', 'crime', 'The rise of Arthur Fleck, from aspiring stand-up comedian and pariah to Gotham clown prince and leader of the revolution.', '2:02', '15', 'English'),
  ('3 Idiots', 'comedy', 'Two friends are searching for their long lost companion. They revisit their college days and recall the memories of their friend who inspired them to think differently, even as the rest of the world called them "idiots".', '2:50', '12A', 'Indian');

--@block
INSERT INTO theatre
VALUES
  (1, 'standard', 160),
  (2, 'standard', 150),
  (3, 'standard', 200),
  (4, '3D', 155),
  (5, '3D', 155),
  (6, 'IMAX', 180),
  (7, 'IMAX', 160),
  (8, 'VIP', 120),
  (9, 'VIP', 130),
  (10, 'standard', 170);

  --@block
INSERT INTO Seat_Type
VALUES
('standard',3.5),
('VIP',6);


--@block
INSERT INTO Seat
 VALUES 
(11,'standard','Y',2),

(43,'standard','N',5),

(23,'VIP','Y',3),

(33,'VIP','Y',10),

(2,'standard','Y',6),

(7,'standard','N',7),

(54,'standard','N',9),

(6,'standard','Y',8),

(16,'standard','Y',1),

(76,'standard','Y',4),

(42, 'VIP','Y',2);

--@block
INSERT INTO Movie_Show
VALUES
('The Super Mario Bros. Movie', '11-05-2023', '20:30',3),
('Encanto','11-05-2023','22:00',4),
('Interstellar','10-05-2023','21:30',2),
('Parasite','12-05-2023','23:00',1),
('Back to the Future','12-05-2023','22:00',5),
('Spirited Away','14-05-2023','23:00',6),
('Grave of the Fireflies','13-05-2023','21:30',10),
('Avengers: Infinity War','10-05-2023','23:45',9),
('Joker','15-05-2023','21:00',7),
('3 Idiots','17-05-2023','23:00',8);

--@block
INSERT INTO Ticket
VALUES
(776555,6,2,'14-05-2023','23:00','Spirited Away'),
(666445,2,42,'10-05-2023','21:30','Interstellar'),
(777747,7,7,'15-05-2023','21:00','Joker'),
(444333,1,16,'12-05-2023','23:00','Parasite'),
(665544,3,23,'11-05-2023','20:30','The Super Mario Bros. Movie'),
(555444,10,33,'13-05-2023','21:30','Grave of the Fireflies'),
(549443,8,6,'17-05-2023','23:00','3 Idiots'),
(666111,4,76,'11-05-2023','22:00','Encanto'),
(844332,5,43,'12-05-2023','22:00','Back to the Future'),
(888889,9,54,'10-05-2023','23:45','Avengers: Infinity War'),
(689777,11,11,'10-05-2023','21:30','Interstellar');

--@block
-- calcualte number of tickets reserved for each movie in the date 10-05-2023 
SELECT COUNT(ticket_ID) AS number_of_tickets, Movie_Title
FROM ticket
WHERE Ticket_date = '10-05-2023'
GROUP BY Movie_Title;

--@block
-- show contact information for customers that booked tickets for the movie interstaller
SELECT ID, email, phone_no
FROM customer
WHERE ID IN (SELECT customer_ID FROM ticket WHERE Movie_Title = 'Interstellar');

--@block
-- show the theatre id for each ticket
SELECT ticket.*, seat.Theatre_ID FROM ticket
INNER JOIN seat
ON ticket.seat_ID = seat.seat_ID
ORDER BY Theatre_ID;
