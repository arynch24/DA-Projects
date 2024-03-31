use registration_db;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(255) NOT NULL,
    father_name VARCHAR(255) NOT NULL,
    mother_name VARCHAR(255) NOT NULL,
    phone_number VARCHAR(15) NOT NULL,
    email VARCHAR(255) NOT NULL,
    date_of_birth DATE NOT NULL,
    address VARCHAR(255) NOT NULL,
    blood_group VARCHAR(10) NOT NULL,
    department VARCHAR(50) NOT NULL,
    course VARCHAR(50) NOT NULL,
    password VARCHAR(255) NOT NULL
);
