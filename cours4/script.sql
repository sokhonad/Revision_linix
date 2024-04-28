
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


