CREATE DATABASE LibraryManagement
GO

USE LibraryManagement

CREATE TABLE Book
(BookID int PRIMARY KEY NOT NULL,
 Title varchar (255) NOT NULL,
 PubName varchar (80))
 GO

CREATE TABLE Publisher
(PubName varchar(80) NOT NULL,
 PubAddress varchar(255),
 PubPhone varchar(12))
GO

CREATE TABLE BookAuthors
(BookID int FOREIGN KEY REFERENCES Book(BookID),
 AuthorName varchar(80) NOT NULL)
GO

CREATE TABLE LibraryBranch
(BranchID int PRIMARY KEY NOT NULL,
 BranchName varchar(50) NOT NULL,
 BranchAddress varchar(255) NOT NULL)
GO

CREATE TABLE BookCopies
(BookID int FOREIGN KEY REFERENCES Book(BookID),
 BranchID int FOREIGN KEY REFERENCES LibraryBranch(BranchID),
 NumberOfCopies int)
  GO

CREATE TABLE Borrower
(CardNo varchar(8) PRIMARY KEY NOT NULL,
 BorrowName varchar(80) NOT NULL,
 BorrowAddress varchar(255),
 BorrowPhone varchar(12))
GO

CREATE TABLE BookLoans
(BookID int FOREIGN KEY REFERENCES Book(BookID),
 BranchID int,
 CardNo int NOT NULL,
 DateOut date NOT NULL,
 DueDate date)
GO

INSERT INTO Book VALUES 
(1,'The Lost Tribe','Random House'),(2,'Watership Down','Big Inc'),
(3,'Eat an Apple','The Publishing Co'),(4,'It','Random House'),
(5,'The Big Dog','Random House'),(6,'Annie','The Publishing Co'),
(7,'Jaws','Random House'),(8,'People','Random House'),
(9,'The Last Days','Random House'),(10,'Orange Sunsets','Random House'),
(11,'The Wet Water','Big Inc.'),(12,'Another Day','Random House'),
(13,'Random Thoughts','Random House'),(14,'Other Words','Big Inc'),
(15,'Bulls and Horns','Big Inc'),(16,'The Apples Were Eaten','The Publishing Co'),
(17,'The Longest Title You Will See','Random House'),(18,'Dogs','Random House'),
(19,'Blue Stuff','Random House'),(20,'A Night Sky is Black','The Publishing Co')
GO

INSERT INTO Publisher VALUES
('Random House','New York',5553124567),
('The Publishing Co','Boston',4507774343),
('Big Inc','Los Angeles',3108881212)
GO

INSERT INTO BookAuthors VALUES
(1,'Bob Smith'),(2,'Bob Smith'),(3,'Trey White'),(4,'Stephen King'),
(5,'Amy Brown'),(6,'Amy Brown'),(7,'Amy Brown'),(8,'Karen School'),
(9,'Karen School'),(10,'Julio Jugo'),(11,'Bob Smith'),(12,'Sandy Cool'),
(13,'Sandy Cool'),(14,'Digger Phelps'),(15,'Bre Brillo'),(16,'Trip Simpson'),
(17,'Amy Brown'),(18,'Julio Jugo'),(19,'Bre Brillo'),(20,'Sam Cork')
GO

INSERT INTO LibraryBranch VALUES
(1,'Central','77 Main Street'),(2,'Sharpstown','88 Sharp Lane'),
(3,'West','456 West Avenue'),(4,'East','123 East Avenue')
GO

INSERT INTO BookCopies VALUES
(1,1,2),(2,1,2),(4,1,3),(6,1,2),(8,1,3),(10,1,4),(12,1,2),(14,1,2),(15,1,3),(17,1,2),
(20,2,4),(3,2,2),(5,2,3),(7,2,2),(9,2,4),(11,2,3),(13,2,2),(16,2,4),(18,2,2),(19,2,5),
(1,3,2),(4,3,2),(5,3,4),(8,3,2),(11,3,5),(12,3,3),(13,3,3),(14,3,4),(17,3,2),(20,3,2),
(2,4,2),(3,4,2),(4,4,4),(1,4,2),(6,4,2),(18,4,2),(20,4,2),(13,4,2),(7,4,2),(10,4,2),(1,2,4)
GO

