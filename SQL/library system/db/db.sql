-- Library Table
CREATE TABLE Library (
    lib_name VARCHAR(100) PRIMARY KEY,
    lib_city_town VARCHAR(50),
    books_quantity INT
);

-- Book Table
CREATE TABLE Book (
    isbn VARCHAR(20) PRIMARY KEY,
    book_name VARCHAR(255) NOT NULL,
    lib_name VARCHAR(100),
    author_name VARCHAR(100),
    FOREIGN KEY (lib_name) REFERENCES Library(lib_name)
);

-- Customer Table
CREATE TABLE Customer (
    customer_name VARCHAR(100) PRIMARY KEY,
    customer_city VARCHAR(50),
    customer_street VARCHAR(100)
);

-- Account Table
CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    library_name VARCHAR(100),
    loan_balance DECIMAL(6,2),
    FOREIGN KEY (library_name) REFERENCES Library(lib_name)
);

-- Loan Table
CREATE TABLE Loan (
    loan_id SERIAL PRIMARY KEY,
    loan_time_left INT,
    loan_balance DECIMAL(6,2),
    exp_date VARCHAR(22),
    overdue BOOLEAN,
    book_name VARCHAR(255),
    isbn VARCHAR(20),
    FOREIGN KEY (isbn) REFERENCES Book(isbn)
);

-- Loaner Table
CREATE TABLE Loaner (
    customer_name VARCHAR(100),
    loan_id INT,
    PRIMARY KEY (customer_name, loan_id),
    FOREIGN KEY (customer_name) REFERENCES Customer(customer_name),
    FOREIGN KEY (loan_id) REFERENCES Loan(loan_id)
);


INSERT INTO Library (lib_name, lib_city_town, books_quantity) VALUES
('Central Library', 'Springfield', 10000),
('North Branch', 'Rivertown', 4500),
('West End Library', 'Mapleton', 6200),
('East Side Library', 'Brookville', 3200),
('South Hill Library', 'Laketown', 2800);

