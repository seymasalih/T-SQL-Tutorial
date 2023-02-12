-- T-SQL, also known as Transact-SQL, is a programming language used to manage and manipulate data in Microsoft SQL Server.
-- I have shared the queries in T-SQL with you along with both syntax and examples.

-- 1.) Connect to a SQL Server instance:
USE <database_name>
GO
-- 2.) Create a new table:
CREATE TABLE <table_name> (
    <column_name> <data_type> <constraints>,
    <column_name> <data_type> <constraints>,
    ...
);

-- 3.) INSERT INTO
--Insert a new row into a table:
INSERT INTO <table_name> (<column1_name>, <column2_name>, <column3_name>);
VALUES (<value1>, <value2>, <value3>);

INSERT INTO Clients(ID,First_Name,Country) VALUES(71,'Dennis','Canada');
--After this command, a new record will be added to the table.

INSERT INTO Clients(ID,First_Name,Country) VALUES(72,'Joe');
--If data is not entered in the existing columns, this time only the specified fields will be added and the other fields will remain empty.
--Then we can fill in the empty parts with the UPDATE & SET command.

-- 4.) SELECT
--Select (above the name) shows the expressions you typed right next to the Select.

SELECT <column_name> FROM <table_name>;
SELEC * FROM <table_name> -- "*" select all the fields available in the table.

-- 5.) WHERE
-- The WHERE clause is used to filter and condition
SELECT * FROM <table_name> WHERE <condition>;
--for example
SELECT * FROM Clients WHERE Country='Turkey';

/*
Here are the operators you can use with "where": 
=	Equal	
>	Greater than	
<	Less than	
>=	Greater than or equal	
<=	Less than or equal	
<>	Not equal. Note: In some versions of SQL this operator may be written as !=
*/

-- And also there are many clauses that can be used with where. now I'm going to include them here.

-- 6.) UPDATE & SET
-- UPDATE Command is used to update existing records in a database.
-- SET is a keyword used to assign a value to a defined variable.
UPDATE <table_name>
SET <column1_name> = <value1>, <column2_name> = <value2>, ...
WHERE condition;

UPDATE Clients
SET Country = 'Sweden'
WHERE ID=72;

-- 7.) DELETE
-- Delete existing row or rows.
DELETE FROM <table_name> WHERE <conditions>

DELETE FROM <Clients> WHERE Country='Saudi Arabia'
--We should be careful when using DELETE statement. This sql query ALL records that country is Saudi Arabia.

DELETE FROM <Clients> WHERE Country='Saudi Arabia' AND ID BETWEEN 755 AND 800
-- This query is more specific than up there. Deleted ONLY records country is Saudi Arabia and ID between 775 and 800 at the same time.

DELETE FROM <table_name>;
--This query not delete table. It just deletes all records in table.

-- 8.) AS (ALIASES)
-- In this, as in any language, it is used to give a nickname to a certain thing.
SELECT Count(*) AS <determined_column_name> FROM (SELECT DISTINCT <column_name> FROM <table_name>);

-- 9.) ALTER TABLE
--ALTER TABLE command; used to add, delete, or modify the structure of an existing column in an existing table.

	-- ADDING COLUMNS WITH ALTER TABLE
ALTER TABLE <table_name> ADD
<column1_name> <data_type>,
<column2_name> <data_type> ... ;

	-- ADDING Column Auto-Increasing Number WITH ALTER TABLE
ALTER TABLE <table_name> ADD <column_name> INT IDENTITY(1,1)
	--For example, this increases by starting from 1 and adding 1 to each new record. It is typically used in ID columns.

	-- DROP COLUMNS WITH ALTER TABLE
ALTER TABLE <table_name> DROP COLUMN
<column1_name>
<column2_name>

	-- CHANGING DATA TYPE OF COLUMN
ALTER TABLE <table_name> ALTER COLUMN <column_name> <data_type>

	--NULL CONSTRAINT ON THE COLUMN
	 --This means that the column will not accept NULL values. It is most commonly used in unique columns, such as ID.
ALTER TABLE <table_name> ALTER COLUMN <column_name> <data_type> NOT NULL

	-- RENAME COLUMN
ALTER TABLE <table_name> RENAME COLUMN <OLD_column_name> to <NEW_column_name>
--If you want enough explanation about creating the database or table with MSSQL interface , you can look at "https://medium.com/@seymasalih/create-a-database-in-sql-with-interface-de7f4e81d793". 

