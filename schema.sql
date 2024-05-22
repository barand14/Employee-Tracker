
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
VALUES ('Lead Engineer', 130000, 2); 
INSERT INTO role (title, salary, department_id)
VALUES ("Legal Team Lead", 200000, 4);
INSERT INTO role (title, salary, department_id)
VALUES ("Accountant", 105000, 3);
INSERT INTO role (title, salary, department_id)
VALUES ("Sales Lead", 110000, 1);
INSERT INTO role (title, salary, department_id)
VALUES ("Salesperson", 90000, 1);

INSERT INTO employee(first_name, last_name, manager_id, role_id)
VALUES ('John', 'Davis', null, 1);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUES ("Typic", "Patric", null, 2);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUES ("Mia","Nia",null,3);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUES ("Dolly", "Molly", 1, 4);
INSERT INTO employee (first_name, last_name, manager_id, role_id)
VALUES ("Chris", "Avis", 4, 5);