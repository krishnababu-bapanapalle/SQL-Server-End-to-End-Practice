Level 4: SQL functions (46–60)
46. Display all customer names in uppercase.

select upper(customername) customernames
from customers

47. Display all customer names in lowercase.

select lower(customername) customernames
from customers

48. Display the length of every product name.

select len(productname) lenofproductname
from products

49. Display the first three characters of every product name.

select substring(productname,1,3) productname
from products

50. Remove leading and trailing spaces from customer names in the query output.

select trim(customername) customernames
from customers

51. Display the current date and time.

select getdate() currentdate;

52. Extract the year, month, and day from every order date.

select *,year(orderdate) year,datename(month,orderdate) month,datename(weekday,orderdate) day
from orders

53. Calculate the number of days between each order date and the current date.

select *,DATEDIFF(day,orderdate,getdate()) days
from orders

54. Display the date 30 days after each order date.

select *,dateadd(day,30,orderdate) after30daysdate
from orders

55. Display the first day of the month for every order date.

select * ,datefromparts(year(orderdate),month(orderdate),1) firstdayofmonth
from orders

56. Replace missing customer emails with a meaningful label in the output.

select customername,isnull(email,'email not provided') as Email
from customers

57. Use NULLIF to handle blank email strings.

SELECT
    CustomerID,
    CustomerName,
   ISNULL(NULLIF(Email, ''), 'Email Not Provided') AS Email
FROM Customers;

59. Categorize products as Affordable, Medium, or Expensive based on their prices.

select * ,case when price>=5000 then 'Expensive'
               when price<5000 and price>2000 then 'Medium'
               else 'Affordable' 
               end Categorys
from products
         
60. Convert product prices to text and safely convert a valid date string to the DATE data type.

select productname,cast(price as varchar) price
from products