-- 10.) DECLARE & (SET | SELECT)
-- The DECLARE command is used in variable definitions.
-- SET is a keyword used to assign a value to a defined variable.
DECLARE @<VARIABLE_NAME> <data_type>
SET @<VARIABLE_NAME = <value>

DECLARE @<VARIABLE_NAME> <data_type>
SELECT @<VARIABLE_NAME = <value>
-- Appears value when table views


-- 11.) AND
--The AND operator displays a record if all conditions separated by AND are TRUE.
SELECT * FROM <table_name> WHERE <condition> AND <condition>;
SELECT * FROM Clients WHERE Country='Turkey' AND Country='India';

-- 12.) OR
-- Returns a record if at least one of the conditions is true.
SELECT * FROM <table_name> WHERE <condition> OR <condition>;

-- 13.) NOT
-- Returns a record if condition or conditions are not true.
SELECT * FROM <table_name> WHERE NOT <condition>;
SELECT * FROM Clients WHERE Country='Turkey'; -- returns records whose country is not Turkey.

--Moreover these clauses are combinable each other.
SELECT * FROM Clients WHERE NOT Country='Germany' AND NOT Country='USA';

-- 14.) LIKE
-- Queries records with the specified specific property with 2 operators : "%" percent  and "_" underscore.

SELECT * FROM <table_name> WHERE <column_name> LIKE '<chars>%';
/*
If chars would equal="a" this query returns records what begining with "a". For examp: "Afghanistan"
LIKE can query even if chars can single or multiple.
*/
SELECT * FROM <table_name> WHERE <column_name> LIKE '%<chars>';
--If chars would equal="a" this query returns records what ending with "a". For examp: "Nigeria"

SELECT * FROM <table_name> WHERE <column_name> LIKE '%<chars>%';
--If chars would equal="ab" this query returns records contains "ab". For examp: "Zimbabwe"

SELECT * FROM <table_name> WHERE <column_name> LIKE 'c%o';
--Returns records start with "a" and ends with "o". For examp: "Colombia"

SELECT * FROM <table_name> WHERE <column_name> LIKE '[a-c]%';
--The following SQL statement selects all customers with a City starting with "a", "b", or "c":

SELECT * FROM <table_name> WHERE <column_name> LIKE 'a_%';
--If chars would equal="a" , returns any values that start with "a" and are at least 2 characters in length.

SELECT * FROM <table_name> WHERE <column_name> LIKE 'a__%';
--If chars would equal="a" , returns any values that start with "a" and are at least 3 characters in length.

-- 15.) NOT LIKE
--Opposite of LIKE
SELECT * FROM <table_name> WHERE <column_name> LIKE 'a%';
--Returns records don't begining with a.

-- 16.) IN
-- Returns the data in the property we specify in a column. We can use single or multiple values.
SELECT * FROM <table_name> WHERE <column_name> IN (<values>);

SELECT * FROM Clients WHERE Country IN ('USA', 'Spain');
-- The following SQL statement selects all records that contains "USA" or "Spain" in Country column.

SELECT * FROM Clients WHERE First_Name='Jenny' AND Country IN ('USA');
-- This sql statement returns all  records that first_name is Jenny and Country is USA as well

-- 17.) NOT IN
--Returns data other than the specified data in a series.  We can use single or multiple values.
SELECT * FROM <table_name> WHERE <column_name> NOT IN (<values>);

SELECT * FROM Clients WHERE Sex NOT IN ('Male');
-- This following SQL statement selects all records that not contains 'Male' in Sex column.

-- 18.) BETWEEN
-- BETWEEN selects values ​​in a certain range. Values ​​can be numbers, text, or dates.
SELECT * FROM <table_name> WHERE <column_name> BETWEEN <values> AND <values>;

SELECT * FROM Clients WHERE First_Name BETWEEN 'A' AND 'C';
--This sql statement returns all  records that are first name beginning with A , B, C. Like Andre , Boby , Charlie

SELECT * FROM Clients WHERE ID BETWEEN 1 AND 10 AND Country='France';
--This sql statement returns all  records that Country is France and at the same time ID being between 1-10.

-- 19.) NOT BETWEEN
-- Yeah Opposite of BETWEEN. Returns data outside the specified range.
SELECT * FROM Clients WHERE ID NOT BETWEEN 1 AND 10;
-- This sql statement select all record that ID cannot be between 1 and 10.

-- 20.) ORDER BY
--Determines the order of the returned records by column or columns.
--ASC for small to large is the default, and DESC for sorting from largest to smallest. These data can be string , integer anything
SELECT * FROM <table_name> ORDER BY <column_name>;

