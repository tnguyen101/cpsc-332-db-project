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