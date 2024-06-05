USE classicmodels ;

 select * from customers;
 
                                  #####     day 3    answer 1    #####
 
 select  customerNumber ,   customerName , state  ,  creditLimit  from customers  
 where state is not null  and  creditLimit   between 50000 and 100000 
 order by creditLimit desc ;
 
							     #####     day 3    answer 2    #####
 
 select distinct productline from products
 where productline like '%cars%' ; 




                                            #####     day 3    answer 1    #####
 select * from customers;
 
 select  customerNumber ,   customerName , state  ,  creditLimit  from customers  
 where state is not null  and  creditLimit   between 50000 and 100000 
 order by creditLimit desc ;
 
				                        	#####     day 3    answer 2    #####
 
 select distinct productline from products
 where productline like '%cars%' ; 
 
 
                                             #####     day 4    answer 1    #####
                                             
select * from orders;


select ordernumber, status, coalesce(comments, "-") as comments from orders where status = "shipped";

                                     #####     day 4    answer 2    #####         
                                     
select* from employees;    

select employeenumber, firstname,jobtitle,
case 
 when jobTitle = "president" THEN "P"
 WHEN jobTitle = "Manager" THEN "SM"
 WHEN jobTitle = "Sales Rep" THEN "SR"
 WHEN jobTitle = "VP" THEN "VP"
 ELSE jobTitle
 END AS jobTitle_Abbreviation
FROM employees;

                                              #####     day 5   answer 1    #####   
									
select * from PAYMENTS ;     

select  year(paymentdate) as Year,
min(amount) as  'Min Amount'
from payments
group by year
order by year;                    

                                            #####     day 5   answer 2    #####
 
 select * from orders;
 
SELECT YEAR(orderDate) AS Year,
    CONCAT('Q', QUARTER(orderDate)) AS quarter,
    COUNT(DISTINCT customerNumber) AS 'unique Customers',
    COUNT(orderNumber) AS 'Total Orders'
FROM orders
GROUP BY Year, quarter
ORDER BY Year, quarter;

                                           #####     day 5   answer 3    #####   
                                             
select * from payments;

SELECT 
    DATE_FORMAT(paymentDate, '%b') AS Month, CONCAT(ROUND(SUM(amount) / 1000), 'K') AS 'formatted Amount'
FROM payments
GROUP BY month
HAVING SUM(amount) BETWEEN 500000 AND 1000000
ORDER BY SUM(amount) DESC;    
 
										#####     day 6   answer 1    ##### 
create table  journey 
( BUS_ID int(150)  NOT NULL,
 BUS_NAME  VARCHAR(150)  NOT NULL ,
 Source_Station VARCHAR(150)  NOT NULL,
 Destination VARCHAR(150) NOT NULL,
 Email VARCHAR(150)  NOT NULL  );
 
select * from journey ;								
                                        
 
										  #####     day 6   answer 2   ##### 
 
create table Vendor (
Vendor_ID int(150) not null ,
Name varchar(100) not null,
Email varchar(75) not null unique,
Country varchar(100) default "N/A"
);
  
 select * from Vendor ;
  
                                           #####     day 6   answer 3   ##### 
create table movies (
Movies_ID int not null  ,
Name varchar(100) not null,
Release_Year int,
Cast varchar(50) not null,
Gender enum("Male","Female") not null,
No_of_Shows int check (no_of_shows > 0)
);

select * from movies ;

										#####     day 6   answer 4   ##### 
create table Suppliers(
Supplier_id int (150) auto_increment primary key,
supplier_name varchar(250) not null,
location varchar(250)
);

select * from Suppliers;

create table product(
product_Id int (150) auto_increment primary key,
Product_Name varchar(250) not null unique,
description text ,
supplier_id1 int ,
foreign key (supplier_id1) references Suppliers(supplier_id)
);

select * from product;

create table Stock(
id int (150) auto_increment primary key,
product_id1 int ,
balance_stock varchar(50),
foreign key (product_id1) references product(product_id)
);                                       
select * from  Stock ;        

                                       #####     day 7   answer 1   ##### 
                                       
select * from Employees ;									
select* from Customers ;
 
