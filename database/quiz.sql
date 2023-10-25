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

DELETE FROM Questions;

select * from Questions;

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES
    ('What does the clean code principle "KISS" stand for?', 'Keep it Simple, Stupid', 'Complexity is key', 'Keenly Investigate Software Syntax', 'Kindly Ignore Source Structure'),
    ('In clean code, what does the "Open-Closed Principle" recommend?', 'Software entities should be open for extension but closed for modification', 'Software entities should be constantly modified', 'Software entities should always be open for modification', 'Software entities should never be extended'),
    ('What is the primary purpose of meaningful variable and function names in clean code?', 'Enhance code readability and maintainability', 'Minimize code length', 'Improve code performance', 'Optimize code reuse'),
    ('What is the main goal of the clean code principle "YAGNI"?', 'You Aren''t Gonna Need It: Avoid adding unnecessary complexity or features', 'You Always Get New Ideas: Continuously add new features', 'You Ask Good Nonstop Inquiries: Keep questioning your code', 'You Attempt General Next-level Improvements: Focus on advanced features'),
    ('Why is avoiding long functions and methods important in clean code?', 'To enhance readability, maintainability, and testability', 'To improve code performance', 'To maximize code length', 'To increase code complexity');

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES
    ('What does clean code suggest regarding meaningful variable names?', 'Use descriptive names that convey the purpose of the variable', 'Use short and cryptic names to save space', 'Avoid using variables in your code', 'Use random names for variables'),
    ('In clean code, what does the "Tell, Don''t Ask" principle recommend?', 'Encapsulate behavior within objects instead of querying object state', 'Always ask for object state without telling it what to do', 'Keep asking objects for their state in code', 'Ignore object state entirely'),
    ('What does the clean code principle "SOLID" stand for?', 'A set of five design principles for writing maintainable and scalable software', 'A set of code formatting guidelines', 'A set of best practices for code performance optimization', 'A set of rules for code comments'),
    ('Why is clean code concerned with "Code Smells"?', 'To identify and refactor sections of code that may indicate deeper problems', 'To evaluate code for its aesthetic qualities', 'To check if code smells pleasant', 'To improve code performance without changing its behavior'),
    ('In clean code, what is the primary goal of the "Single Responsibility Principle"?', 'A function or class should have only one reason to change', 'A function or class should perform as many tasks as possible', 'A function or class should have multiple entry points', 'A function or class should always be extended');

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES
    ('What is the clean code principle "Law of Demeter" (LoD) also known as?', 'The principle of least knowledge', 'The principle of most knowledge', 'The principle of absolute control', 'The principle of direct connections'),
    ('According to clean code principles, what does the "Boy Scout Rule" recommend when modifying code?', 'Leave the code cleaner than you found it', 'Avoid modifying code at all costs', 'Leave the code exactly as you found it', 'Modify code only if you wrote it'),
    ('Why is clean code concerned with "Code Comments"?', 'To provide context and explain non-obvious code behavior', 'To make code more colorful', 'To replace code with explanations', 'To add humor to the code'),
    ('What does clean code suggest about long method or function names?', 'Use long and descriptive method or function names', 'Use short and cryptic names for methods or functions', 'Don''t use method or function names, just use numbers', 'Use one-character names for methods or functions'),
    ('What does clean code emphasize regarding code simplicity and complexity?', 'Favor simplicity over complexity', 'Favor complexity over simplicity', 'It doesn''t matter whether code is simple or complex', 'Always strive for code of medium complexity');

INSERT INTO Questions (question_text, correct_answer, option1, option2, option3)
VALUES
    ('What is the primary goal of the clean code principle "Keep it DRY"?', 'Don''t Repeat Yourself: Avoid code duplication', 'Always Repeat Yourself: Encourage code duplication', 'Define Really Yielding Improvements: Continuously add new code', 'Deliver Robust Yielding Solutions: Prioritize robust code over DRY'),
    ('According to clean code principles, what is the purpose of the "Law of Least Astonishment"?', 'Minimize surprises and make code behavior as predictable as possible', 'Maximize astonishment for added excitement', 'Ignore astonishment in code design', 'Balance astonishment and predictability'),
    ('What does clean code recommend about "Magic Numbers" in code?', 'Replace hard-coded numbers with named constants', 'Use magic numbers to simplify code', 'Increase the use of magic numbers for improved performance', 'Avoid using any numbers in code'),
    ('In clean code, what is the primary purpose of code refactoring?', 'Improve code structure and maintainability without changing its external behavior', 'Change the behavior of code to meet new requirements', 'Add more features to the existing code', 'Never refactor code, it slows down development'),
    ('What does clean code suggest about "Code Consistency" within a project?', 'Maintain consistent coding style, naming conventions, and formatting', 'Encourage inconsistency to keep the codebase fresh', 'Consistency is not important in clean code', 'Periodically change coding style to confuse developers');






