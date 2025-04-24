CREATE TABLE Professor (
    SSN VARCHAR(11) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Street_Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2),
    Zip_Code VARCHAR(5),
    Telephone VARCHAR(10),
    Sex CHAR(1),
    Degrees VARCHAR(200),
    Title VARCHAR(50),
    Salary DECIMAL(10,2)
);