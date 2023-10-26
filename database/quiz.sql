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
    ('What is the primary goal of "Cohesion" in clean code principles?', 'High cohesion: Keep related code together and separate unrelated code', 'Low cohesion: Mix related and unrelated code', 'No cohesion: Combine all code into one module', 'Cohesion doesn''t matter in clean code'),
    ('What does clean code recommend about the use of "Global Variables" in code?', 'Minimize or avoid global variables to improve code maintainability', 'Use global variables extensively for simplicity', 'Use global variables for all variables in code', 'Global variables are mandatory in clean code'),
    ('What is the primary objective of "Continuous Integration" (CI) in clean code practices?', 'Continuously integrate code changes and run automated tests', 'Integrate code only once a month for stability', 'Ignore integration completely in clean code', 'Continuous integration is for code backups'),
    ('What is the main goal of "Encapsulation" according to clean code principles?', 'Hide implementation details and expose a simple interface', 'Expose all implementation details to improve transparency', 'No need for encapsulation in clean code', 'Encapsulation is only for security purposes'),
    ('In clean code, what is the purpose of "Meaningful Test Names" in test-driven development (TDD)?', 'Improve the readability of tests and clarify their intent', 'Use random test names for diversity', 'Don''t name tests in TDD', 'Meaningful test names are irrelevant'),
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
    ('In clean code, what is the recommended maximum number of lines for a function?', '20 lines', '50 lines', '100 lines', 'As many lines as possible'),
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
    ('Which code smell is associated with functions that have excessive parameters and become hard to manage?', 'Long Parameter List', 'Short Parameter List', 'Dynamic Parameter List', 'Flexible Parameter List'),
    ('What is the primary goal of clean code according to Robert C. Martin?', 'To make the software easier to understand and maintain', 'To make the software faster', 'To reduce software development costs', 'To add more features quickly'),
    ('What does the SOLID principle "S" stand for in clean code?', 'Single Responsibility Principle (SRP)', 'Simple Code Principle', 'Smart Code Principle', 'Shared Responsibility Principle'),
    ('What is the purpose of the "Liskov Substitution Principle" (LSP) in clean code?', 'To ensure that derived classes can be substituted for their base classes without affecting program correctness', 'To ensure that inheritance is not used in object-oriented programming', 'To prevent code reusability', 'To make code more complex'),
    ('What does the "Dependency Inversion Principle" (DIP) recommend in clean code?', 'High-level modules should not depend on low-level modules; both should depend on abstractions.', 'High-level modules should always depend on low-level modules', 'Abstractions should depend on low-level modules', 'Low-level modules should depend on high-level modules'),
    ('What is the purpose of unit testing in clean code development?', 'To verify that individual units of code work correctly in isolation', 'To test the entire application', 'To find and fix all bugs in the code', 'To improve the performance of the code'),
    ('According to Robert C. Martin, what does "clean code" look like?', 'It looks like it was written by someone who cares.', 'It looks like it was written quickly to meet deadlines.', 'It looks like it contains a lot of comments.', 'It looks like it was written without testing.'),
    ('What is the purpose of using version control systems (VCS) in clean code development?', 'To track changes and collaborate on code effectively', 'To write code without any history or tracking', 'To hide the code from other team members', 'To slow down development processes'),
    ('Why is code review an important practice in clean code development?', 'It helps identify issues and improve the quality of the code.', 'It slows down the development process.', 'It is a waste of time.', 'It is only necessary for junior developers'),
    ('Why is code documentation considered a best practice in coding?', 'To explain "why" rather than "what" in the code', 'To add humor to the code', 'To increase code complexity', 'To hide code logic from others'),
    ('Why is it essential to handle "NullPointerException" in Java and how can it be prevented?', 'It occurs when trying to access or modify a null object and can be prevented with proper null checks and handling', 'It indicates a successful operation in Java and does not need prevention', 'It is unrelated to Java programming', 'It only occurs in advanced Java code'),
    ('What is the principle that allows one class to inherit the attributes and methods of another class in Java?', 'Inheritance', 'Polymorphism', 'Abstraction', 'Encapsulation'),
    ('Which principle in Java suggests that a method in a subclass should have the same name, return type, and parameters as a method in its superclass?', 'Method Overriding', 'Method Overloading', 'Method Inheritance', 'Method Polymorphism'),
    ('What is the purpose of a "for" loop in programming?', 'To repeat a block of code a specified number of times', 'To define a new function', 'To print a message to the console', 'To create a class'),
    ('What does the term "variable" mean in programming?', 'A container for storing data', 'A type of error', 'A type of function', 'A programming language'),
    ('What is the main purpose of a "function" in programming?', 'To encapsulate a block of code that can be called and reused', 'To define a data type', 'To display a graphical user interface', 'To create a loop'),
    ('In programming, what is a "syntax error"?', 'An error in the structure of the code', 'A type of loop', 'A data storage location', 'A form of documentation'),
    ('What does the acronym "IDE" stand for in programming?', 'Integrated Development Environment', 'Interactive Design Environment', 'Inherent Data Encryption', 'Intelligent Development Entity'),
    ('What is the primary purpose of a "while" loop in programming?', 'To repeat a block of code as long as a specified condition is true', 'To define a new variable', 'To execute a block of code only once', 'To create an object'),
    ('In programming, what does "algorithm" refer to?', 'A step-by-step procedure for solving a problem', 'A programming language', 'A hardware component', 'A type of error'),
    ('What is the primary purpose of comments in code?', 'To provide explanations and context for the code', 'To store data', 'To create functions', 'To display error messages'),
    ('In programming, what does the term "bug" mean?', 'An error or defect in the code', 'A type of loop', 'A variable with a value of zero', 'A software feature'),
    ('What is the role of a "compiler" in programming?', 'To translate source code into machine code', 'To execute code line by line', 'To design user interfaces', 'To write documentation'),
    ('What is the primary purpose of a "conditional statement" in programming?', 'To execute different code based on a specified condition', 'To define a new function', 'To create loops', 'To store data'),
    ('What does the term "iteration" mean in programming?', 'Repeating a block of code a certain number of times or until a condition is met', 'An error in the code', 'A variable declaration', 'A comment in the code'),
    ('What is the purpose of "data types" in programming?', 'To categorize and define the kind of data a variable can hold', 'To store comments in the code', 'To create loops', 'To execute code'),
    ('In programming, what does "optimization" refer to?', 'Improving code efficiency and performance', 'Adding errors to the code', 'Writing long comments', 'Creating complex algorithms'),
    ('What is the primary purpose of a "while loop" in programming?', 'To repeat a block of code while a specific condition is true', 'To define a new function', 'To display a graphical user interface', 'To create comments in the code'),
    ('What is the primary function of a "for loop" in programming?', 'To repeat a block of code a specified number of times', 'To create a new variable', 'To print a message to the console', 'To define a function'),
    ('What is the primary role of HTML in web development?', 'To structure and define the content of web pages', 'To style and design web pages', 'To handle server-side logic', 'To manage databases'),
    ('In web development, what does CSS stand for?', 'Cascading Style Sheets', 'Computer Science and Software', 'Client-Side Scripting', 'Content Structure Syntax'),
    ('What does JavaScript primarily handle in front-end development?', 'Interactivity and client-side scripting', 'Database management', 'Server-side processing', 'Structuring content'),
    ('What is the purpose of responsive design in front-end development?', 'To ensure web content displays correctly on various devices and screen sizes', 'To slow down web page loading', 'To make web pages appear exactly the same on all devices', 'To eliminate the need for user interaction'),
    ('What does the acronym "DOM" stand for in the context of web development?', 'Document Object Model', 'Data Object Management', 'Design Overhaul Mechanism', 'Dynamic Object Model'),
    ('What is the primary role of a back-end developer in web development?', 'To work on server-side logic, databases, and application performance', 'To design user interfaces and front-end interactions', 'To optimize the website for search engines', 'To write content for the website'),
    ('In back-end development, what does the acronym "SQL" stand for?', 'Structured Query Language', 'Server Quality Language', 'Systematic Query Logic', 'Server Query Layer'),
    ('What is the main purpose of a back-end framework like Node.js or Django?', 'To provide a structure for building server-side applications', 'To create visual elements on the web page', 'To handle client-side scripting', 'To design user interfaces'),
    ('Why is database management crucial in back-end development?', 'To store, retrieve, and manage data for the application', 'To enhance the visual design of the website', 'To perform client-side scripting', 'To structure web content'),
    ('What is the role of a back-end developer in securing web applications?', 'Implementing security measures to protect data and prevent unauthorized access', 'Optimizing website performance', 'Designing user interfaces', 'Writing content for the website'),
    ('What is the primary function of a database in software development?', 'To store, manage, and retrieve data efficiently', 'To design user interfaces', 'To write server-side code', 'To create front-end interactions'),
    ('What is the purpose of a "relational database"?', 'To store structured data in tables with defined relationships between them', 'To store unstructured data in a single table', 'To manage front-end code', 'To optimize website performance'),
    ('What is a "primary key" in a database table?', 'A unique identifier for each record in the table', 'A key used for locking records in the table', 'A common field shared among multiple tables', 'A foreign key used for referencing other tables'),
    ('Why is data normalization important in database design?', 'To reduce data redundancy and improve data integrity', 'To increase data redundancy and make data more accessible', 'To speed up data retrieval', 'To make data more difficult to query'),
    ('What is the Java platform used for?', 'Developing and running Java applications', 'Running only C++ applications', 'Creating web pages', 'Designing graphical user interfaces'),
    ('In Java, what does the "main" method do in a class?', 'It is the entry point for the program and is executed when the program runs.', 'It defines the class constructor.', 'It is a method for drawing graphics.', 'It manages database connections.'),
    ('What is the primary advantage of Java over languages like C++?', 'Java is platform-independent and has automatic memory management.', 'Java has better performance.', 'Java is exclusively used for web development.', 'Java is a low-level language.'),
    ('What is the role of the "JVM" in Java programming?', 'It interprets and executes Java bytecode on different platforms.', 'It manages the Java source code.', 'It designs user interfaces.', 'It is responsible for database management.'),
    ('In Java, what is the purpose of the "final" keyword for variables?', 'It makes a variable constant and cannot be changed after initialization.', 'It allows the variable to be changed without restrictions.', 'It indicates the variable is a class variable.', 'It prevents the variable from being accessed in other classes.'),
    ('What is the primary role of CSS in web development?', 'To style and format web pages', 'To create interactive features on web pages', 'To manage databases', 'To define server-side logic'),
    ('In CSS, what does "selector" refer to?', 'A pattern that selects the HTML elements to which a style is applied', 'A JavaScript variable', 'A programming language', 'A database table'),
    ('What is the purpose of "cascading" in CSS?', 'It defines the order of importance and inheritance of styles.', 'It specifies the use of inline styles only.', 'It refers to animated styles.', 'It controls database queries.'),
    ('In CSS, what is the "box model"?', 'A model that defines the spacing and layout of elements', 'A model for organizing data in tables', 'A model for managing server resources', 'A model for defining database structures'),
    ('What is the role of "media queries" in CSS?', 'To make web pages responsive to different devices and screen sizes', 'To query a database for specific data', 'To define JavaScript functions', 'To create server-side logic.'),
    ('What does "HTML" stand for in the context of web development?', 'Hypertext Markup Language', 'Highly Technical Markup Language', 'Hyperlink and Text Manipulation Language', 'Hyper Transfer Markup Language'),
    ('What is the purpose of "HTTP" in web development?', 'To facilitate communication between web browsers and servers', 'To create web page content', 'To design user interfaces', 'To manage databases'),
    ('What does "URL" stand for in the context of the internet?', 'Uniform Resource Locator', 'User Requirement List', 'Universal Router Language', 'User Registration Link'),
    ('In web development, what is the primary role of a "web server"?', 'To host and serve web content to clients', 'To design user interfaces', 'To create database tables', 'To write server-side code'),
    ('What is the primary function of a "web browser" in web development?', 'To render and display web content to users', 'To process server-side code', 'To manage databases', 'To write HTML code.'),
    ('What is the primary purpose of an Integrated Development Environment (IDE)?', 'To provide a comprehensive toolset for software development', 'To store data in a database', 'To design user interfaces', 'To create web pages'),
    ('In software development, what is the role of a version control system (VCS) within an IDE?', 'To track changes in the source code and facilitate collaboration', 'To write code without any history or tracking', 'To manage databases', 'To design server-side logic'),
    ('What does "debugging" refer to in the context of software development tools?', 'Identifying and fixing errors in code', 'Creating complex algorithms', 'Writing documentation', 'Optimizing website performance'),
    ('What is the purpose of a "code editor" in an IDE?', 'To write, edit, and manage source code files', 'To create graphical user interfaces', 'To host websites', 'To process server-side code'),
    ('What is the "syntax highlighting" feature in code editors?', 'It color-codes elements of code to make it easier to read and understand.', 'It indicates errors in code with bright colors.', 'It allows code to be executed directly in the editor.', 'It provides code suggestions and autocomplete.');



























