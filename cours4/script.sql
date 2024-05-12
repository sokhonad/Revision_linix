
CREATE ROLE userdb WITH SUPERUSER CREATEDB CREATEROLE LOGIN PASSWORD 'sokh';

CREATE DATABASE mywebapp;

psql -U userdb -d mywebapp

CREATE TABLE userdb (
    username varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    id serial PRIMARY KEY
);

INSERT INTO userdb (username, email) VALUES ('Sokhona', 'sokhona@gmail.com');

SELECT * FROM userdb;

tail -n 100 catalina.out

**********************fin s1******************

CREATE TABLE users (
    username varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    id serial PRIMARY KEY
);

INSERT INTO users (username, email) VALUES ('Sokhona', 'sokhona@gmail.com');
INSERT INTO users (username, email) VALUES ('Menad', 'Menad@gmail.com');
INSERT INTO users (username, email) VALUES ('Diakarou', 'Diakarou@gmail.com');

sudo -u postgres psql

ALTER TABLE users
ADD COLUMN date_of_birth VARCHAR(100),
ADD COLUMN city VARCHAR(50);


