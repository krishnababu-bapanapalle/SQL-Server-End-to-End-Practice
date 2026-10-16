Level 1: Basic SQL (1–15)

SELECT * FROM Customers;
SELECT * FROM Categories;
SELECT * FROM Products;
SELECT * FROM Orders;
SELECT * FROM OrderDetails;


1. Display all records from the Customers table.

select * from customers

2. Display only customer names and cities.

select customername ,city
from customers

3. Display all unique cities from the Customers table.

select distinct city 
from customers

4. Display all products in ascending order of price.

select productname, price
from products
order by price asc

5. Display the five most expensive products.

select top 5 productname,price
from products
order by price desc

6. Display the three cheapest products.

select top 3 productname,price
from products
order by price asc

7. Display customers in descending order of JoinDate.

select *
from customers
order by joindate desc

8. Display products whose price is greater than ₹2,000.

select productname,price
from products
where price > 2000

9. Display products whose stock is less than 50.

select productname,stock
from products
where stock < 50

10. Display customers who belong to Bangalore.

select customername , city
from customers
where city ='bangalore'
11. Display customers who do not belong to Chennai.

select customername ,city
from customers
where city <>'chennai'

12. Display products priced between ₹1,000 and ₹5,000.

select productname,price
from products
where price between 1000 and 5000

13. Display customers whose names start with S.

select customername
from customers
where customername like's%'

14. Display products whose names contain SQL.

select *
from products
where productname like'%sql%'

15. Display the next five products after skipping the first five, ordered by ProductID.

select *
from products
order by productid asc
offset 5 rows fetch next 5 rows only 







