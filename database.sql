create database library;

CREATE TABLE student
(
  student_id INT(10) auto_increment NOT NULL,
  name VARCHAR(20) NOT NULL,
  phone_no INT(10) NOT NULL,
  email VARCHAR(20) NOT NULL,
  PRIMARY KEY (student_id)
);

CREATE TABLE book
(
  book_title VARCHAR(20) NOT NULL,
  book_id INT(10) auto_increment NOT NULL,
  book_genre VARCHAR(20) NOT NULL,
  image VARCHAR(20) NOT NULL,
  student_id INT(10) NOT NULL,
  PRIMARY KEY (book_id),
  FOREIGN KEY (student_id) REFERENCES student(student_id)
);