INSERT INTO BookLoans VALUES
(1,1,12345678,'2014-02-11','2014-03-11'),(1,2,11111111,'2014-02-11','2014-03-11'),(3,1,22222222,'2014-02-11','2014-03-11'),
(4,3,33333333,'2014-02-11','2014-03-11'),(5,1,44444444,'2014-02-11','2014-03-11'),(8,4,55555555,'2014-02-11','2014-03-11'),
(20,2,66666666,'2014-03-12','2014-04-12'),(16,1,77777777,'2014-03-12','2014-04-12'),(11,3,88888888,'2014-03-12','2014-04-12'),
(2,1,99999999,'2014-06-18','2014-05-18'),(1,1,00000000,'2014-03-12','2014-04-12'),(10,1,12345678,'2014-03-12','2014-04-12'),
(3,2,12345678,'2014-06-18','2014-05-18'),(8,1,12345678,'2014-06-18','2014-05-18'),(12,1,12345678,'2014-06-18','2014-05-18'),
(4,3,12345678,'2014-06-18','2014-05-18'),(7,2,88888888,'2014-06-18','2014-05-18'),(3,2,88888888,'2014-06-18','2014-05-18'),
(5,4,88888888,'2014-07-10','2014-08-10'),(6,3,88888888,'2014-07-10','2014-08-10'),(3,3,88888888,'2014-07-10','2014-08-10'),
(6,1,88888888,'2014-07-10','2014-08-10'),(5,2,88888888,'2014-07-10','2014-08-10'),(1,4,88888888,'2014-07-10','2014-08-10'),
(7,2,12345678,'2014-11-20','2014-12-20'),(4,2,12345678,'2014-11-20','2014-12-20'),(15,1,12345678,'2014-11-20','2014-12-20'),
(8,3,12345678,'2014-11-20','2014-12-20'),(3,3,12345678,'2014-11-20','2014-12-20'),(14,2,12345678,'2014-11-20','2014-12-20'),
(9,4,12345678,'2015-01-04','2015-02-04'),(2,3,12345678,'2015-01-04','2015-02-04'),(13,3,12345678,'2015-01-04','2015-02-04'),
(10,1,12345678,'2015-01-04','2015-02-04'),(1,4,12345678,'2015-01-04','2015-02-04'),(12,4,12345678,'2015-01-04','2015-02-04'),
(11,2,12345678,'2015-08-11','2015-09-11'),(20,1,12345678,'2015-08-11','2015-09-11'),(11,1,12345678,'2015-08-11','2015-09-11'),
(12,2,12345678,'2015-08-11','2015-09-11'),(19,2,12345678,'2016-07-25','2016-08-25'),(10,2,12345678,'2016-07-25','2016-08-25'),
(13,3,12345678,'2015-09-21','2015-10-21'),(18,3,12345678,'2015-09-21','2015-10-21'),(9,3,12345678,'2015-09-21','2015-10-21'),
(14,4,12345678,'2015-11-11','2015-12-11'),(17,4,12345678,'2015-09-21','2015-10-21'),(9,4,12345678,'2015-09-21','2015-10-21'),
(15,1,12345678,'2015-11-11','2015-12-11'),(16,1,12345678,'2015-09-21','2015-10-21')
GO

INSERT INTO Borrower VALUES
(12345678,'Sue Reader','321 Book Street',3405556767),(11111111,'Bob Booky','123 West Street',3405557878),
(22222222,'Slim Shady','1 Range Avenue',3408885432),(33333333,'Claire Means','77 Homes Avenue',4327869943),
(44444444,'Ann Froll','8743 Main Street',3409876666),(55555555,'Scott Broom','555 Penny Lane',4326789933),
(66666666,'Courtney Williams','10 West 54th Avenue',3405551212),(77777777,'Chuck Taylor','88 Key Court',3409875432),
(88888888,'Bill Loon','1212 East Koop Street',3335559898),(99999999,'Don Duck','3333 Animation Street',3405557228),
(10000000,'Don Illiterate','101 Read Street',3405559876)
GO