SELECT
    e.employeeNumber AS employeeNumber,
    CONCAT(e.firstName, ' ', e.lastName) AS SalesPerson,
    COUNT(DISTINCT c.customerNumber) AS uniqueCustomers
FROM Employees e
LEFT JOIN
Customers c ON e.employeeNumber = c.salesRepEmployeeNumber
GROUP BY e.employeeNumber, SalesPerson
ORDER BY uniqueCustomers DESC;

                                       #####     day 7   answer 2   #####
  select *from customers ;
  select *FROM ORDERS ;
  select *from ORDERDETAILS ;
  select*from PRODUCTS ;
      
      
SELECT
    c.customerNumber AS CustomerNumber,
    c.customerName AS CustomerName,
    p.productCode AS ProductCode,
    p.productName AS ProductName,
    SUM(od.quantityOrdered) AS Ordered_Qty,
    IFNULL(p.quantityInStock, 0) AS Total_inventory,
    IFNULL(p.quantityInStock - SUM(od.quantityOrdered), 0) AS Left_Qty
FROM Customers c
JOIN Orders o ON c.customerNumber = o.customerNumber
JOIN OrderDetails od ON o.orderNumber = od.orderNumber
JOIN Products p ON od.productCode = p.productCode
LEFT JOIN products s ON p.productCode = s.productCode
GROUP BY c.customerNumber, p.productCode
ORDER BY c.customerNumber;
                                   
                                         #####     day 7   answer 3  #####
    CREATE TABLE laptop (
laptop_name varchar(100) not null
);
CREATE TABLE colour (
colour_name varchar(100) not null
);

INSERT INTO laptop(laptop_name) VALUES ('HP'),('DELL'),('HP');
INSERT INTO colour(colour_name) VALUES ('SLIVER'),('WHITE'),('BLACK');

select l.laptop_name,c.colour_name
FROM laptop l
CROSS JOIN colour c ;
                                          
 SELECT *FROM LAPTOP ;  
 select * FROM COLOUR;

						                       #####     day 7   answer 4  #####
                                               
create table project1 ( EmployeeID int(150) , Full_Name varchar (150) , Gender varchar (10), ManagerID int (10)) ;
			
INSERT INTO Project1 VALUES (1, 'Pranaya', 'Male', 3),
(2, 'Priyanka', 'Female', 1),
(3, 'Preety', 'Female', NULL),
(4, 'Anurag', 'Male', 1),
(5, 'Sambit', 'Male', 1),
(6, 'Rajesh', 'Male', 3),
(7, 'Hina', 'Female', 3); 
 select *from project1 ;    
 
create table project2 ( ManagerID int(15) , Full_Name varchar (150) , Gender varchar (10)) ;
			
INSERT INTO Project2 VALUES 
(1, 'Pranaya', 'Male'),
(2, 'Priyanka', 'Female'),
(3, 'Preety', 'Female');

select *from project2 ;


select  P1. Full_Name AS "Manager_Name" , P2. Full_Name AS "Emp_Name"
FROM Project1 P1  join Project2 P2 ;
                                           ##### OR ####
    
select  P1. Full_Name AS "Manager_Name", P2. Full_Name AS "Emp_Name"
FROM Project1 P1 cross join Project2 P2 ;
                                           ##### OR ####
select  P1. Full_Name AS "Manager_Name", P2. Full_Name AS "Emp_Name"
FROM Project2 P2 , Project1 P1 ;

                                             #####     day 8   answer 1   #####
                                             
    CREATE TABLE facility (
Facility_ID int not null,
Name varchar(100),
State varchar(100),
Country varchar(100)
);
ALTER TABLE facility MODIFY COLUMN Facility_ID int primary key auto_increment;

ALTER TABLE facility ADD COLUMN city varchar(100) not null after name;

describe facility;                                         
                                             
                                   #####     day 9   answer 1   #####           
CREATE TABLE university (
ID int primary key,
Name varchar(100)
);

INSERT INTO University
VALUES (1, "       Pune          University     "), 
	   (2, "  Mumbai          University     "),
	   (3, "     Delhi   University     "),
	   (4, "Madras University"),
	   (5, "Nagpur University");


set sql_safe_updates=0;
UPDATE university SET Name = REPLACE(Name,' ','');

SELECT * FROM university;                                    
                                               #####     day 10   answer 1   #####  

