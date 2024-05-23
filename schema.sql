
DROP DATABASE IF EXISTS employee_trackerdb;

CREATE DATABASE employee_trackerdb;


\c employee_trackerdb



CREATE TABLE  department (
    id SERIAL PRIMARY KEY,
    name VARCHAR(30)
);

CREATE TABLE role (
  id SERIAL PRIMARY KEY,
  title VARCHAR(30),
  salary DECIMAL,
  department_id INT,
  FOREIGN KEY (department_id) REFERENCES department(id)
);


CREATE TABLE employee (
  id SERIAL PRIMARY KEY,
  first_name VARCHAR(30),
  last_name VARCHAR(30),
  manager_id INT,
  role_id INT,
  FOREIGN KEY (role_id) REFERENCES role(id),
  FOREIGN KEY (manager_id) REFERENCES employee(id)
);
-- department Seeds
INSERT INTO department (name)
VALUES ('Engineering'), ('Legal'), ('Accounting'), ('Sales');

-- role Seeds
INSERT INTO role (title, salary, department_id)
VALUES 
('Lead Engineer', 130000.00, 1), 
('Legal Team Lead', 200000.00, 2),
('Accountant', 105000.00, 3),
('Sales Lead', 110000.00, 4),
('Salesperson', 90000.00, 4);

-- employee Seeds
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUES 
('John', 'Davis', NULL, 1),
('Typic', 'Patric', NULL, 2),
('Mia', 'Nia', NULL, 3),
('Dolly', 'Molly', 1, 4),
('Chris', 'Avis', 1, 3);
