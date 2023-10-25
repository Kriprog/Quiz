CREATE DATABASE quiz;


create table User_account
(
    id        serial primary key, -- primary key = unique not null
    name      text unique  not null,
    password  varchar(255) not null,
    email     text unique  not null,
    highscore integer      not null
);

create table Questions
(
    id             serial PRIMARY KEY,
    question_text  text not null,
    correct_answer text not null,
    option1        text not null,
    option2        text not null,
    option3        text not null
);

create table Sessions
(
    id              serial PRIMARY KEY,
    session_token   varchar(255) not null,
    user_id         int not null,
    expiration_date timestamp not null,
    created_at      timestamp default current_timestamp

);

insert into User_account (name, password, email, highscore)
values ('TestKasutaja', 'Salajane', 'test@mail.ee', 0);

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES ('What is the capital of France?', 'Paris', 'London', 'Berlin', 'Madrid'),
       ('Which planet is known as the "Red Planet"?', 'Mars', 'Earth', 'Venus', 'Jupiter')
;

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES ('What is the larges' ||
        't mammal in the world?', 'Blue Whale', 'Elephant', 'Giraffe', 'Hippopotamus')
;

ALTER USER postgres WITH PASSWORD 'postgres';
select * from User_account;

-- Insert a new user with a high score
INSERT INTO User_account (name, password, email, highscore)
VALUES ('NewUser1', 'NewUserPassword1', 'newuser1@mail.com', 1000);

-- Insert another user with a high score
INSERT INTO User_account (name, password, email, highscore)
VALUES ('NewUser14', 'NewUserPassword2', 'newuser14@mail.com', 1800);