CREATE VIEW products_status AS
SELECT
 YEAR(o.orderDate) AS Year,
 CONCAT(
  count(od.priceEach),
   ' (',
    ROUND((SUM(od.priceEach * od.quantityOrdered) / (SELECT SUM(od2.priceEach * od2.quantityOrdered) FROM OrderDetails od2)) * 100),
	'%)'
    ) AS Value
FROM Orders o
JOIN OrderDetails od ON o.orderNumber = od.orderNumber
GROUP BY Year ORDER BY Value desc;

select *FROM   products_status ;
                                               #####     day 11   answer 1   ##### 

select * from customers;
CALL GetCustomerLevel(103,@level);

SELECT @level AS CustomerLevel;


DELIMITER //

CREATE PROCEDURE GetCustomerLevel(IN customerNumber INT, OUT customerLevel VARCHAR(10))
BEGIN
    DECLARE credit DECIMAL(10, 2);
    SELECT creditLimit INTO credit FROM Customers WHERE customerNumber = customerNumber LIMIT 1;
    IF credit > 100000 THEN
	SET customerLevel = 'Platinum';
    ELSEIF credit >= 25000 AND credit <= 100000 THEN
	SET customerLevel = 'Gold';
    ELSE
        SET customerLevel = 'Silver';
    END IF;
END //

DELIMITER ;
CALL GetCustomerLevel(103,@level);
SELECT @level AS "Customer Level";

                                    #####     day 11   answer 2   #####

DELIMITER //
CREATE PROCEDURE Get_country_payments(IN inputYear INT, IN inputCountry VARCHAR(255))
BEGIN
    SELECT
        YEAR(p.paymentDate) AS Year,
        c.country AS Country,
        CONCAT(FORMAT(SUM(p.amount)/1000, 0), 'K') AS 'Total Amount'
    FROM Payments p
    JOIN Customers c 
    ON p.customerNumber = c.customerNumber
    WHERE
        YEAR(p.paymentDate) = inputYear AND c.country = inputCountry
    GROUP BY
        Year, Country;
END //

DELIMITER ;

drop procedure get_country_payments;
CALL Get_country_payments(2003, 'France');

                                            #####     day 12   answer 1   #####

SHOW COLUMNS FROM Orders;

WITH YearMonthOrders AS (
  SELECT
    EXTRACT(YEAR FROM orderDate) AS order_year,
    DATE_FORMAT(orderDate, '%M') AS order_month,
    COUNT(*) AS order_count
  FROM
    Orders
  GROUP BY
    order_year, order_month
  ORDER BY
    order_year, order_month
),

YoYPercentageChange AS (
  SELECT
    a.order_year,
    a.order_month,
    a.order_count,
    b.order_count AS prev_year_order_count,
    CASE
      WHEN b.order_count IS NULL THEN 'N/A' -- Avoid division by zero
      ELSE
        CONCAT(
          ROUND(((a.order_count - b.order_count) / b.order_count) * 100),
          '%'
        )
    END AS yoy_percentage_change
  FROM
    YearMonthOrders a
  LEFT JOIN
    YearMonthOrders b
  ON
    a.order_year = b.order_year + 1
    AND a.order_month = b.order_month
)

SELECT
  order_year,
  order_month,
  order_count,
  yoy_percentage_change
FROM
  YoYPercentageChange;
  
  
                                       #####     day 12   answer 2   #####
                                       
                                       
 CREATE TABLE emp_udf (
    Emp_ID INT AUTO_INCREMENT PRIMARY KEY,
    Name VARCHAR(255) NOT NULL,
    DOB DATE
);

INSERT INTO emp_udf (Name, DOB)
VALUES 
    ("Piyush", "1990-03-30"),
    ("Aman", "1992-08-15"),
    ("Meena", "1998-07-28"),
    ("Ketan", "2000-11-21"),
    ("Sanjay", "1995-05-21");
    
DELIMITER //

