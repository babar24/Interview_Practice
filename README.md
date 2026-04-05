# SQL
This repository can be used for quick revisions of concepts of SQL which includes syntax and definitions of the different types of SQL commands. Most of the commands are provided in MySQL syntax. Syntax may vary for SQL Server and PostgreSQL.

## Data Manipulation Language (DML) Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| SELECT | The SELECT command retrieves data from a database. | `SELECT column1, column2 FROM table_name;` | `SELECT first_name, last_name FROM customers;` |
| INSERT | The INSERT command adds new records to a table. | `INSERT INTO table_name (column1, column2) VALUES (value1, value2);` | `INSERT INTO customers (first_name, last_name) VALUES ('Mary', 'Doe');` |
| UPDATE | The UPDATE command is used to modify existing records in a table. | `UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;` | `UPDATE employees SET employee_name = 'John Doe', department = 'Marketing' WHERE employee_id = 1;` |
| DELETE | The DELETE command removes records from a table. | `DELETE FROM table_name WHERE condition;` | `DELETE FROM employees WHERE employee_name = 'John Doe';` |


