CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department_id INT,
    manager_id INT,
    salary DECIMAL(10, 2)
);

CREATE TABLE departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);

INSERT INTO departments (department_id, department_name)
VALUES
    (1, 'HR'),
    (2, 'Finance'),
    (3, 'Sales'),
    (4, 'Marketing'),
    (5, 'IT');

INSERT INTO employees (employee_id, employee_name, department_id, manager_id, salary)
VALUES
    (1, 'John Doe', 1, NULL, 5000.00),
    (2, 'Jane Smith', 2, 1, 6000.00),
    (3, 'Michael Johnson', 3, 2, 4500.00),
    (4, 'Emily Brown', 3, 2, 5500.00),
    (5, 'David Wilson', 4, 1, 4000.00),
    (6, 'Sarah Davis', 4, 5, 4800.00),
    (7, 'Robert Anderson', 5, 6, 5200.00),
    (8, 'Laura Clark', 5, 6, 4700.00),
    (9, 'Daniel Turner', 3, 2, 5200.00),
    (10, 'Olivia Harris', 2, 1, 5500.00);