-- ------------------------------
-- Book Table
-- ------------------------------
INSERT INTO Book (isbn, book_name, lib_name, author_name) VALUES
-- Original entries
INSERT INTO Book (isbn, book_name, lib_name, author_name) VALUES
('978-0-06-112008-4', 'To Kill a Mockingbird', 'South Hill Library', 'Harper Lee'),
('978-0-7432-7356-5', '1984', 'West End Library', 'George Orwell'),
('978-0-452-28423-4', 'The Catcher in the Rye', 'North Branch', 'J.D. Salinger'),
('978-0-679-64011-4', 'Beloved', 'North Branch', 'Toni Morrison'),
('978-0-14-028333-4', 'The Great Gatsby', 'North Branch', 'F. Scott Fitzgerald'),
('978-0-7432-7355-8', 'Brave New World', 'South Hill Library', 'Aldous Huxley'),
('978-0-618-00221-3', 'The Lord of the Rings', 'West End Library', 'J.R.R. Tolkien'),
('978-0-06-093546-7', 'The Grapes of Wrath', 'East Side Library', 'John Steinbeck'),
('978-0-7432-7354-1', 'Catch-22', 'East Side Library', 'Joseph Heller'),
('978-0-7432-7357-2', 'The Sun Also Rises', 'Central Library', 'Ernest Hemingway'),
('978-0-14-243717-9', 'Slaughterhouse-Five', 'North Branch', 'Kurt Vonnegut'),
('978-0-679-73232-1', 'Invisible Man', 'South Hill Library', 'Ralph Ellison'),
('978-0-452-28424-1', 'On the Road', 'West End Library', 'Jack Kerouac'),
('978-0-14-028329-7', 'Lolita', 'Central Library', 'Vladimir Nabokov'),
('978-0-06-112241-5', 'One Hundred Years of Solitude', 'South Hill Library', 'Gabriel Garcia Marquez'),
('978-0-06-093327-2', 'Love in the Time of Cholera', 'Central Library', 'Gabriel Garcia Marquez'),
('978-0-7432-7353-4', 'A Clockwork Orange', 'Central Library', 'Anthony Burgess'),
('978-0-06-112006-0', 'Go Tell It on the Mountain', 'North Branch', 'James Baldwin'),
('978-0-553-21311-7', 'Dune', 'West End Library', 'Frank Herbert'),
('978-0-06-085052-4', 'Lord of the Flies', 'West End Library', 'William Golding'),
('978-0-394-82337-9', 'The Sound and the Fury', 'Central Library', 'William Faulkner'),
('978-0-06-112006-1', 'The Stranger', 'West End Library', 'Albert Camus'),
('978-0-679-72232-2', 'The Color Purple', 'North Branch', 'Alice Walker'),
('978-0-14-028334-1', "Midnight's Children", 'West End Library', 'Salman Rushdie'),
('978-0-7432-7358-9', 'Things Fall Apart', 'Central Library', 'Chinua Achebe'),
('978-0-679-72233-9', 'The Bell Jar', 'North Branch', 'Sylvia Plath'),
('978-0-452-28425-8', 'As I Lay Dying', 'East Side Library', 'William Faulkner'),
('978-0-06-112242-2', 'Their Eyes Were Watching God', 'North Branch', 'Zora Neale Hurston'),
('978-0-553-21312-4', 'Fahrenheit 451', 'East Side Library', 'Ray Bradbury'),
('978-0-06-112005-3', 'The Old Man and the Sea', 'Central Library', 'Ernest Hemingway'),
('978-0-06-093021-3', 'Of Mice and Men', 'West End Library', 'John Steinbeck'),
('978-0-06-112007-7', 'A Farewell to Arms', 'South Hill Library', 'Ernest Hemingway'),
('978-0-14-028326-6', 'The Master and Margarita', 'South Hill Library', 'Mikhail Bulgakov'),
('978-0-06-112010-7', 'Native Son', 'North Branch', 'Richard Wright'),
('978-0-452-28426-5', 'Wide Sargasso Sea', 'Central Library', 'Jean Rhys'),
('978-0-7432-7352-7', 'Animal Farm', 'North Branch', 'George Orwell'),
('978-0-06-112008-5', 'Night', 'East Side Library', 'Elie Wiesel'),
('978-0-394-82338-6', "Portnoy's Complaint", 'North Branch', 'Philip Roth'),
('978-0-14-118257-5', 'The Trial', 'East Side Library', 'Franz Kafka'),
('978-0-452-28427-2', 'The Jungle', 'North Branch', 'Upton Sinclair'),
('978-0-06-112009-2', 'The Big Sleep', 'East Side Library', 'Raymond Chandler'),
('978-0-14-028332-7', 'The Unbearable Lightness of Being', 'East Side Library', 'Milan Kundera'),
('978-0-679-72234-6', "Sophie's Choice", 'Central Library', 'William Styron'),
('978-0-06-112003-0', 'The Plague', 'West End Library', 'Albert Camus'),
('978-0-7432-7351-0', 'Rebecca', 'South Hill Library', 'Daphne du Maurier'),
('978-0-06-112002-3', 'Women in Love', 'North Branch', 'D.H. Lawrence'),
('978-0-06-112001-6', 'The Heart is a Lonely Hunter', 'North Branch', 'Carson McCullers'),
('978-0-06-112000-9', 'Under the Volcano', 'East Side Library', 'Malcolm Lowry'),
('978-0-06-112004-7', 'The Painted Bird', 'South Hill Library', 'Jerzy Kosinski');

-- ------------------------------
-- Customer Table
-- ------------------------------
INSERT INTO Customer (customer_name, customer_city, customer_street) VALUES
('Alice Johnson', 'Springfield', '123 Elm St'),
('Bob Smith', 'Rivertown', '456 Oak Rd'),
('Carla Gomez', 'Mapleton', '789 Pine Ln'),
('David Zhou', 'Springfield', '321 Maple Dr'),
('Ella Ray', 'Rivertown', '654 Cedar Ct'),
('Franklin Moore', 'Brookville', '222 Birch Blvd'),
('Grace Kim', 'Laketown', '99 Aspen Cir'),
('Hannah Lee', 'Brookville', '874 Spruce St'),
('Isaac Patel', 'Mapleton', '112 Dogwood Dr'),
('Janelle Wong', 'Laketown', '33 Walnut Way');

