--Queries

--1
SELECT BC.BookID, Title, BranchName, NumberOfCopies
FROM BookCopies as BC
INNER JOIN LibraryBranch as LB
ON BC.BranchID = LB.BranchID
INNER JOIN Book
ON BC.BookID = Book.BookID
WHERE Title = 'The Lost Tribe' AND BranchName = 'Sharpstown'

--2
SELECT BC.BookID, Title, BranchName, NumberOfCopies
FROM BookCopies as BC
INNER JOIN LibraryBranch as LB
ON BC.BranchID = LB.BranchID
INNER JOIN Book
ON BC.BookID = Book.BookID
WHERE Title = 'The Lost Tribe'

--3
SELECT B.CardNo, BorrowName, DateOut
FROM Borrower as B
INNER JOIN BookLoans as BL
ON B.CardNo = BL.CardNo
WHERE DateOut IS NULL

--4
SELECT Title, BorrowName, BorrowAddress, BranchName, DueDate
FROM Book
INNER JOIN BookLoans as BL
ON Book.BookID = BL.BookID
INNER JOIN LibraryBranch as LB
ON BL.BranchID = LB.BranchID
INNER JOIN Borrower as B
ON BL.CardNo = B.CardNo
WHERE DueDate = '2016-08-25' AND BranchName = 'Sharpstown'

--5
SELECT BranchName, COUNT(*) AS TotalBranchCheckouts
FROM BookLoans as BL
INNER JOIN LibraryBranch as LB
ON BL.BranchID = LB.BranchID
GROUP BY BranchName

--6
SELECT BorrowName, BorrowAddress, COUNT(*) AS TotalCheckouts
FROM BookLoans as BL
INNER JOIN Borrower as B
ON BL.CardNo = B.CardNo
GROUP BY BorrowName, BorrowAddress
HAVING COUNT(BorrowName) > 5

--7
SELECT Title, AuthorName, NumberOfCopies, LB.BranchName
FROM Book
INNER JOIN BookAuthors as BA
ON Book.BookID = BA.BookID
INNER JOIN BookCopies as BC
ON BA.BookID = BC.BookID
INNER JOIN LibraryBranch as LB
ON BC.BranchID = LB.BranchID
WHERE BA.AuthorName = 'Stephen King' AND LB.BranchName = 'Central'

--Stored Procedure for 2
CREATE PROC LocationOfCopies @Title varchar(50) = 'The Lost Tribe'
AS
SELECT BC.BookID, Title, BranchName, NumberOfCopies
FROM BookCopies as BC
INNER JOIN LibraryBranch as LB
ON BC.BranchID = LB.BranchID
INNER JOIN Book
ON BC.BookID = Book.BookID
WHERE Title = @Title