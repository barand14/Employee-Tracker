
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


INSERT INTO department (name)
VALUES ('Sales');
INSERT INTO department (name)
VALUES ('Engineering');


INSERT INTO role (title, salary, department_id)
VALUES ('Lead Engineer', 150000, 2); 

INSERT INTO employee(first_name, last_name, manager_id, role_id)
VALUES ('John', 'Davis', null, 1)