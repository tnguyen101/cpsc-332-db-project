DROP TABLE IF EXISTS Enrollment;
DROP TABLE IF EXISTS Student_Minor;
DROP TABLE IF EXISTS Student;
DROP TABLE IF EXISTS Section;
DROP TABLE IF EXISTS Prerequisite;
DROP TABLE IF EXISTS Course;
DROP TABLE IF EXISTS Department;
DROP TABLE IF EXISTS Professor;

CREATE TABLE Professor (
    SSN VARCHAR(11) PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Street_Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2),
    Zip_Code VARCHAR(5),
    Telephone VARCHAR(15),
    Sex CHAR(1),
    Degrees VARCHAR(200),
    Title VARCHAR(50),
    Salary DECIMAL(10,2)
);

CREATE TABLE Department (
    Dept_ID INT PRIMARY KEY,
    Name VARCHAR(100) NOT NULL,
    Telephone VARCHAR(15),
    Office_Location VARCHAR(100),
    Chairperson_SSN VARCHAR(11),
    FOREIGN KEY (Chairperson_SSN) REFERENCES Professor(SSN)
);

CREATE TABLE Course (
    Course_ID VARCHAR(10) PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Textbook VARCHAR(255),
    Units INT,
    Dept_ID INT,
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
);

CREATE Table Prerequisite (
    Course_ID VARCHAR(10),
    Prereq_ID VARCHAR(10),
    PRIMARY KEY (Course_ID, Prereq_ID),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Prereq_ID) REFERENCES Course(Course_ID)
);

CREATE TABLE Section (
    Course_ID VARCHAR(10),
    Section_Number INT,
    Classroom VARCHAR(50),
    Seats INT,
    Meeting_Days VARCHAR(10),
    Begin_Time TIME,
    End_Time TIME,
    Professor_SSN VARCHAR(11),
    FOREIGN KEY (Course_ID) REFERENCES Course(Course_ID),
    FOREIGN KEY (Professor_SSN) REFERENCES Professor(SSN)
);

CREATE TABLE Student (
    Student_CWID VARCHAR(10) PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Street_Address VARCHAR(100),
    City VARCHAR(50),
    State VARCHAR(2),
    Zip_Code VARCHAR(5),
    Telephone VARCHAR(15),
    Major_Dept INT,
    FOREIGN KEY (Major_Dept) REFERENCES Department(Dept_ID)
);

CREATE TABLE Student_Minor (
    Student_CWID VARCHAR(10),
    Dept_ID INT,
    PRIMARY KEY (Student_CWID, Dept_ID),
    FOREIGN KEY (Student_CWID) REFERENCES Student(Student_CWID),
    FOREIGN KEY (Dept_ID) REFERENCES Department(Dept_ID)
)

CREATE TABLE Enrollment (
    Student_CWID VARCHAR(10),
    Course_ID VARCHAR(10),
    Section_Number INT,
    Grade CHAR(2),
    PRIMARY KEY (Student_CWID, Course_ID, Section_Number),
    FOREIGN KEY (Student_CWID) REFERENCES Student(Student_CWID),
    FOREIGN KEY (Course_ID, Section_Number) REFERENCES Section(Course_ID, Section_Number)
)