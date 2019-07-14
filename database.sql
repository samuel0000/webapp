create database library;


CREATE TABLE library
(
  library_id INT(10) auto_increment NOT NULL,
  name varchar(50) NOT NULL,
  phone_no varchar(12) NOT NULL,
  email varchar(15) NOT NULL,
  PRIMARY KEY (library_id)
);

CREATE TABLE book
(
  book_title varchar(50) NOT NULL,
  book_id varchar(20) NOT NULL,
  book_genre varchar(50) NOT NULL,
  image varchar(50) NOT NULL,
  PRIMARY KEY (book_id)
);

CREATE TABLE lender
(
  id INT(50) auto_increment NOT NULL,
  library_id INT(10),
  book_id VARCHAR(20) ,
  PRIMARY KEY (id, library_id, book_id),
  FOREIGN KEY (library_id) REFERENCES library(library_id),
  FOREIGN KEY (book_id) REFERENCES book(book_id)
);