CREATE FUNCTION calculate_age(date_of_birth DATE)
RETURNS VARCHAR(50)
DETERMINISTIC
BEGIN
    DECLARE years INT;
    DECLARE months INT;
    DECLARE age VARCHAR(50);
 SET years = TIMESTAMPDIFF(YEAR, date_of_birth, CURDATE());
 SET months = TIMESTAMPDIFF(MONTH, date_of_birth, CURDATE()) % 12;
  IF years = 0 THEN
	SET age = CONCAT(months, ' months');
    ELSEIF months = 0 THEN
	SET age = CONCAT(years, ' years');
    ELSE
        SET age = CONCAT(years, ' years ', months, ' months');
    END IF;

    RETURN age;
END //

DELIMITER ;

SELECT Emp_ID,Name, DOB, calculate_age(DOB) AS Age FROM emp_udf;

                                    #####     day 13   answer 1   #####


SELECT CustomerNumber, CustomerName
FROM Customers
WHERE CustomerNumber NOT IN (SELECT CustomerNumber FROM Orders);
 
                                    #####     day 13   answer 2   #####
SELECT C.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount
FROM Customers AS C
LEFT JOIN Orders AS O ON C.CustomerNumber = O.CustomerNumber
GROUP BY C.CustomerNumber, C.CustomerName
UNION
SELECT O.CustomerNumber, C.CustomerName, IFNULL(COUNT(O.OrderNumber), 0) AS OrderCount
FROM Customers AS C
RIGHT JOIN Orders AS O ON C.CustomerNumber = O.CustomerNumber
GROUP BY O.CustomerNumber, C.CustomerName;

									#####     day 13   answer 3   #####
SELECT
    OrderNumber,
    MAX(QuantityOrdered) AS quantityOrdered
FROM
    Orderdetails AS od1
WHERE
    QuantityOrdered < (
        SELECT MAX(QuantityOrdered)
        FROM Orderdetails AS od2
        WHERE od1.OrderNumber = od2.OrderNumber
    )
GROUP BY OrderNumber;

                                     #####     day 13   answer 4   #####
    SELECT
    MAX(ProductCount) AS "MAX(Total)",
    MIN(ProductCount) AS "MIN(Total)"
FROM (
    SELECT
        OrderNumber,
        COUNT(*) AS ProductCount
    FROM
        Orderdetails
    GROUP BY
        OrderNumber
) AS Counts;

                                             #####     day 13   answer 5  #####
SELECT p.ProductLine,
    COUNT(*) AS Total
FROM
    Products AS p
JOIN (
    SELECT
        AVG(BuyPrice) AS AvgBuyPrice
    FROM
        Products
) AS avg_prices
ON p.BuyPrice > avg_prices.AvgBuyPrice
GROUP BY
    p.ProductLine
ORDER BY
    Total DESC;
    
                                            #####     day 14   answer 1  #####


CREATE TABLE Emp_EH (
    EmpID INT PRIMARY KEY,
    EmpName VARCHAR(255),
    EmailAddress VARCHAR(255)
);


DELIMITER //

CREATE PROCEDURE InsertEmp_EH(
    IN p_EmpID INT,
    IN p_EmpName VARCHAR(255),
    IN p_EmailAddress VARCHAR(255)
)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error occurred';
    END;
    START TRANSACTION;
    INSERT INTO Emp_EH (EmpID, EmpName, EmailAddress)
    VALUES (p_EmpID, p_EmpName, p_EmailAddress);

    COMMIT;
END //
 
 select *from InsertEmp_EH ;
 
 
DELIMITER ;

 #####     day 15   answer 1  #####

CREATE TABLE Emp_BIT (
    Name VARCHAR(255),
    Occupation VARCHAR(255),
    Working_date DATE,
    Working_hours INT
);


INSERT INTO Emp_BIT VALUES
('Robin', 'Scientist', '2020-10-04', 12),  
('Warner', 'Engineer', '2020-10-04', 10),  
('Peter', 'Actor', '2020-10-04', 13),  
('Marco', 'Doctor', '2020-10-04', 14),  
('Brayden', 'Teacher', '2020-10-04', 12),  
('Antonio', 'Business', '2020-10-04', 11);


DELIMITER //

CREATE TRIGGER EnsurePositiveWorkingHours
BEFORE INSERT ON Emp_BIT
FOR EACH ROW
BEGIN
    IF NEW.Working_hours < 0 THEN
        SET NEW.Working_hours = -NEW.Working_hours;
    END IF;
END //
DELIMITER ;
                                      
