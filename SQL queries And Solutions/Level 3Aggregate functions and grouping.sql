Level 3: Aggregate functions and grouping (31–45)
31. Count the total number of customers.

select count(*) totalcustomers
from customers

32. Count the total number of products.

select count(*) totalproducts
from products

33. Find the maximum product price.

select max(price) maxprice
from products

34. Find the minimum product price.

select min(price) minprice
from products

35. Calculate the average product price.

select avg(price) avgprice
from products


36. Calculate the total stock across all products.

select sum(stock) totalstock
from products

37. Count customers in each city.

select city, count(*) totalcustomers
from customers
group by city
having count(*) >1

38. Count products in each category.

select categoryid,count(*) totalproducts
from products
group by categoryid

39. Find the average product price for each category.

select categoryid,avg(price) avgprice
from products
group by categoryid

40. Find the total quantity ordered for each product.

select productid,sum(quantity) as totalquantity
from orderdetails
group by productid

41. Find the number of orders for each order status.

select orderstatus,count(*) nooforders
from orders
group by OrderStatus

42. Find cities containing more than one customer.

select city, count(*) totalcustomers
from customers
group by city
having count(*) >1

43. Find categories containing more than two products.

select categoryid,count(*) totalproducts
from products
group by categoryid
having count(*)>2

44. Find customers who have placed more than one order.
select customerid,count(*) totalorders
from orders
group by customerid
having count(*) >1

45. Find products whose total ordered quantity is greater than two.

select productid,sum(quantity) totalquantity
from orderdetails
group by productid
having sum(quantity) >2




