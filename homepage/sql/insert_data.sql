INSERT INTO Professor (SSN, Name, Street_Address, City, State, Zip_Code, Telephone, Sex, Degrees, Title, Salary)
VALUES
('111-22-3333', 'Dr. Alan Turing', '1 Computer Way', 'Fullerton', 'CA', '92831', '714-555-0003', 'M', 'PhD', 'Professor', 120000.00),
('222-33-4444', 'Dr. Ada Lovelace', '2 Math Ave', 'Fullerton', 'CA', '92831', '714-555-0004', 'F', 'PhD', 'Professor', 115000.00);

INSERT INTO Department (dept_id, name, telephone, office_location, chairperson_ssn)
VALUES
(1, 'Computer Science', '714-555-0001', 'CS-101', '111-22-3333'),
(2, 'Mathematics', '714-555-0002', 'MH-201', '222-33-4444');

INSERT INTO Student (student_cwid, first_name, last_name, street_address, city, state, zip_code, telephone, major_dept)
VALUES
('C12345678', 'Dave', 'Smith', '12345 Main St', 'Fullerton', 'CA', '92831', '714-555-1234', 1),
('C86839201', 'Alexa', 'Floyd', '40173 Jackson St', 'Anaheim', 'CA', '92801', '714-722-5912', 2),
('C86892390', 'Holly', 'Nguyen', '96451 Ashley St', 'Garden Grove', 'CA', '90680', '714-625-3193', 1);