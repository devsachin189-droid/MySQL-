-- =============================================
-- LIBRARY DATABASE - FINAL PROJECT (4 TABLES)
-- =============================================
CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;

DROP TABLE IF EXISTS Fines;
DROP TABLE IF EXISTS Issue_Return_Records;
DROP TABLE IF EXISTS Books;
DROP TABLE IF EXISTS Members;

-- Table 1: Books
CREATE TABLE Books (
    BookID INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    Author VARCHAR(100),
    ISBN VARCHAR(20) UNIQUE,
    PublishedYear INT,
    Genre VARCHAR(50),
    AvailableCopies INT DEFAULT 10,
    Status VARCHAR(20) DEFAULT 'Available'
);

-- Table 2: Members
CREATE TABLE Members (
    MemberID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(100) NOT NULL,
    Email VARCHAR(100) UNIQUE,
    Phone VARCHAR(20),
    JoinDate DATE,
    MembershipStatus VARCHAR(20) DEFAULT 'Active'
);

-- Table 3: Issue_Return_Records
CREATE TABLE Issue_Return_Records (
    IssueID INT PRIMARY KEY AUTO_INCREMENT,
    BookID INT,
    MemberID INT,
    IssueDate DATE NOT NULL,
    DueDate DATE NOT NULL,
    ReturnDate DATE,
    Status VARCHAR(20) DEFAULT 'Issued',
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);

-- Table 4: Fines
CREATE TABLE Fines (
    FineID INT PRIMARY KEY AUTO_INCREMENT,
    IssueID INT UNIQUE,
    Amount DECIMAL(8,2),
    Reason VARCHAR(100),
    FineDate DATE,
    PaidStatus VARCHAR(20) DEFAULT 'Unpaid',
    FOREIGN KEY (IssueID) REFERENCES Issue_Return_Records(IssueID)
);

-- =============================================
-- SAMPLE DATA - 20 ROWS EACH
-- =============================================
INSERT INTO Books (Title, Author, ISBN, PublishedYear, Genre) VALUES
('DBMS Concepts', 'Korth', 'ISBN001', 2020, 'Academic'),
('Operating System', 'Galvin', 'ISBN002', 2019, 'Academic'),
('Let Us C', 'Y. Kanetkar', 'ISBN003', 2021, 'Programming'),
('Python Basics', 'Mark Lutz', 'ISBN004', 2022, 'Programming'),
('Half Girlfriend', 'Chetan Bhagat', 'ISBN005', 2014, 'Fiction'),
('Wings of Fire', 'A.P.J. Kalam', 'ISBN006', 1999, 'Biography'),
('Harry Potter 1', 'J.K. Rowling', 'ISBN007', 1997, 'Fantasy'),
('Rich Dad Poor Dad', 'Kiyosaki', 'ISBN008', 1997, 'Finance'),
('Atomic Habits', 'James Clear', 'ISBN009', 2018, 'Self-Help'),
('The Alchemist', 'Paulo Coelho', 'ISBN010', 1988, 'Fiction'),
('Clean Code', 'Robert Martin', 'ISBN011', 2008, 'Programming'),
('CN Networks', 'Tanenbaum', 'ISBN012', 2020, 'Academic'),
('AI Basics', 'Stuart Russell', 'ISBN013', 2021, 'Academic'),
('Malgudi Days', 'R.K. Narayan', 'ISBN014', 1943, 'Fiction'),
('Godan', 'Premchand', 'ISBN015', 1936, 'Novel'),
('Gitanjali', 'Tagore', 'ISBN016', 1910, 'Poetry'),
('Discovery of India', 'Nehru', 'ISBN017', 1946, 'History'),
('C++ Programming', 'Bjarne', 'ISBN018', 2022, 'Programming'),
('Data Structures', 'Seymour', 'ISBN019', 2020, 'Academic'),
('Machine Learning', 'Tom Mitchell', 'ISBN020', 2017, 'Academic');

INSERT INTO Members (Name, Email, Phone, JoinDate) VALUES
('Amit Sharma', 'amit01@gmail.com', '9876543210', '2024-01-10'),
('Priya Verma', 'priya02@gmail.com', '9876543211', '2024-01-15'),
('Rohan Gupta', 'rohan03@gmail.com', '9876543212', '2024-02-01'),
('Sneha Patel', 'sneha04@gmail.com', '9876543213', '2024-02-10'),
('Vikas Kumar', 'vikas05@gmail.com', '9876543214', '2024-03-05'),
('Anjali Singh', 'anjali06@gmail.com', '9876543215', '2024-03-20'),
('Arjun Mehra', 'arjun07@gmail.com', '9876543216', '2024-04-01'),
('Pooja Yadav', 'pooja08@gmail.com', '9876543217', '2024-04-12'),
('Karan Joshi', 'karan09@gmail.com', '9876543218', '2024-05-01'),
('Neha Agarwal', 'neha10@gmail.com', '9876543219', '2024-05-15'),
('Deepak Raj', 'deepak11@gmail.com', '9876543220', '2024-06-01'),
('Kavita Rao', 'kavita12@gmail.com', '9876543221', '2024-06-10'),
('Manish Tiwari', 'manish13@gmail.com', '9876543222', '2024-07-01'),
('Ritu Sharma', 'ritu14@gmail.com', '9876543223', '2024-07-15'),
('Sanjay Verma', 'sanjay15@gmail.com', '9876543224', '2024-08-01'),
('Meena Kumari', 'meena16@gmail.com', '9876543225', '2024-08-10'),
('Rajesh Khanna', 'rajesh17@gmail.com', '9876543226', '2024-08-20'),
('Sunita Devi', 'sunita18@gmail.com', '9876543227', '2024-09-01'),
('Aman Singh', 'aman19@gmail.com', '9876543228', '2024-09-10'),
('Divya Patel', 'divya20@gmail.com', '9876543229', '2024-09-20');

