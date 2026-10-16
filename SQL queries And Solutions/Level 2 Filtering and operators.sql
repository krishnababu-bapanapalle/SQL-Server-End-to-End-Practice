Level 2: Filtering and operators (16–30)

16. Find customers from Bangalore, Chennai, or Hyderabad.

select customername,city
from customers
where city in('bangalore','chennai','hyderabad')

17. Find products whose price is not between ₹1,000 and ₹3,000.

select productname,price
from products
where price not between 1000 and 3000

18. Find orders whose status is either Pending or Cancelled.

select *
from orders
where orderstatus in ('Pending' , 'Cancelled')

19. Find orders placed during January 2025.

select *
from orders
where orderdate >='2025-01-01' and orderdate <= '2025-01-31'

20. Find customers whose names end with a.

select customername
from customers
where customername like'%a'

21. Find products whose names contain the letter o.

select productname
from products
where productname like'%o%'

22. Find products costing more than ₹1,000 with stock below 50.

select *
from products
where price >1000 and stock <50

23. Find customers from Bangalore or customers who joined after January 1, 2025.

select *
from customers
where city in ('bangalore') or joindate >'2025-01-01'

24. Find orders that are not delivered.

select *
from orders
where orderstatus <>'delivered'

25. Find customers whose email is missing.

select * 
from customers
where email is null

26. Find products with a price greater than ₹2,000 and less than ₹10,000.

select *
from products
where price between 2000 and 10000

27. Find customers whose names contain exactly five characters.

select *
from customers
where customername like'_____'


28. Find orders placed between February 1, 2025, and April 30, 2025.

select * 
from orders
where orderdate between '2025-02-01' and '2025-04-30'

29. Find products belonging to categories 1, 2, or 4.

select * 
from Products
where CategoryID in(1,2,4)

30. Find customers who joined during 2024 or 2025.

select *
from customers
where joindate between '2024-01-01' and '2026-01-01'

