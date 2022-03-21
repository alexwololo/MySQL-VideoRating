-- create database
CREATE DATABASE video_rating;
show databases;
use video_rating;
SELECT DATABASE();

-- create STATISTICS table
CREATE TABLE statistics(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  release_year YEAR(4),
  runtime_minutes INT,
  revenue_millions_usd FLOAT
);
desc statistics;

-- create CASTS table
CREATE TABLE casts(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  director VARCHAR(100),
  actors VARCHAR(100)
);
desc casts;

-- create MOVIES table
CREATE TABLE movies(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50),
  genre VARCHAR(100),
  statistics_id INT,
  casts_id INT,
  FOREIGN KEY(statistics_id) REFERENCES statistics(id),
  FOREIGN KEY(casts_id) REFERENCES casts(id)
);
desc movies;

-- create REVIEWERS table
CREATE TABLE reviewers(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  first_name VARCHAR(100),
  last_name VARCHAR(100)
);
desc reviewers;

-- create REVIEWS table
CREATE TABLE reviews(
  id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
  rating DECIMAL(3,2),
  reviewers_id INT,
  movies_id INT,
  FOREIGN KEY(reviewers_id) REFERENCES reviewers(id),
  FOREIGN KEY(movies_id) REFERENCES movies(id)
);
desc movies;