-- ------------------------------
-- Account Table
-- ------------------------------
INSERT INTO Account (account_id, library_name, loan_balance) VALUES
(1, 'Central Library', 2.50),
(2, 'North Branch', 0.00),
(3, 'West End Library', 5.75),
(4, 'East Side Library', 0.00),
(5, 'South Hill Library', 1.25),
(6, 'Central Library', 0.00),
(7, 'South Hill Library', 3.25),
(8, 'East Side Library', 0.50),
(9, 'West End Library', 1.10),
(10, 'North Branch', 0.00);

-- ------------------------------
-- Loan Table
-- ------------------------------
INSERT INTO Loan (loan_time_left, loan_balance, exp_date, overdue, book_name, isbn) VALUES
(3, 1.45, '2025-08-04', FALSE, 'To Kill a Mockingbird', '978-0-06-112008-4'),
(27, 0.00, '2025-08-28', FALSE, '1984', '978-0-7432-7356-5'),
(13, 0.00, '2025-08-14', FALSE, 'The Catcher in the Rye', '978-0-452-28423-4'),
(4, 2.90, '2025-08-05', FALSE, 'Beloved', '978-0-679-64011-4'),
(16, 0.00, '2025-08-17', FALSE, 'The Great Gatsby', '978-0-14-028333-4'),
(12, 0.00, '2025-08-13', FALSE, 'Brave New World', '978-0-7432-7355-8'),
(21, 0.00, '2025-08-22', FALSE, 'The Lord of the Rings', '978-0-618-00221-3'),
(6, 2.28, '2025-08-07', TRUE, 'The Grapes of Wrath', '978-0-06-093546-7'),
(23, 0.00, '2025-08-24', FALSE, 'Catch-22', '978-0-7432-7354-1'),
(9, 1.83, '2025-08-10', FALSE, 'The Sun Also Rises', '978-0-7432-7357-2'),
(1, 2.92, '2025-08-02', TRUE, 'Slaughterhouse-Five', '978-0-14-243717-9'),
(2, 0.32, '2025-08-03', FALSE, 'Invisible Man', '978-0-679-73232-1'),
(3, 1.56, '2025-08-04', FALSE, 'On the Road', '978-0-452-28424-1'),
(15, 0.00, '2025-08-16', FALSE, 'Lolita', '978-0-14-028329-7'),
(28, 0.00, '2025-08-29', FALSE, 'One Hundred Years of Solitude', '978-0-06-112241-5'),
(14, 0.00, '2025-08-15', FALSE, 'Love in the Time of Cholera', '978-0-06-093327-2'),
(0, 2.75, '2025-08-01', TRUE, 'A Clockwork Orange', '978-0-7432-7353-4'),
(8, 0.46, '2025-08-09', TRUE, 'Go Tell It on the Mountain', '978-0-06-112006-0'),
(2, 1.71, '2025-08-03', TRUE, 'Dune', '978-0-553-21311-7'),
(29, 0.00, '2025-08-30', FALSE, 'Lord of the Flies', '978-0-06-085052-4'),
(5, 0.35, '2025-08-06', FALSE, 'The Sound and the Fury', '978-0-394-82337-9'),
(30, 0.00, '2025-08-31', FALSE, 'The Stranger', '978-0-06-112006-1'),
(11, 0.00, '2025-08-12', FALSE, 'The Color Purple', '978-0-679-72232-2'),
(26, 0.00, '2025-08-27', FALSE, "Midnight's Children", '978-0-14-028334-1'),
(7, 0.27, '2025-08-08', TRUE, 'Things Fall Apart', '978-0-7432-7358-9'),
(10, 1.64, '2025-08-11', FALSE, 'The Bell Jar', '978-0-679-72233-9'),
(4, 0.61, '2025-08-05', TRUE, 'As I Lay Dying', '978-0-452-28425-8'),
(18, 0.00, '2025-08-19', FALSE, 'Their Eyes Were Watching God', '978-0-06-112242-2'),
(2, 2.15, '2025-08-03', TRUE, 'Fahrenheit 451', '978-0-553-21312-4'),
(9, 1.08, '2025-08-10', FALSE, 'The Old Man and the Sea', '978-0-06-112005-3'),
(6, 0.00, '2025-08-07', FALSE, 'Of Mice and Men', '978-0-06-093021-3'),
(24, 0.00, '2025-08-25', FALSE, 'A Farewell to Arms', '978-0-06-112007-7'),
(25, 0.00, '2025-08-26', FALSE, 'The Master and Margarita', '978-0-14-028326-6'),
(1, 0.92, '2025-08-02', TRUE, 'Native Son', '978-0-06-112010-7'),
(20, 0.00, '2025-08-21', FALSE, 'Wide Sargasso Sea', '978-0-452-28426-5'),
(22, 0.00, '2025-08-23', FALSE, 'Animal Farm', '978-0-7432-7352-7'),
(8, 1.73, '2025-08-09', TRUE, 'Night', '978-0-06-112008-5'),
(17, 0.00, '2025-08-18', FALSE, "Portnoy's Complaint", '978-0-394-82338-6'),
(13, 0.00, '2025-08-14', FALSE, 'The Trial', '978-0-14-118257-5'),
(7, 0.49, '2025-08-08', TRUE, 'The Jungle', '978-0-452-28427-2'),
(0, 1.37, '2025-08-01', TRUE, 'The Big Sleep', '978-0-06-112009-2'),
(3, 1.23, '2025-08-04', FALSE, 'The Unbearable Lightness of Being', '978-0-14-028332-7'),
(19, 0.00, '2025-08-20', FALSE, "Sophie's Choice", '978-0-679-72234-6'),
(1, 0.70, '2025-08-02', TRUE, 'The Plague', '978-0-06-112003-0'),
(5, 2.14, '2025-08-06', FALSE, 'Rebecca', '978-0-7432-7351-0'),
(16, 0.00, '2025-08-17', FALSE, 'Women in Love', '978-0-06-112002-3'),
(0, 1.66, '2025-08-01', TRUE, 'The Heart is a Lonely Hunter', '978-0-06-112001-6'),
(28, 0.00, '2025-08-29', FALSE, 'Under the Volcano', '978-0-06-112000-9'),
(10, 0.00, '2025-08-11', FALSE, 'The Painted Bird', '978-0-06-112004-7');

