-- Insert Professors (3)
INSERT INTO Professor (SSN, Name, Street_Address, City, State, Zip_Code, Telephone, Sex, Degrees, Title, Salary)
VALUES
('111-22-3333', 'Dr. Alan Turing', '1 Computer Way', 'Fullerton', 'CA', '92831', '714-555-0003', 'M', 'PhD Computer Science', 'Professor', 120000.00),
('222-33-4444', 'Dr. Ada Lovelace', '2 Math Ave', 'Fullerton', 'CA', '92831', '714-555-0004', 'F', 'PhD Mathematics', 'Professor', 115000.00),
('333-44-5555', 'Dr. Grace Hopper', '3 Computer Blvd', 'Fullerton', 'CA', '92831', '714-555-0005', 'F', 'PhD Computer Science', 'Associate Professor', 105000.00);

-- Insert Departments (2)
INSERT INTO Department (Dept_ID, Name, Telephone, Office_Location, Chairperson_SSN)
VALUES
(1, 'Computer Science', '714-555-0001', 'CS-101', '111-22-3333'),
(2, 'Mathematics', '714-555-0002', 'MH-201', '222-33-4444');

-- Insert Students (8)
INSERT INTO Student (Student_CWID, First_Name, Last_Name, Street_Address, City, State, Zip_Code, Telephone, Major_Dept)
VALUES
('C12345678', 'Dave', 'Smith', '12345 Main St', 'Fullerton', 'CA', '92831', '714-555-1234', 1),
('C23456789', 'Emma', 'Johnson', '23456 Oak Ave', 'Anaheim', 'CA', '92801', '714-555-2345', 2),
('C34567890', 'Michael', 'Williams', '34567 Pine St', 'Garden Grove', 'CA', '92840', '714-555-3456', 1),
('C45678901', 'Sophia', 'Brown', '45678 Maple Dr', 'Fullerton', 'CA', '92831', '714-555-4567', 2),
('C56789012', 'James', 'Jones', '56789 Cedar Ln', 'Anaheim', 'CA', '92801', '714-555-5678', 1),
('C67890123', 'Olivia', 'Garcia', '67890 Elm St', 'Garden Grove', 'CA', '92840', '714-555-6789', 2),
('C78901234', 'William', 'Miller', '78901 Birch Ave', 'Fullerton', 'CA', '92831', '714-555-7890', 1),
('C89012345', 'Ava', 'Davis', '89012 Walnut Blvd', 'Anaheim', 'CA', '92801', '714-555-8901', 2);

-- Insert Student Minors (optional)
INSERT INTO Student_Minor (Student_CWID, Dept_ID)
VALUES
('C12345678', 2),
('C34567890', 2),
('C56789012', 2),
('C23456789', 1),
('C45678901', 1);

-- Insert Courses (4)
INSERT INTO Course (Course_ID, Title, Textbook, Units, Dept_ID)
VALUES
('CPSC120', 'Introduction to Programming', 'Starting Out with Python', 3, 1),
('CPSC223', 'Data Structures', 'Data Structures & Algorithms in Java', 3, 1),
('MATH150', 'Calculus I', 'Calculus: Early Transcendentals', 4, 2),
('MATH250', 'Linear Algebra', 'Linear Algebra and Its Applications', 3, 2);

-- Insert Prerequisites
INSERT INTO Prerequisite (Course_ID, Prereq_ID)
VALUES
('CPSC223', 'CPSC120'),
('MATH250', 'MATH150');

-- Insert Sections (6)
INSERT INTO Section (Course_ID, Section_Number, Classroom, Seats, Meeting_Days, Begin_Time, End_Time, Professor_SSN)
VALUES
('CPSC120', 1, 'CS-201', 30, 'MWF', '09:00:00', '09:50:00', '111-22-3333'),
('CPSC120', 2, 'CS-202', 30, 'TR', '10:00:00', '11:15:00', '333-44-5555'),
('CPSC223', 1, 'CS-203', 25, 'MWF', '11:00:00', '11:50:00', '111-22-3333'),
('MATH150', 1, 'MH-101', 35, 'MWF', '08:00:00', '08:50:00', '222-33-4444'),
('MATH150', 2, 'MH-102', 35, 'TR', '13:00:00', '14:15:00', '333-44-5555'),
('MATH250', 1, 'MH-201', 30, 'MWF', '10:00:00', '10:50:00', '222-33-4444');

-- Insert Enrollment Records (20)
INSERT INTO Enrollment (Student_CWID, Course_ID, Section_Number, Grade)
VALUES
-- CPSC120 Section 1
('C12345678', 'CPSC120', 1, 'A'),
('C34567890', 'CPSC120', 1, 'B+'),
('C56789012', 'CPSC120', 1, 'A-'),
('C78901234', 'CPSC120', 1, 'B'),

-- CPSC120 Section 2
('C23456789', 'CPSC120', 2, 'A'),
('C45678901', 'CPSC120', 2, 'C+'),
('C67890123', 'CPSC120', 2, 'B-'),

-- CPSC223 Section 1
('C12345678', 'CPSC223', 1, 'B+'),
('C34567890', 'CPSC223', 1, 'A-'),
('C56789012', 'CPSC223', 1, 'C'),

-- MATH150 Section 1
('C23456789', 'MATH150', 1, 'A'),
('C45678901', 'MATH150', 1, 'A-'),
('C67890123', 'MATH150', 1, 'B+'),
('C89012345', 'MATH150', 1, 'B'),

-- MATH150 Section 2
('C12345678', 'MATH150', 2, 'B'),
('C34567890', 'MATH150', 2, 'C+'),
('C78901234', 'MATH150', 2, 'A-'),

-- MATH250 Section 1
('C23456789', 'MATH250', 1, 'A-'),
('C45678901', 'MATH250', 1, 'B+'),
('C89012345', 'MATH250', 1, 'A');