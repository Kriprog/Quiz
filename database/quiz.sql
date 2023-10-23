CREATE DATABASE quiz;


create table User_account
(
    id        serial primary key, -- primary key = unique not null
    name      text unique  not null,
    password  varchar(255) not null,
    email     text unique  not null,
    highscore integer      not null
);

insert into User_account (name, password, email, highscore)
values ('TestKasutaja', 'Salajane', 'test@mail.ee', 0);


ALTER USER postgres WITH PASSWORD 'postgres';
select * from User_account;

-- Insert a new user with a high score
INSERT INTO User_account (name, password, email, highscore)
VALUES ('NewUser1', 'NewUserPassword1', 'newuser1@mail.com', 1000);

-- Insert another user with a high score
INSERT INTO User_account (name, password, email, highscore)
VALUES ('NewUser13', 'NewUserPassword2', 'newuser13@mail.com', 987);


