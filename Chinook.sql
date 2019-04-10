-- SQL Lab 

-- 2.0 SQL Queries
-- In this section you will be performing various queries against the Oracle Chinook database.
    -- 2.1 SELECT
    -- Task – Select all records from the Employee table.
        SELECT * FROM chinook.employee;
    -- Task – Select all records from the Employee table where last name is King.
        SELECT * FROM chinook.employee WHERE lastname = 'King';
    -- Task – Select all records from the Employee table where first name is Andrew and REPORTSTO is NULL.
        SELECT * FROM chinook.employee WHERE firstname = 'Andrew' AND reportsto isNull;
    -- 2.2 ORDER BY
    -- Task – Select all albums in Album table and sort result set in descending order by title.
        SELECT * FROM Album ORDER BY title DESC;
    -- Task – Select first name from Customer and sort result set in ascending order by city
        SELECT firstname FROM Customer ORDER BY city ASC;
    -- 2.3 INSERT INTO
    -- Task – Insert two new records into Genre table
        INSERT INTO genre VALUES (26, 'Blue Grass'), (27, 'Electro Swing');
    -- Task – Insert two new records into Employee table
        INSERT INTO employee
        VALUES(9,'Smith','Mr.','respectable title', 1,	'1997-12-11 07:00:00', '2018-03-04 09:00:00', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3350', '+1 (403) 467-8772',	'laura@employee.com'), 
            (10, 'Smith','Mrs','respectable title', 1,	'1996-12-11 07:00:00', '2018-03-04 09:00:00', '923 7 ST NW', 'Lethbridge', 'AB', 'Canada', 'T1H 1Y8', '+1 (403) 467-3349', '+1 (403) 467-8772',	'Aemployee@employee.com)');
    -- Task – Insert two new records into Customer table
        INSERT INTO customer
        VALUES (60,'Joe', 'Sperduto', 'Revature', 'USF Campus', 'Tampa', 'FL', 'USA', '33612', '800-000-0001', '800-100-0001', 	3), 
                (61,'Lauren', 'Smith', 'Revature', 'USF Campus', 'Tampa', 'FL', 'USA', '33612', '800-000-0002', '800-100-0002', 	3);
    -- 2.4 UPDATE
    -- Task – Update Aaron Mitchell in Customer table to Robert Walter
        UPDATE customer
        SET firstname = 'Robert', lastname = 'Walter'
        Where firstname = 'Aaron' AND lastname = 'Mitchell';
    -- Task – Update name of artist in the Artist table “Creedence Clearwater Revival” to “CCR”
        UPDATE artist
        SET name = 'CCR'
        Where name = 'Creedence Clearwater Revival';
    -- 2.5 LIKE
    -- Task – Select all invoices with a billing address like “T%”
        SELECT *
        FROM invoice
        WHERE billingaddress LIKE 'T%'
    -- 2.6 BETWEEN
    -- Task – Select all invoices that have a total between 15 and 50
        SELECT *
        FROM invoice
        WHERE total BETWEEN 15 AND 50;
    -- Task – Select all employees hired between 1st of June 2003 and 1st of March 2004
        SELECT *
        FROM employee
        WHERE hiredate BETWEEN '2003-06-01 00:00:00' AND '2004-03-01 00:00:00';
    -- 2.7 DELETE
    -- Task – Delete a record in Customer table where the name is Robert Walter (There may be constraints that rely on this, find out how to resolve them).
        DELETE FROM invoiceline WHERE invoiceid In (SELECT invoiceid FROM invoice WHERE customerid IN (SELECT customerid FROM customer WHERE firstname = 'Robert' AND lastname = 'Walter'));
        DELETE FROM invoice WHERE customerid IN (SELECT customerid FROM customer WHERE firstname = 'Robert' AND lastname = 'Walter');
        DELETE FROM customer WHERE firstname = 'Robert' AND lastname = 'Walter';
-- 3.0	SQL Functions
-- In this section you will be using the Oracle system functions, as well as your own functions, to perform various actions against the database
    -- 3.1 System Defined Functions
    -- Task – Use a function that returns the current time.
        SELECT CURRENT_TIME;
    -- Task – Use a function that returns the length of a mediatype from the mediatype table
        SELECT LENGTH('MPEG audio file');
    -- 3.2 System Defined Aggregate Functions
    -- Task – Use a function that returns the average total of all invoices
        SELECT AVG(total) FROM invoice;
    -- Task – Use a function that returns the most expensive track
        Select * FROM track WHERE unitprice in (SELECT MAX(unitprice) FROM track);
-- 7.0 JOINS
-- In this section you will be working with combing various tables through the use of joins. You will work with outer, inner, right, left, cross, and self joins.
    -- 7.1 INNER
    -- Task – Create an inner join that joins customers and orders and specifies the name of the customer and the invoiceId.
        SELECT  customer.firstname, customer.lastname, invoice.invoiceid
        FROM customer
        INNER JOIN invoice
        ON customer.customerid = invoice.customerid;
    -- 7.2 OUTER
    -- Task – Create an outer join that joins the customer and invoice table, specifying the CustomerId, firstname, lastname, invoiceId, and total.
        SELECT customer.CustomerId, customer.firstname, customer.lastname, invoice.invoiceId, invoice.total
        FROM customer
        FULL OUTER JOIN invoice
        ON customer.CustomerId = invoice.CustomerId;
    -- 7.3 RIGHT
    -- Task – Create a right join that joins album and artist specifying artist name and title.
        SELECT artist.name, album.title
        FROM album
        RIGHT JOIN artist
        ON album.artistid = artist.artistid;
    -- 7.4 CROSS
    -- Task – Create a cross join that joins album and artist and sorts by artist name in ascending order.
        SELECT * 
        FROM album 
        CROSS JOIN artist
        ORDER BY name ASC;
    -- 7.5 SELF
    -- Task – Perform a self-join on the employee table, joining on the reportsto column.
        SELECT t1.*, t2.reportsto
        FROM employee T1, employee T2;



