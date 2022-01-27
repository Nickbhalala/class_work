/*
Nikhil Bhalala
CSC 355 Section :401T
Assignment 2
Date: 10/04/2021
*/

--Q1) LIST  all bookstores in Illinois (‘IL’) and Michigan (‘MI’).
select SCHOOL , CITY , STATE FROM bookstore
WHERE STATE='IL'OR STATE='MI';


--Q2) LIST  names of all bookstores with ‘University’ in their school name
SELECT  SCHOOL  FROM  bookstore
WHERE SCHOOL LIKE '%University%'
ORDER BY school;


-- Q3) LIST textbooks written by ‘Vandemeer’ that cost less than sixty
--dollars, listed from lowest price to highest price
SELECT TITLE , SUBJECT , PRICE  FROM textbook 
WHERE AUTHOR='Vandemeer' and  PRICE<60
ORDER BY PRICE ASC;


--Q4) LIST  subject ordered from the highest average price to the lowest average price.
SELECT SUBJECT ,AVG(PRICE) FROM textbook
GROUP BY SUBJECT
ORDER BY AVG(PRICE) DESC;
--Q5) LIST e the bookstore ID and the number of copies the bookstore ordered in its largest book order. 
SELECT BOOKSTOREID, COUNT(TEXTBOOKID) FROM ordertable
GROUP BY  BOOKSTOREID
ORDER BY bookstoreid;

--Q6)
SELECT SCHOOL FROM ordertable INNER JOIN bookstore ON bookstore.id=ordertable.bookstoreid
WHERE ordertable.orderdate= '15/feb/2021';
--Q7)
select distinct title from ordertable inner join textbook on ordertable.textbookid=textbook.id INNER join bookstore on ordertable.bookstoreid= bookstore.id
where school= 'College of DuPage'
order by title;


--Q8)
select   textbook.id, count(ordertable.textbookid) from textbook left OUTER join ordertable on textbook.id=ordertable.textbookid
GROUP by textbook.id , textbook.subject
HAVING textbook.subject = 'Mathematics';