INSERT INTO Issue_Return_Records (BookID, MemberID, IssueDate, DueDate, ReturnDate, Status) VALUES
(1, 1, '2026-08-01', '2026-08-15', '2026-08-14', 'Returned'),
(2, 2, '2026-08-02', '2026-08-16', NULL, 'Issued'),
(3, 3, '2026-08-03', '2026-08-17', '2026-08-20', 'Returned'),
(4, 4, '2026-08-05', '2026-08-19', NULL, 'Overdue'),
(5, 5, '2026-08-06', '2026-08-20', '2026-08-19', 'Returned'),
(6, 1, '2026-08-07', '2026-08-21', NULL, 'Issued'),
(7, 2, '2026-08-08', '2026-08-22', '2026-08-25', 'Returned'),
(8, 6, '2026-08-10', '2026-08-24', NULL, 'Issued'),
(9, 7, '2026-08-11', '2026-08-25', NULL, 'Overdue'),
(10, 8, '2026-08-12', '2026-08-26', '2026-08-26', 'Returned'),
(11, 9, '2026-08-13', '2026-08-27', NULL, 'Issued'),
(12, 10, '2026-08-14', '2026-08-28', NULL, 'Issued'),
(13, 11, '2026-08-15', '2026-08-29', '2026-09-02', 'Returned'),
(1, 12, '2026-08-16', '2026-08-30', NULL, 'Issued'),
(2, 13, '2026-08-17', '2026-08-31', NULL, 'Overdue'),
(3, 14, '2026-08-18', '2026-09-01', '2026-08-31', 'Returned'),
(4, 15, '2026-08-19', '2026-09-02', NULL, 'Issued'),
(5, 16, '2026-08-20', '2026-09-03', '2026-09-05', 'Returned'),
(6, 17, '2026-08-21', '2026-09-04', NULL, 'Issued'),
(7, 18, '2026-08-22', '2026-09-05', NULL, 'Issued');

INSERT INTO Fines (IssueID, Amount, Reason, FineDate, PaidStatus) VALUES
(3, 30.00, 'Late Return 3 days', '2026-08-20', 'Unpaid'),
(4, 50.00, 'Overdue', '2026-08-20', 'Unpaid'),
(7, 30.00, 'Late Return 3 days', '2026-08-25', 'Paid'),
(9, 100.00, 'Overdue 10 days', '2026-08-26', 'Unpaid'),
(13, 40.00, 'Late Return 4 days', '2026-09-02', 'Unpaid'),
(15, 70.00, 'Overdue', '2026-09-01', 'Unpaid'),
(18, 20.00, 'Late Return 2 days', '2026-09-05', 'Paid');
SELECT m.Name, b.Title, i.IssueDate, i.DueDate, i.Status
FROM Issue_Return_Records i
JOIN Members m ON i.MemberID = m.MemberID
JOIN Books b ON i.BookID = b.BookID;
SELECT MemberID, COUNT(*) AS TotalBooks
FROM Issue_Return_Records
GROUP BY MemberID HAVING COUNT(*) > 1;
SELECT Title FROM Books 
WHERE BookID NOT IN (SELECT BookID FROM Issue_Return_Records);
CREATE VIEW Overdue_List AS
SELECT m.Name, b.Title, i.DueDate, f.Amount
FROM Issue_Return_Records i
JOIN Members m ON i.MemberID = m.MemberID
JOIN Books b ON i.BookID = b.BookID
LEFT JOIN Fines f ON i.IssueID = f.IssueID
WHERE i.DueDate < CURDATE() AND i.Status != 'Returned';

SELECT * FROM Overdue_List;
DELIMITER //
-- Trigger: Auto create fine if returned late
CREATE TRIGGER auto_fine AFTER UPDATE ON Issue_Return_Records
FOR EACH ROW
BEGIN
  IF NEW.ReturnDate > NEW.DueDate THEN
    INSERT INTO Fines (IssueID, Amount, Reason, FineDate)
    VALUES (NEW.IssueID, DATEDIFF(NEW.ReturnDate, NEW.DueDate)*10, 'Late Return', NEW.ReturnDate);
  END IF;
END //

-- Procedure: Issue a book
CREATE PROCEDURE IssueBook(IN p_BookID INT, IN p_MemberID INT)
BEGIN
  INSERT INTO Issue_Return_Records (BookID, MemberID, IssueDate, DueDate)
  VALUES (p_BookID, p_MemberID, CURDATE(), DATE_ADD(CURDATE(), INTERVAL 14 DAY));
  UPDATE Books SET AvailableCopies = AvailableCopies -1 WHERE BookID = p_BookID;
END //
DELIMITER ;