SELECT * FROM Clients ORDER BY Country;
--The sql statement sorts all rows so that the Country column goes from alphabet A to X.

SELECT * FROM Clients ORDER BY Country DESC;
--The sql statement sorts all rows so that the Country column goes from alphabet X to A.


SELECT * FROM Cliwnts ORDER BY Country, First_Name;
/*
After being sorted by the country column, the names are also sorted among themselves.
It is be like :
ID	First_Name		Country
8	Adam			Algeria
3	Benjamin		Algeria
12	Austin			Bulgaria
..
..
*/

-- 21.) COUNT()
--Returns the number of rows to return. It is a pretty much used mathematical function.
SELECT COUNT(<column_name>)	FROM <table_name> ;

Select COUNT(Country) FROM Clients WHERE Country LIKE 'C%';
-- This sql statement returns the number of rows that country begins with C.

-- 22.) AVG()
--Returns the average value of a numeric column.
SELECT AVG(<column_name>) FROM <table_name> ;

SELECT AVG(Age) FROM Clients;
--Returns the average of the age column.

-- 23.) SUM()
-- Returns the total sum of a numeric column.
SELECT SUM(<column_name>) FROM <table_name> ;

SELECT SUM(Quantity) FROM Products;
--This sql statement returns the sum of the numeric data in the quantity column.

SELECT SUM(Quantity) FROM Products WHERE ProductName='Apple';
--This sql statement returns the sum of the quantity in the given apple order.

-- 24.) MIN
--The MIN() function returns the smallest value of the selected column. Just one value.
-- If you want 10 smallest records of the selected column , you can use "TOP & ORDERY BY...ASC" keywords. There is use below.
SELECT MIN(<column_name>) AS SmallestColumn FROM <table_name>

SELECT MIN(Age) AS SmallestAge FROM Clients
--For example output it is like be :
/*
SmallestAge
18
*/

-- 25.) MAX
-- The MAX() function returns the biggest value of the selected column. Just one value.
-- If you want 10 biggest records of the selected column , you can use "TOP & ORDER BY ... DESC" keywords. There is use below.
SELECT MAX(<column_name>) AS BiggestColumn FROM <table_name>

SELECT MAX(Age) AS BiggestAge FROM Clients
--For example output it is like be :
/*
BiggestAge
68
*/

-- 26.) IS NULL
--For check Null Values at the only one column. 
SELECT * FROM <table_name> WHERE <column_name> IS NULL;

--If you want check multiple column , you have to combine many IS NULL with OR or AND.
SELECT * FROM <table_name> WHERE <column1_name> IS NULL OR <column2_name> IS NULL OR <column3_name>;

SELECT * FROM Clients WHERE Country IS NULL;
--If there is NULL values Country column , return that records. If there is not , returns nothing.

SELECT COUNT(First_Name) FROM Clients WHERE First_Name IS NULL;
--This sql statement returns the number of rows that contain null in the First_Name column. If there is not , returns 0.

-- 27.) IS NOT NULL
-- So you can check records that are not NULL value with this keyword. The same rules apply as IS NULL.
SELECT * FROM <table_name> WHERE <column_name> IS NOT NULL;

-- 28.) SELECT DISTINCT
--The SELECT DISTINCT statement is used to return only distinct (different) values. So duplicate values return only once.
SELECT DISTINCT <column_name> FROM <table_name>;

-- 29.) SELECT TOP
-- The SELECT TOP command is used to specify the number of rows to call.
SELECT TOP <number> | <number> PERCENT *|<column_name> FROM <table_name>;

	-- <number>
SELECT TOP 3 * FROM Clients
--Returns the first 3 records in the table.

SELECT TOP 3 FirstName,SecondName FROM Clients
--Shows the FirstName and SecondName columns of the first 3 records in the table.

SELECT TOP 10 * FROM Clients ORDER BY Age;
--This sql query returns the first 10 data from the table, sorted from smallest to large based on the data in the age column.
--In other words, it returns the 10 records with the youngest age.

SELECT TOP 10 * FROM Clients ORDER BY Age DESC;
--In other words, it returns the 10 records with the oldest age.

	-- <number> PERSENT
SELECT TOP 50 PERCENT * FROM Clients;
-- The following SQL statement selects the first 50% of the records from the "Clients" table

-- 30.) GROUP BY
-- Group the result set by one or more columns
/*
Mathematical functions such as how many of these grouped records are (COUNT),
mean value (AVG) ,
sum value (SUM),
highest value (MAX) and lowest value (MIN)
in the groups are used.
*/

 SELECT <column_name> FROM <table_name> GROUP BY <column_name>
