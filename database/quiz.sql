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

insert into User_account (name, password, email, highscore)
values ('TestKasutaja', 'Salajane', 'test@mail.ee', 0);

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES ('What is the capital of France?', 'Paris', 'London', 'Berlin', 'Madrid'),
       ('Which planet is known as the "Red Planet"?', 'Mars', 'Earth', 'Venus', 'Jupiter')
;


