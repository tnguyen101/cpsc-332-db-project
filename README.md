# University Database System  
A comprehensive course/student management system with web interface  

## Description  
This system provides a web-based interface for managing university data, including:  
- **Professors**: View taught classes and grade distributions  
- **Students**: Check course sections and academic records  
- **Courses/Sections**: Manage department offerings and enrollments  

Built with:  
- **MySQL** for relational database management  
- **PHP** for server-side logic  
- **HTML/CSS** for clean user interfaces  

## Features  
- Professor portal:  
  - List classes by SSN  
  - View grade distributions per section  
- Student portal:  
  - Search course sections  
  - View academic transcripts  
- Relational database:  
  - 8+ normalized tables  
  - ER diagram and schema documentation  

## Getting Started  
### Dependencies  
- MySQL Server  
- PHP 7.4+  
- Web server (Apache/Nginx)  
- Modern web browser  

### Executing the Program
1. Clone repository: git clone https://github.com/tnguyen101/cpsc-332-db-project.git
2. Create database: mysql -u root -p -e "CREATE DATABASE university_db"
3. Import schema and data:'''
    mysql -u root -p university_db < sql/create_tables.sql'''
    mysql -u root -p university_db < sql/insert_data.sql
5. Run the command: php -S localhost:8000

## Folder Structure
```CPSC-332-Database-Project/
├── homepage/
│ ├── css/ # Stylesheets
│ ├── includes/ # Database connection
│ ├── professor/ # Faculty interface
│ ├── student/ # Student portal
│ └── index.html # Main entry point
├── sql/
│ ├── create_tables.sql # DDL statements
│ └── insert_data.sql # Sample records
└── docs/ # Project report/screenshots
```
## Project Report Contents  
- ER Diagram & Relational Model  
- SQL Source Code (DDL/DML)  
- PHP Implementation Details  
- Interface Screenshots:  
  - Professor class listing  
  - Grade distribution view  
  - Student course search  
  - Academic transcript 

## Authors
Travis Nguyen,
  Department of Computer Science
  California State University, Fullerton

Jason Khau,
  Department of Computer Science
  California State University, Fullerton

Omar Mejia
  Department of Computer Science
  California State University, Fullerton
