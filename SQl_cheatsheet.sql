-- Creating database
CREATE DATABASE database_name;

-- Creating table

CREATE TABLE table_name (
  id INT PRIMARY KEY,--column with name id, contains integer value, could be also tinyint smallint, bigint. PRIMARY KEY means value could not be NULL and must be unique
  name VARCHAR(size),--a variable length string with maximum length in characters=size
  balance DOUBLE NOT NULL, --constraint NOT NULL means values on column cant be missing
  active BOOL DEFAULT 0, --if bool value inserted without specifying active value it will default to 0(FALSE)
  last_seen TIMESTAMP DEFAULT now(),-- if last_seen value not specifyed it will default to current timestamp
  foreign_id BIGINT NOT NULL,
  
  CONSTRAINT constraint_name FOREIGN KEY (foreign_id) REFERENCES othertablename (columnname)--constraint which specifies that foreign_id is foreign key
  /*constraints could be column level or table level. Constraint PRIMARY KEY for id are on column level is equal to
  PRIMARY KEY (id)
  or
  CONSTRAINT constraint_name PRIMARY KEY(ID)
  primary key also can be combitations of columns
  PRIMARY KEY (id, name)
  */
);

INSERT INTO table_name (column1, column2, column3)--used to insert new rows in a table table_name in columns column1, column2, column3
VALUES(value1, value2, value3);--values that will be added

INSERT INTO table_name-- inserting values in all columns
VALUES
(value1, value2, value3),
(value4, value5, value6);--inserting multiple rows at a time

UPDATE table_name--modyfing existing records in table_name
SET column1=value1, column2 = value2, column3=value3--columns to change and values to set
WHERE id = 1;/*condition, could be unique value in column, could be also
WHERE name = "Ivan" -- all rows with name Ivan will be updated
WHERE name = "Ivan" and balance > 500 -- rows named ivan and with balance greater that 500 will change
if where is not present all records will be updated
*/

DELETE FROM table_name WHERE id=1;--deleting records meeting WHERE condition, syntax similar to UPDATE

DROP TABLE table_name;--used to delete table completely

ALTER TABLE table_name--used to add, delete or modify columns
ADD column_name datatype;--adds a column

ALTER TABLE table_name
DROP COLUMN column_name;--delete selected column

ALTER TABLE table_name
RENAME COLUMN old_name to new_name;--renaming a column

SELECT column1, column2 FROM table_name;--selecting columns from table_name, * could be used to select all columns
WHERE column2 > 10;--condition, OR AND can be used to make multiple ones

SELECT SUM(column_name) AS total FROM table_name;--outputs sum of column name and names it total, there are other aggregate functions, such as MIN(), MAX(), COUNT(), AVG()

SELECT * FROM table_name
JOIN other_table ON other_table.columnid = table_name.columnid/*makes from 2 tables 1 by joining them by foreign key, there are different types of JOIN, JOIN=INNER JOIN
LEFT JOIN returns values like JOIN + values from left table with no pair(friom table_name)
RIGHT JOIN returns values like JOIN + values from right table with no pair(friom other_table)
FULL JOIN returns values like JOIN + all values from from two tables without pair, missing values will be NULL*/

