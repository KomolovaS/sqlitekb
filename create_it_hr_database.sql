CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    termination_date DATE,
    experience_years INT,
    performance_score NUMERIC(3,2)
);

CREATE TABLE vacancies (
    id SERIAL PRIMARY KEY,
    department VARCHAR(50),
    position VARCHAR(50),
    publish_date DATE,
    hire_date DATE
);

INSERT INTO employees (name, department, position, hire_date, termination_date, experience_years, performance_score) VALUES
('Ivanov I.', 'IT', 'Junior Developer', '2023-12-15', NULL, 1, 6.5),
('Petrov P.', 'IT', 'Senior Developer', '2020-07-10', NULL, 7, 9.1),
('Sidorov S.', 'IT', 'Middle Developer', '2022-03-01', '2024-05-20', 3, 7.2),
('Kuznetsov K.', 'IT', 'Junior Developer', '2024-01-05', NULL, 0, 5.8),
('Smirnova A.', 'IT', 'HR Manager', '2019-09-12', NULL, 5, NULL),
('Volkov V.', 'IT', 'Middle Developer', '2023-06-10', NULL, 4, 7.8),
('Fedorov F.', 'IT', 'Senior Developer', '2021-10-01', NULL, 8, 8.9),
('Nikolaev N.', 'IT', 'Junior Developer', '2024-02-15', NULL, 1, 6.1),
('Makarova M.', 'IT', 'Middle Developer', '2022-08-20', '2024-03-15', 3, 7.0),
('Orlov O.', 'IT', 'Junior Developer', '2024-03-10', NULL, 0, 5.5),
('Popov P.', 'IT', 'Senior Developer', '2018-05-12', NULL, 10, 9.3),
('Novikov N.', 'IT', 'Middle Developer', '2021-12-01', NULL, 5, 7.7),
('Lebedev L.', 'IT', 'Junior Developer', '2024-04-01', NULL, 0, 5.9),
('Morozov M.', 'IT', 'Junior Developer', '2023-11-20', NULL, 1, 6.4),
('Karpov K.', 'IT', 'Senior Developer', '2019-01-15', NULL, 9, 8.7),
('Egorov E.', 'IT', 'Middle Developer', '2023-07-30', NULL, 4, 7.4),
('Vinogradov V.', 'IT', 'Junior Developer', '2024-05-05', NULL, 0, 5.6),
('Solovyov S.', 'IT', 'Middle Developer', '2022-02-28', '2024-01-10', 3, 7.1),
('Kozlov K.', 'IT', 'Senior Developer', '2020-10-15', NULL, 8, 8.8),
('Alekseev A.', 'IT', 'Junior Developer', '2024-06-01', NULL, 0, 6.0),
('Zaitsev Z.', 'IT', 'Junior Developer', '2023-08-05', NULL, 1, 6.3),
('Bogdanov B.', 'IT', 'Middle Developer', '2022-11-12', NULL, 3, 7.2),
('Kiselev K.', 'IT', 'Senior Developer', '2019-03-20', '2024-04-30', 9, 8.5),
('Denisov D.', 'IT', 'Middle Developer', '2023-09-10', NULL, 4, 7.6),
('Filippov F.', 'IT', 'Junior Developer', '2024-07-15', NULL, 0, 5.7),
('Grigoriev G.', 'IT', 'Junior Developer', '2024-08-01', NULL, 0, 5.9),
('Nikitin N.', 'IT', 'Middle Developer', '2021-04-01', NULL, 5, 7.8),
('Sorokin S.', 'IT', 'Senior Developer', '2017-12-15', NULL, 10, 9.2),
('Pavlov P.', 'IT', 'Junior Developer', '2024-09-01', NULL, 0, 5.5),
('Vinokurov V.', 'IT', 'Middle Developer', '2023-05-10', NULL, 4, 7.3);

INSERT INTO vacancies (department, position, publish_date, hire_date) VALUES
('IT', 'Junior Developer', '2023-12-01', '2024-01-05'),
('IT', 'Middle Developer', '2023-11-15', '2023-12-10'),
('IT', 'Senior Developer', '2023-10-01', '2023-11-01'),
('IT', 'Junior Developer', '2024-02-10', '2024-02-15'),
('IT', 'Middle Developer', '2024-03-01', '2024-03-25'),
('IT', 'Junior Developer', '2024-04-10', '2024-04-20'),
('IT', 'Senior Developer', '2024-05-01', '2024-05-15'),
('IT', 'Middle Developer', '2024-06-05', '2024-06-20'),
('IT', 'Junior Developer', '2024-07-01', '2024-07-10'),
('IT', 'Junior Developer', '2024-08-01', '2024-08-12');
