Drop table IF EXISTS books ;
Create Table books (
Book_ID	int PRIMARY KEY,
Title	vaRCHAR(100),
Author	vaRCHAR(100),
Genre	vaRCHAR(100),
Published_Year	INT,
Price	numeric(10, 2),
Stock	int
);

Drop table IF EXISTS CUSTOMERS ;
Create Table CUSTOMERS (
Customer_ID	INT,
Name	VARCHAR (100),
Email	VARCHAR (100),
Phone	INT,
City	VARCHAR (100),
Country	VARCHAR (100)
);

Drop table IF EXISTS ORDERS;
Create Table ORDERS (
Order_ID INT,
Customer_ID	INT,
Book_ID	INT,
Order_Date	DATE,
Quantity int,
Total_Amount NUMERIC(10,2)
);

SELECT * FROM books

SELECT * FROM customers

SELECT * FROM orders


1.--- RETRIEVE THE TOTAL NUMBER OF BOOK SOLD EACH GENRE
SELECT b.genre, sum(o.quantity) AS total_quantity
from orders o
JOIN books b on b.book_id = o.book_id
GROUP BY b.genre;

2.--find the average price of books in average of fantasy genre
select avg(price) AS average_price
from books
where genre = 'Fantasy';

3.--- LIST CUSTOMER WHO HAVE PLACED AT LEAST 2 ORDERS
select c.name, o.customer_id, count(book_id)
from orders o
join customers c on c.customer_id=o.customer_id
group by o.customer_id, c.name
HAVING COUNT (book_id) >= 2;

4.-- FIND THE MOST FREQUENT ORDERED BOOK
SELECT  b.title, o.book_id, count(order_id) AS ORDERS_COUNT
from orders o
JOIN books b on b.book_id=o.book_id
group by o.book_id, b.title 
order by orders_count desc limit 1;


5.-- SHOW THE MOST TOP 3 EXPENSIVE BOOKS 'Fantasy' Genre

select title, genre, price from books
where genre='Fantasy'
order by price desc limit 3

6.-- RETRIVE THE TOTAL QUANTITY SOLD BY EACH AUTHOR IWITH BOOK NAME

SELECT B.AUTHOR, B.TITLE, Sum(o.quantity)  AS TOTAL_QUANTITY
from orders o
join books b on b.book_id=o.book_id
group by b.title, b.author;

7. --RETRIVE THE TOTAL QUANTITY SOLD BY EACH AUTHOR

SELECT B.AUTHOR, Sum(o.quantity)  AS TOTAL_QUANTITY
from orders o
join books b on b.book_id=o.book_id
group by  b.author;

8. -- LIST THOSE CITY WHERE CUSTOMER WHO SPEND MORE THAN $30
 SELECT C.CITY, SUM(O.TOTAL_AMOUNT) AS TOTAL_SPEND
 from orders o
 JOIN  CUSTOMERS C ON c.customer_id=o.customer_id
 where o.total_amount > 30
 group by c.city;
 

9. --  FIND THE CUSTOMER WHO SPENT MOST ON ORDERS

SELECT C.NAME, SUM(O.TOTAL_AMOUNT) AS TOTAL_SPENT
FROM ORDERS O
JOIN CUSTOMERS C ON C.CUSTOMER_ID=O.CUSTOMER_ID
GROUP BY C.NAMe
order by total_spent desc;

10. -- CALCULATE THE STOCK REMAINING AFTER FULLFILLING ALL ORDERS

SELECT B.BOOK_ID,B.TITLE, B.STOCK,coalesce(SUM(O.QUANTITY),0) AS TOTAL_ORDER, 
B.STOCK - O.QUANTITY AS REMAINING_STOCK
FROM ORDERS O
left JOIN BOOKS B ON B.BOOK_ID=O.BOOK_ID
GROUP BY B.BOOK_ID,B.TITLE, B.STOCK - O.QUANTITY;

11. --RETRIEVE ALL THE BOOKS IN 'FICTION' GENRE

	SELECT * FROM books
	where genre='Fiction';

12. -- FIND ALL BOOKS PUBLISHED AFTER THE YEAR 1950
  
  SELECT * FROM books
  where published_year>1950;

13. -- LIST ALL THE CUSTOMER FROM THE CANDA
 
 SELECT * FROM customers
 where country='Canada';

14. -- SHOW ORDER PLACED IN NOVEMBER 2023

SELECT * FROM orders
where order_date BETWEEN '2023-11-01' AND '2023-11-30';

15. --  RETRIEVE THE TOTAL STOCK OF BOOKS AVAILABLE

SELECT sum(stock) 
from books AS TOTAL_STOCK

16. -- FIND THE DETAILS OF MOST EXPENSIVE BOOK

 SELECT * FROM books
 ORDER BY PRICE DESC LIMIT 1;

17. -- SHOW ALL THE CUSTOMER WHO ORDERED MORE THAN 1 QUANTITY

SELECT C.NAME, O.QUANTITY AS TOTAL_ORDER
FROM ORDERS O
JOIN CUSTOMERS C ON C.CUSTOMER_ID=O.CUSTOMER_ID
WHERE QUANTITY > 1
GROUP BY C.NAME, O.QUANTITY;

18. -- LIST ALL THE GENRE IN BOOK TABLE

SELECT DISTINCT GENRE 
FROM BOOKS

19. -- FIND THE BOOK WITH THE LOWEST STOCK

SELECT * FROM BOOKS
ORDER BY STOCK ASC LIMIT 1;


20 -- CALCULATE THE TOTAL REVENUE GENERATED FROM ALL ORDERS

SELECT SUM(TOTAL_AMOUNT) FROM ORDERS




