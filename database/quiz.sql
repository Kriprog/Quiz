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
VALUES
    ('What is the largest mammal in the world?', 'Blue Whale', 'Elephant', 'Giraffe', 'Hippopotamus'),
    ('Which gas do plants absorb from the atmosphere during photosynthesis?', 'Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Hydrogen'),
    ('Which country is known as the Land of the Rising Sun?', 'Japan', 'China', 'South Korea', 'Vietnam'),
    ('What is the largest organ in the human body?', 'Skin', 'Heart', 'Liver', 'Lung'),
    ('Which famous scientist developed the theory of general relativity?', 'Albert Einstein', 'Isaac Newton', 'Stephen Hawking', 'Galileo Galilei'),
    ('What is the chemical symbol for the element gold?', 'Au', 'Ag', 'Fe', 'Cu'),
    ('What is the tallest mountain in the world?', 'Mount Everest', 'K2', 'Kangchenjunga', 'Makalu'),
    ('In which year did Christopher Columbus discover America?', '1492', '1512', '1475', '1526'),
    ('What is the main function of the mitochondria in a cell?', 'Energy production', 'Protein synthesis', 'Cell division', 'Waste elimination'),
    ('Which planet is known as the "Morning Star" or "Evening Star"?', 'Venus', 'Mars', 'Mercury', 'Jupiter'),
    ('What is the chemical symbol for water?', 'H2O', 'CO2', 'O2', 'N2'),
    ('Who wrote the play "Romeo and Juliet"?', 'William Shakespeare', 'Charles Dickens', 'Jane Austen', 'Mark Twain'),
    ('Which gas is responsible for the Earth''s ozone layer?', 'Oxygen', 'Carbon Dioxide', 'Chlorofluorocarbons (CFCs)', 'Methane'),
    ('What is the largest planet in our solar system?', 'Jupiter', 'Saturn', 'Uranus', 'Neptune'),
    ('Who is known as the "Father of Modern Physics"?', 'Albert Einstein', 'Isaac Newton', 'Niels Bohr', 'Galileo Galilei'),
    ('Which gas do humans exhale when they breathe out?', 'Carbon Dioxide', 'Oxygen', 'Nitrogen', 'Helium'),
    ('What is the chemical symbol for the element oxygen?', 'O2', 'H2O', 'N2', 'CO2'),
    ('In which country can you visit the ancient city of Machu Picchu?', 'Peru', 'Mexico', 'Brazil', 'Chile'),
    ('Who painted the "Mona Lisa"?', 'Leonardo da Vinci', 'Pablo Picasso', 'Vincent van Gogh', 'Claude Monet'),
    ('Which gas is most abundant in the Earth''s atmosphere?', 'Nitrogen', 'Oxygen', 'Carbon Dioxide', 'Argon')
;

ALTER USER postgres WITH PASSWORD 'postgres';
select * from User_account;

-- Insert a new user with a high score
INSERT INTO User_account (name, password, email, highscore)
VALUES ('NewUser1', 'NewUserPassword1', 'newuser1@mail.com', 1000);

-- Insert another user with a high score
INSERT INTO User_account (name, password, email, highscore)
VALUES ('NewUser14', 'NewUserPassword2', 'newuser14@mail.com', 1800);


