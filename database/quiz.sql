CREATE DATABASE quiz;


create table User_account
(
    id        serial primary key, -- primary key = unique not null
    name      text unique  not null,
    password  varchar(255) not null,
    email     text unique  not null,
    highscore integer      not null
);

create table Question
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

INSERT INTO question (question_text, correct_answer, option1, option2, option3)
VALUES ('What is the capital of France?', 'Paris', 'London', 'Berlin', 'Madrid'),
       ('Which planet is known as the "Red Planet"?', 'Mars', 'Earth', 'Venus', 'Jupiter')
;

INSERT INTO question (question_text, correct_answer, option1, option2, option3)
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

DELETE FROM question;

select * from question;

INSERT INTO question (question_text, correct_answer, option1, option2, option3)
VALUES
    ('What does the clean code principle "KISS" stand for?', 'Keep it Simple, Stupid', 'Complexity is key', 'Keenly Investigate Software Syntax', 'Kindly Ignore Source Structure'),
    ('In clean code, what does the "Open-Closed Principle" recommend?', 'Software entities should be open for extension but closed for modification', 'Software entities should be constantly modified', 'Software entities should always be open for modification', 'Software entities should never be extended'),
    ('What is the primary purpose of meaningful variable and function names in clean code?', 'Enhance code readability and maintainability', 'Minimize code length', 'Improve code performance', 'Optimize code reuse'),
    ('What is the main goal of the clean code principle "YAGNI"?', 'You Aren''t Gonna Need It: Avoid adding unnecessary complexity or features', 'You Always Get New Ideas: Continuously add new features', 'You Ask Good Nonstop Inquiries: Keep questioning your code', 'You Attempt General Next-level Improvements: Focus on advanced features'),
    ('Why is avoiding long functions and methods important in clean code?', 'To enhance readability, maintainability, and testability', 'To improve code performance', 'To maximize code length', 'To increase code complexity'),
    ('What does clean code suggest regarding meaningful variable names?', 'Use descriptive names that convey the purpose of the variable', 'Use short and cryptic names to save space', 'Avoid using variables in your code', 'Use random names for variables'),
    ('In clean code, what does the "Tell, Don''t Ask" principle recommend?', 'Encapsulate behavior within objects instead of querying object state', 'Always ask for object state without telling it what to do', 'Keep asking objects for their state in code', 'Ignore object state entirely'),
    ('What does the clean code principle "SOLID" stand for?', 'A set of five design principles for writing maintainable and scalable software', 'A set of code formatting guidelines', 'A set of best practices for code performance optimization', 'A set of rules for code comments'),
    ('Why is clean code concerned with "Code Smells"?', 'To identify and refactor sections of code that may indicate deeper problems', 'To evaluate code for its aesthetic qualities', 'To check if code smells pleasant', 'To improve code performance without changing its behavior'),
    ('In clean code, what is the primary goal of the "Single Responsibility Principle"?', 'A function or class should have only one reason to change', 'A function or class should perform as many tasks as possible', 'A function or class should have multiple entry points', 'A function or class should always be extended'),
    ('What is the clean code principle "Law of Demeter" (LoD) also known as?', 'The principle of least knowledge', 'The principle of most knowledge', 'The principle of absolute control', 'The principle of direct connections'),
    ('According to clean code principles, what does the "Boy Scout Rule" recommend when modifying code?', 'Leave the code cleaner than you found it', 'Avoid modifying code at all costs', 'Leave the code exactly as you found it', 'Modify code only if you wrote it'),
    ('Why is clean code concerned with "Code Comments"?', 'To provide context and explain non-obvious code behavior', 'To make code more colorful', 'To replace code with explanations', 'To add humor to the code'),
    ('What does clean code suggest about long method or function names?', 'Use long and descriptive method or function names', 'Use short and cryptic names for methods or functions', 'Don''t use method or function names, just use numbers', 'Use one-character names for methods or functions'),
    ('What does clean code emphasize regarding code simplicity and complexity?', 'Favor simplicity over complexity', 'Favor complexity over simplicity', 'It doesn''t matter whether code is simple or complex', 'Always strive for code of medium complexity'),
    ('What is the primary goal of the clean code principle "Keep it DRY"?', 'Don''t Repeat Yourself: Avoid code duplication', 'Always Repeat Yourself: Encourage code duplication', 'Define Really Yielding Improvements: Continuously add new code', 'Deliver Robust Yielding Solutions: Prioritize robust code over DRY'),
    ('According to clean code principles, what is the purpose of the "Law of Least Astonishment"?', 'Minimize surprises and make code behavior as predictable as possible', 'Maximize astonishment for added excitement', 'Ignore astonishment in code design', 'Balance astonishment and predictability'),
    ('What does clean code recommend about "Magic Numbers" in code?', 'Replace hard-coded numbers with named constants', 'Use magic numbers to simplify code', 'Increase the use of magic numbers for improved performance', 'Avoid using any numbers in code'),
    ('In clean code, what is the primary purpose of code refactoring?', 'Improve code structure and maintainability without changing its external behavior', 'Change the behavior of code to meet new requirements', 'Add more features to the existing code', 'Never refactor code, it slows down development'),
    ('What does clean code suggest about "Code Consistency" within a project?', 'Maintain consistent coding style, naming conventions, and formatting', 'Encourage inconsistency to keep the codebase fresh', 'Consistency is not important in clean code', 'Periodically change coding style to confuse developers'),
    ('What is the primary goal of "Cohesion" in clean code principles? A. High cohesion: Keep related code together and separate unrelated code', 'High cohesion: Keep related code together and separate unrelated code', 'Low cohesion: Mix related and unrelated code', 'No cohesion: Combine all code into one module', 'Cohesion doesn''t matter in clean code'),
    ('What does clean code recommend about the use of "Global Variables" in code? A. Minimize or avoid global variables to improve code maintainability', 'Minimize or avoid global variables to improve code maintainability', 'Use global variables extensively for simplicity', 'Use global variables for all variables in code', 'Global variables are mandatory in clean code'),
    ('What is the primary objective of "Continuous Integration" (CI) in clean code practices? A. Continuously integrate code changes and run automated tests', 'Continuously integrate code changes and run automated tests', 'Integrate code only once a month for stability', 'Ignore integration completely in clean code', 'Continuous integration is for code backups'),
    ('What is the main goal of "Encapsulation" according to clean code principles? A. Hide implementation details and expose a simple interface', 'Hide implementation details and expose a simple interface', 'Expose all implementation details to improve transparency', 'No need for encapsulation in clean code', 'Encapsulation is only for security purposes'),
    ('In clean code, what is the purpose of "Meaningful Test Names" in test-driven development (TDD)? A. Improve the readability of tests and clarify their intent', 'Improve the readability of tests and clarify their intent', 'Use random test names for diversity', 'Don''t name tests in TDD', 'Meaningful test names are irrelevant'),
    ('What is the primary goal of using intention-revealing names in clean code?', 'To make the code self-explanatory', 'To save characters in variable names', 'To confuse other developers', 'To follow industry trends'),
    ('Which of the following is an example of an intention-revealing variable name for storing a customer''s age?', 'customerAge', 'a', 'x', 'age1234'),
    ('In clean code, why should you avoid using misleading names for variables and functions?', 'To improve code readability and maintainability', 'To confuse other developers', 'To save memory space', 'To make the code more challenging to read'),
    ('Which of the following variable names contains disinformation about the variable''s purpose?', 'tempVar', 'employeeCount', 'userList', 'maxValue'),
    ('When creating variable names in clean code, what should you ensure when making meaningful distinctions?', 'Ensure that the names reflect their purpose and are distinct from each other', 'Use random characters', 'Make the names as long as possible', 'Use names that are similar to each other'),
    ('Why is making meaningful distinctions between variable names important in clean code?', 'To avoid ambiguity and make code more understandable', 'To confuse developers', 'To save memory space', 'To prevent variable declarations'),
    ('What is the advantage of using pronounceable names for variables and functions in clean code?', 'It aids in code communication and understanding', 'It makes the code harder to understand', 'It saves characters', 'It increases compile time'),
    ('Which of the following is an example of a pronounceable variable name?', 'customerNumber', 'cstmrNmbr', 'xyz', 'pqr678'),
    ('In clean code, why is it recommended to use searchable names for variables?', 'To improve code maintainability by enabling easy searching', 'To make it difficult to find variables', 'To confuse developers', 'To reduce code execution time'),
    ('Which of the following is a characteristic of a searchable name?', 'It reflects the variable''s purpose and can be easily found in code', 'It contains spaces', 'It is a single character', 'It has no uppercase letters'),
    ('Why is proper indenting important in clean code?', 'To improve code readability and structure', 'To make the code visually appealing', 'To use more memory', 'To increase code execution speed'),
    ('What is the purpose of using blocks (e.g., `{}`) in code indentation?', 'To define code scope and organization', 'To create empty spaces', 'To reduce code length', 'To save memory space'),
    ('In clean code, what is the recommended maximum number of lines for a function?', '20 lines', '50 lines', '100 lines', 'As many lines as necessary'),
    ('Why is it important to separate different sections within a function (e.g., initialization, processing, return) with clear comments?', 'To improve code maintainability and understanding', 'To add extra lines to the code', 'To make the code more challenging to read', 'To save memory space'),
    ('Why is it recommended to structure code in a way that allows developers to read it from top to bottom like a story?', 'To improve code comprehension and debugging', 'To add more comments to the code', 'To confuse developers', 'To make code reading more difficult'),
    ('Which of the following code structures aligns with the principle of reading code from top to bottom?', 'Sequential flow with clear function calls and logical structure', 'Randomly placed functions and variables', 'Functions organized by their first letter', 'Functions placed in reverse order'),
    ('In clean code, what is the recommendation regarding the number of arguments a function should accept?', 'Minimize the number of arguments', 'As many arguments as needed', 'Ten or more arguments', 'Exactly three arguments'),
    ('Why is it advised to minimize the number of function arguments in clean code?', 'To improve code maintainability and testing', 'To increase code execution time', 'To make code more complex', 'To save memory space'),
    ('What is the primary goal of data abstraction in clean code?', 'To hide the internal details of data and provide a simplified interface', 'To expose all internal data details', 'To make data complex and hard to use', 'To maximize data redundancy'),
    ('What is a "code smell" in clean code development?', 'Indications in the code that something might be wrong', 'A pleasant aroma in well-written code', 'Comments that make code more understandable', 'Use of whitespace and indentation'),
    ('What is the term for a code smell that indicates a function or method is doing too many things?', 'A "God Function" or "Monolithic Function"', 'A "Small Function" or "Atomic Function"', 'A "Good Function" or "Balanced Function"', 'A "Magic Function" or "Enchanted Function"'),
    ('Which code smell refers to the use of variable or function names that are overly vague and do not describe their purpose?', 'Non-descriptive Names', 'Descriptive Names', 'Variable Clarity', 'Verbose Names'),
    ('What is the code smell related to code that contains unnecessary or redundant parts, often resulting from copy-pasting code?', 'Duplicated Code', 'Optimized Code', 'Refactored Code', 'Lean Code'),
    ('Which code smell is associated with functions that have excessive parameters and become hard to manage?', 'Long Parameter List', 'Short Parameter List', 'Dynamic Parameter List', 'Flexible Parameter List');











