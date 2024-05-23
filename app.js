const inquirer = require ('inquirer');
const {Pool} = require ('pg');


const cTable = require('console.table')


const connection = new Pool ({
    host:"localhost",
    user: "postgres",
    password: "",
    port: 5432,
    database: "employee_trackerdb"
})

connection.connect()

function startApp() {
    inquirer.prompt([
    {
    name: "prompt",
    type: "list",
    message: "What action do you want?",
    choices: [
    "View all departments",
    "View all roles",
    "View all employees",
    "Add a new department",
    "Add a new role",
    "Add a new employee",
    "Update employee roles",
    "Exit"
    ]
    }])
    .then(function (response) {
    switch (response.prompt) {
    case "View all departments":
    viewDepartments();
    break;
    case "View all roles":
    viewRoles();
    break;
    case "View all employees":
    viewEmployees();
    break;
    case "Add a new department":
    addDepartment();
    break;
    case "Add a new role":
    addRole();
    break;
    case "Add a new employee":
    addEmployee();
    break;
    case "Update employee roles":
    employeeUpdate();
    break;
    case "Exit":
    connection.end();
    break;
    }
    });
    };


function viewDepartments(){
    connection.query('SELECT * FROM department', (err, res) => {
        if (err) throw err

        console.table(res.rows)
        startApp()
    })
}

function viewRoles(){
    connection.query('SELECT * FROM role', (err, res) => {
        if (err) throw err

        console.table(res.rows)
        startApp()
    })
}

function viewEmployees(){
    connection.query('SELECT * FROM employee', (err, res) => {
        if (err) throw err

        console.table(res.rows)
        startApp()
    })
}


function addDepartment(){
    inquirer.prompt ([
        {
            type: "input",
            name:"newDepartment",
            message:"Please enter the name of the new department."
        }
    ]).then(response => {
        connection.query('INSERT INTO department (name) VALUES ($1)', [response.newDepartment])

        console.log("New department added.")
        startApp()

    })
}

function addRole(){
    inquirer.prompt ([
        {
            type: "input",
            name:"title",
            message:"What is the employee's title?"

         },

         {
            type: "input",
            name:"salary",
            message:"What is the salary?"
         },

         {
            type: "input",
            name:"department_id",
            message: "What is the department_id?"
         }
    ]).then(response => {
        connection.query('INSERT INTO role (title, salary, department_id) VALUES ($1, $2, $3)', [response.title, response.salary, response.department_id])

        console.log("New role added")
        startApp()

    })
}

function addEmployee(){
    inquirer.prompt ([
        {
            type: "input",
            name:"firstname",
            message:"Please enter first name?"

         },

         {
            type: "input",
            name:"lastname",
            message:"Please enter last name"
         },

         {
            type: "input",
            name:"manager_id",
            message: "What is their manager name?"
         },

         {
            type: "input",
            name:"role_id",
            message: "What is their role?"
         }
    ]).then(response => {
        connection.query('INSERT INTO employee (first_name, last_name, manager_id, role_id,) VALUES ($1, $2, $3, $4)', [response.firstname, response.lastname, response.manager_id, response.role_id], (err, res) =>{
            if (err) throw err;
            
            console.log("New employee added");
            startApp()
        });

    });
}
    startApp()