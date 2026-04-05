# SQL
This repository can be used for quick revisions of concepts of SQL which includes syntax and definitions of the different types of SQL commands. Most of the commands are provided in MySQL syntax. Syntax may vary for SQL Server and PostgreSQL.

## Data Manipulation Language (DML) Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| SELECT | The SELECT command retrieves data from a database. | `SELECT column1, column2 FROM table_name;` | `SELECT first_name, last_name FROM customers;` |
| INSERT | The INSERT command adds new records to a table. | `INSERT INTO table_name (column1, column2) VALUES (value1, value2);` | `INSERT INTO customers (first_name, last_name) VALUES ('Mary', 'Doe');` |
| UPDATE | The UPDATE command is used to modify existing records in a table. | `UPDATE table_name SET column1 = value1, column2 = value2 WHERE condition;` | `UPDATE employees SET employee_name = 'John Doe', department = 'Marketing' WHERE employee_id = 1;` |
| DELETE | The DELETE command removes records from a table. | `DELETE FROM table_name WHERE condition;` | `DELETE FROM employees WHERE employee_name = 'John Doe';` |

## Data Definition Language (DDL) Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| CREATE | The CREATE command creates a new database and objects, such as a table, index, view, or stored procedure. | `CREATE TABLE table_name (column1 datatype1, column2 datatype2, ...);` | `CREATE TABLE employees (employee_id INT PRIMARY KEY, first_name VARCHAR(50), last_name VARCHAR(50), age INT);` |
| ALTER | The ALTER command adds, deletes, or modifies columns in an existing table. | `ALTER TABLE table_name ADD column_name datatype;` | `ALTER TABLE customers ADD email VARCHAR(100);` |
| DROP | The DROP command is used to drop an existing table in a database. | `DROP TABLE table_name;` | `DROP TABLE customers;` |
| TRUNCATE | The TRUNCATE command is used to delete the data inside a table, but not the table itself. | `TRUNCATE TABLE table_name;` | `TRUNCATE TABLE customers;` |

## Querying Data Commands

| Command | Description | Syntax | Example |
|---|---|---|---|
| SELECT Statement | The SELECT statement is the primary command used to retrieve data from a database. | `SELECT column1, column2 FROM table_name;` | `SELECT first_name, last_name FROM customers;` |
| WHERE Clause | The WHERE clause is used to filter rows based on a specified condition. | `SELECT * FROM table_name WHERE condition;` | `SELECT * FROM customers WHERE age > 30;` |
| ORDER BY Clause | The ORDER BY clause is used to sort the result set in ascending or descending order based on a specified column. | `SELECT * FROM table_name ORDER BY column_name ASC;` or `SELECT * FROM table_name ORDER BY column_name DESC;` | `SELECT * FROM products ORDER BY price DESC;` |
| GROUP BY Clause | The GROUP BY clause groups rows based on the values in a specified column. It is often used with aggregate functions like COUNT, SUM, AVG, etc. | `SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name;` | `SELECT category, COUNT(*) FROM products GROUP BY category;` |
| HAVING Clause | The HAVING clause filters grouped results based on a specified condition. | `SELECT column_name, COUNT(*) FROM table_name GROUP BY column_name HAVING condition;` | `SELECT category, COUNT(*) FROM products GROUP BY category HAVING COUNT(*) > 5;` |