-- ------------------------------
-- Loaner Table
-- ------------------------------
INSERT INTO Loaner (customer_name, loan_id) VALUES
INSERT INTO Loaner (customer_name, loan_id) VALUES
('Alice Johnson', 11),
('Alice Johnson', 12),
('Alice Johnson', 13),
('Alice Johnson', 14),
('Alice Johnson', 15),
('Bob Smith', 16),
('Bob Smith', 17),
('Bob Smith', 18),
('Bob Smith', 19),
('Bob Smith', 20),
('Carla Gomez', 21),
('Carla Gomez', 22),
('Carla Gomez', 23),
('Carla Gomez', 24),
('Carla Gomez', 25),
('David Zhou', 26),
('David Zhou', 27),
('David Zhou', 28),
('David Zhou', 29),
('David Zhou', 30),
('Ella Ray', 31),
('Ella Ray', 32),
('Ella Ray', 33),
('Ella Ray', 34),
('Ella Ray', 35),
('Franklin Moore', 36),
('Franklin Moore', 37),
('Franklin Moore', 38),
('Franklin Moore', 39),
('Franklin Moore', 40),
('Grace Kim', 41),
('Grace Kim', 42),
('Grace Kim', 43),
('Grace Kim', 44),
('Grace Kim', 45),
('Hannah Lee', 46),
('Hannah Lee', 47),
('Hannah Lee', 48),
('Hannah Lee', 49),
('Hannah Lee', 50),
('Isaac Patel', 51),
('Isaac Patel', 52),
('Isaac Patel', 53),
('Isaac Patel', 54),
('Isaac Patel', 55),
('Janelle Wong', 56),
('Janelle Wong', 57),
('Janelle Wong', 58),
('Janelle Wong', 59),
('Janelle Wong', 60);