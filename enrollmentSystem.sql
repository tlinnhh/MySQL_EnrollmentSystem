CREATE TABLE Professors (
    ProfessorID INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    FullName VARCHAR(100) NOT NULL,
    Hire_date DATE,
    Email VARCHAR(100) NOT NULL UNIQUE
);

CREATE TABLE Students (
    StudentID INT AUTO_INCREMENT PRIMARY KEY,
    FullName VARCHAR (100) NOT NULL,
    Birth_date DATE NOT NULL,
    Gender ENUM('female', 'male') NOT NULL,
    Email VARCHAR(50) NOT NULL UNIQUE,
    GPA DECIMAL(2, 1) CHECK (GPA >= 0.0 AND GPA <= 4.0)
);

CREATE TABLE Courses (
    CourseID VARCHAR(20) NOT NULL PRIMARY KEY,
    CourseName VARCHAR(100) NOT NULL,
    Credits INT CHECK (Credits BETWEEN 1 AND 5),
    ProfessorID INT NOT NULL,
    FOREIGN KEY (ProfessorID) REFERENCES Professors(ProfessorID)
);

CREATE TABLE Enrollment (
    StudentID INT NOT NULL,
    CourseID VARCHAR(20) NOT NULL,
    Enroll_date DATE NOT NULL,
    Grade INT CHECK (Grade BETWEEN 1 AND 20),
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID),
    PRIMARY KEY (StudentID, CourseID)
)
    
