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
       ('Which planet is known as the "Red Planet"?', 'Mars', 'Earth', 'Venus', 'Jupiter'),
('What is the largest planet in our solar system?', 'Jupiter', 'Earth', 'Mars', 'Venus'),
('Which gas do plants absorb from the atmosphere during photosynthesis?', 'Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'),
('Who wrote the play "Romeo and Juliet"?', 'William Shakespeare', 'Charles Dickens', 'Mark Twain', 'Jane Austen'),
('What is the capital of France?', 'Paris', 'Berlin', 'London', 'Rome'),
('Which animal is known as the "King of the Jungle"?', 'Lion', 'Elephant', 'Tiger', 'Giraffe'),
('In which year did Christopher Columbus first arrive in the Americas?', '1492', '1620', '1776', '1865'),
('What is the chemical symbol for water?', 'H2O', 'CO2', 'O2', 'N2'),
('Who painted the Mona Lisa?', 'Leonardo da Vinci', 'Vincent van Gogh', 'Pablo Picasso', 'Rembrandt');
;


