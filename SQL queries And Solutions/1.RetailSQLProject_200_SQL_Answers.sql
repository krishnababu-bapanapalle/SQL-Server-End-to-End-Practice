/*
RetailSQLProject — Answer Key for 200 MSSQL Practice Questions
Database: RetailSQLProject
Tables: Customers, Categories, Products, Orders, OrderDetails
Run each numbered query separately where appropriate.
Some DDL/DML examples modify data; use a test database or transaction first.
*/
USE RetailSQLProject;
GO

/* LEVEL 1: BASIC SQL */
-- 1
SELECT * FROM Customers;
-- 2
SELECT CustomerName, City FROM Customers;
-- 3
SELECT DISTINCT City FROM Customers;
-- 4
SELECT * FROM Products ORDER BY Price ASC;
-- 5
SELECT TOP 5 * FROM Products ORDER BY Price DESC;
-- 6
SELECT TOP 3 * FROM Products ORDER BY Price ASC;
-- 7
SELECT * FROM Customers ORDER BY JoinDate DESC;
-- 8
SELECT * FROM Products WHERE Price > 2000;
-- 9
SELECT * FROM Products WHERE Stock < 50;
-- 10
SELECT * FROM Customers WHERE City = 'Bangalore';
-- 11
SELECT * FROM Customers WHERE City <> 'Chennai';
-- 12
SELECT * FROM Products WHERE Price BETWEEN 1000 AND 5000;
-- 13
SELECT * FROM Customers WHERE CustomerName LIKE 'S%';
-- 14
SELECT * FROM Products WHERE ProductName LIKE '%SQL%';
-- 15
SELECT ProductID, ProductName, Price
FROM Products ORDER BY ProductID
OFFSET 5 ROWS FETCH NEXT 5 ROWS ONLY;
GO

/* LEVEL 2: FILTERING */
-- 16
SELECT * FROM Customers WHERE City IN ('Bangalore','Chennai','Hyderabad');
-- 17
SELECT * FROM Products WHERE Price NOT BETWEEN 1000 AND 3000;
-- 18
SELECT * FROM Orders WHERE OrderStatus IN ('Pending','Cancelled');
-- 19
SELECT * FROM Orders WHERE OrderDate >= '20250101' AND OrderDate < '20250201';
-- 20
SELECT * FROM Customers WHERE CustomerName LIKE '%a';
-- 21
SELECT * FROM Products WHERE ProductName LIKE '%o%';
-- 22
SELECT * FROM Products WHERE Price > 1000 AND Stock < 50;
-- 23
SELECT * FROM Customers
WHERE City = 'Bangalore' OR JoinDate > '20250101';
-- 24
SELECT * FROM Orders WHERE OrderStatus <> 'Delivered';
-- 25
SELECT * FROM Customers WHERE Email IS NULL;
-- 26
SELECT * FROM Products WHERE Price > 2000 AND Price < 10000;
-- 27
SELECT * FROM Customers WHERE LEN(CustomerName) = 5;
-- 28
SELECT * FROM Orders WHERE OrderDate >= '20250201' AND OrderDate < '20250501';
-- 29
SELECT * FROM Products WHERE CategoryID IN (1,2,4);
-- 30
SELECT * FROM Customers
WHERE JoinDate >= '20240101' AND JoinDate < '20260101';
GO

/* LEVEL 3: AGGREGATES */
-- 31
SELECT COUNT(*) AS TotalCustomers FROM Customers;
-- 32
SELECT COUNT(*) AS TotalProducts FROM Products;
-- 33
SELECT MAX(Price) AS MaximumPrice FROM Products;
-- 34
SELECT MIN(Price) AS MinimumPrice FROM Products;
-- 35
SELECT AVG(Price) AS AveragePrice FROM Products;
-- 36
SELECT SUM(Stock) AS TotalStock FROM Products;
-- 37
SELECT City, COUNT(*) AS CustomerCount FROM Customers GROUP BY City;
-- 38
SELECT CategoryID, COUNT(*) AS ProductCount FROM Products GROUP BY CategoryID;
-- 39
SELECT CategoryID, AVG(Price) AS AveragePrice FROM Products GROUP BY CategoryID;
-- 40
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails GROUP BY ProductID;
-- 41
SELECT OrderStatus, COUNT(*) AS OrderCount FROM Orders GROUP BY OrderStatus;
-- 42
SELECT City, COUNT(*) AS CustomerCount
FROM Customers GROUP BY City HAVING COUNT(*) > 1;
-- 43
SELECT CategoryID, COUNT(*) AS ProductCount
FROM Products GROUP BY CategoryID HAVING COUNT(*) > 2;
-- 44
SELECT CustomerID, COUNT(*) AS OrderCount
FROM Orders GROUP BY CustomerID HAVING COUNT(*) > 1;
-- 45
SELECT ProductID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails GROUP BY ProductID HAVING SUM(Quantity) > 2;
GO

/* LEVEL 4: FUNCTIONS */
-- 46
SELECT UPPER(CustomerName) AS UpperName FROM Customers;
-- 47
SELECT LOWER(CustomerName) AS LowerName FROM Customers;
-- 48
SELECT ProductName, LEN(ProductName) AS NameLength FROM Products;
-- 49
SELECT ProductName, LEFT(ProductName, 3) AS FirstThreeCharacters FROM Products;
-- 50
SELECT TRIM(CustomerName) AS CleanCustomerName FROM Customers;
-- 51
SELECT GETDATE() AS CurrentDateTime;
-- 52
SELECT OrderDate, YEAR(OrderDate) AS OrderYear,
       MONTH(OrderDate) AS OrderMonth, DAY(OrderDate) AS OrderDay
FROM Orders;
-- 53
SELECT OrderID, OrderDate, DATEDIFF(DAY, OrderDate, GETDATE()) AS DaysSinceOrder
FROM Orders;
-- 54
SELECT OrderID, OrderDate, DATEADD(DAY, 30, OrderDate) AS DateAfter30Days
FROM Orders;
-- 55
SELECT OrderDate, DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart
FROM Orders;
-- 56
SELECT CustomerName, ISNULL(Email, 'Not Provided') AS Email FROM Customers;
-- 57
SELECT CustomerName, NULLIF(TRIM(Email), '') AS CleanEmail FROM Customers;
-- 58
SELECT CustomerName, COALESCE(Email, 'No Email') AS Email FROM Customers;
-- 59
SELECT ProductName, Price,
       CASE WHEN Price >= 10000 THEN 'Expensive'
            WHEN Price >= 2000 THEN 'Medium'
            ELSE 'Affordable' END AS PriceCategory
FROM Products;
-- 60
SELECT ProductName, CAST(Price AS VARCHAR(20)) AS PriceText FROM Products;
SELECT TRY_CONVERT(DATE, '2025-12-31') AS ConvertedDate;
GO

/* LEVEL 5: JOINS */
-- 61
SELECT c.CustomerName, o.OrderID
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID;
-- 62
SELECT c.CustomerName, o.OrderID
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID;
-- 63
SELECT c.CustomerID, c.CustomerName
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderID IS NULL;
-- 64
SELECT o.OrderID, c.CustomerName, o.OrderDate
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID;
-- 65
SELECT od.OrderID, p.ProductName, od.Quantity
FROM OrderDetails od JOIN Products p ON od.ProductID = p.ProductID;
-- 66
SELECT p.ProductName, cat.CategoryName
FROM Products p JOIN Categories cat ON p.CategoryID = cat.CategoryID;
-- 67
SELECT c.CustomerName, o.OrderID, p.ProductName, od.Quantity
FROM Customers c
JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;
-- 68
SELECT o.OrderID, c.CustomerName, p.ProductName, od.Quantity, od.UnitPrice
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID;
-- 69
SELECT p.ProductName, cat.CategoryName
FROM Products p LEFT JOIN Categories cat ON p.CategoryID = cat.CategoryID;
-- 70
SELECT c.CustomerName, o.OrderID
FROM Customers c RIGHT JOIN Orders o ON c.CustomerID = o.CustomerID;
-- 71
SELECT c.CustomerName, o.OrderID
FROM Customers c FULL OUTER JOIN Orders o ON c.CustomerID = o.CustomerID;
-- 72
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.ProductName = 'Laptop';
-- 73
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
JOIN Categories cat ON p.CategoryID = cat.CategoryID
WHERE cat.CategoryName = 'Electronics';
-- 74
SELECT p.* FROM Products p
LEFT JOIN OrderDetails od ON p.ProductID = od.ProductID
WHERE od.ProductID IS NULL;
-- 75
SELECT cat.* FROM Categories cat
LEFT JOIN Products p ON cat.CategoryID = p.CategoryID
WHERE p.ProductID IS NULL;
-- 76
SELECT c.CustomerID, c.CustomerName, COUNT(DISTINCT od.ProductID) AS DifferentProducts
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(DISTINCT od.ProductID) > 1;
-- 77
SELECT OrderID, SUM(Quantity) AS TotalQuantity
FROM OrderDetails GROUP BY OrderID;
-- 78
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE od.UnitPrice > 5000;
-- 79
SELECT c.CustomerID, c.CustomerName,
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalRevenue
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
GROUP BY c.CustomerID, c.CustomerName;
-- 80
SELECT cat.CategoryName,
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalRevenue
FROM Categories cat JOIN Products p ON cat.CategoryID = p.CategoryID
JOIN OrderDetails od ON p.ProductID = od.ProductID
GROUP BY cat.CategoryName;
GO

/* LEVEL 6: SUBQUERIES AND SET OPERATORS */
-- 81
SELECT * FROM Products WHERE Price > (SELECT AVG(Price) FROM Products);
-- 82
SELECT * FROM Products WHERE Price = (SELECT MAX(Price) FROM Products);
-- 83
SELECT MAX(Price) AS SecondHighestDistinctPrice
FROM Products WHERE Price < (SELECT MAX(Price) FROM Products);
-- 84
SELECT * FROM Customers c
WHERE EXISTS (SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID);
-- 85
SELECT * FROM Customers c
WHERE NOT EXISTS (SELECT 1 FROM Orders o WHERE o.CustomerID = c.CustomerID);
-- 86
SELECT p.* FROM Products p
WHERE p.Price > (SELECT AVG(p2.Price) FROM Products p2 WHERE p2.CategoryID = p.CategoryID);
-- 87
WITH OrderTotals AS (
    SELECT o.OrderID, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS OrderValue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY o.OrderID
)
SELECT * FROM OrderTotals
WHERE OrderValue > (SELECT AVG(OrderValue) FROM OrderTotals);
-- 88
WITH CustomerRevenue AS (
    SELECT c.CustomerID, c.CustomerName,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT * FROM CustomerRevenue
WHERE Revenue > (SELECT AVG(Revenue) FROM CustomerRevenue);
-- 89
SELECT * FROM Products
WHERE Price > (SELECT Price FROM Products WHERE ProductName = 'Mouse');
-- 90
SELECT o1.OrderID, o1.CustomerID, o1.OrderDate
FROM Orders o1
WHERE EXISTS (
    SELECT 1 FROM Orders o2
    WHERE o2.OrderDate = o1.OrderDate AND o2.CustomerID <> o1.CustomerID
);
-- 91
SELECT City AS Item FROM Customers
UNION SELECT CategoryName FROM Categories;
-- 92
SELECT City AS Item FROM Customers
UNION ALL SELECT CategoryName FROM Categories;
-- 93
SELECT City FROM Customers WHERE City LIKE 'B%'
INTERSECT
SELECT City FROM Customers WHERE City LIKE '%e';
-- 94
SELECT City FROM Customers WHERE City LIKE 'B%'
EXCEPT
SELECT City FROM Customers WHERE City LIKE '%e';
-- 95
SELECT DISTINCT c.CustomerID, c.CustomerName
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE p.CategoryID = (SELECT CategoryID FROM Products WHERE ProductName = 'Laptop');
GO

/* LEVEL 7: DML AND TABLE MANAGEMENT */
-- 96: use an unused CustomerID
INSERT INTO Customers (CustomerID, CustomerName, Email, City, JoinDate)
VALUES (8, 'Ravi', 'ravi@example.com', 'Delhi', '2025-08-01');
-- 97: use an unused ProductID and existing CategoryID
INSERT INTO Products (ProductID, ProductName, CategoryID, Price, Stock)
VALUES (111, 'USB Cable', 1, 300, 100);
-- 98
UPDATE Customers SET City = 'Hyderabad' WHERE CustomerID = 8;
-- 99
UPDATE Products SET Price = Price * 1.10
WHERE CategoryID = (SELECT CategoryID FROM Categories WHERE CategoryName = 'Electronics');
-- 100
UPDATE Products SET Stock = 25 WHERE ProductID = 102;
-- 101: only delete a test customer you inserted
DELETE FROM Customers WHERE CustomerID = 8;
-- 102
ALTER TABLE Customers ADD PhoneNumber VARCHAR(20) NULL;
-- 103: example, only if values fit the target type
ALTER TABLE Customers ALTER COLUMN CustomerName VARCHAR(150) NULL;
-- 104
EXEC sp_rename 'Customers.PhoneNumber', 'MobileNumber', 'COLUMN';
-- 105
SELECT ProductID, ProductName, Price INTO ProductBackup FROM Products;
-- 106
CREATE TABLE ExampleOrders (
    ExampleOrderID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- 107
ALTER TABLE Products ADD CONSTRAINT CK_Products_NonNegativePrice CHECK (Price >= 0);
-- 108
ALTER TABLE Products ADD IsActive BIT NOT NULL CONSTRAINT DF_Products_IsActive DEFAULT (1);
-- 109
CREATE TABLE ExampleIdentity (
    ID INT IDENTITY(1,1) PRIMARY KEY,
    Description VARCHAR(100)
);
-- 110
EXEC sp_rename 'ExampleIdentity', 'ExampleIdentityRenamed';
EXEC sp_rename 'ExampleIdentityRenamed', 'ExampleIdentity';
GO

/* LEVEL 8: DATA CLEANING */
-- 111
SELECT * FROM Customers WHERE Email IS NULL;
-- 112
SELECT * FROM Customers WHERE Email IS NULL OR TRIM(Email) = '';
-- 113
SELECT Email, COUNT(*) AS DuplicateCount FROM Customers
WHERE Email IS NOT NULL GROUP BY Email HAVING COUNT(*) > 1;
-- 114
SELECT CustomerName, COUNT(*) AS DuplicateCount FROM Customers
GROUP BY CustomerName HAVING COUNT(*) > 1;
-- 115
SELECT * FROM Products WHERE Price IS NULL;
-- 116
SELECT * FROM Products WHERE Price < 0;
-- 117
SELECT * FROM OrderDetails WHERE Quantity <= 0;
-- 118
SELECT * FROM OrderDetails WHERE Discount < 0 OR Discount > 1 OR Discount IS NULL;
-- 119
SELECT od.* FROM OrderDetails od
LEFT JOIN Orders o ON od.OrderID = o.OrderID WHERE o.OrderID IS NULL;
-- 120
SELECT od.* FROM OrderDetails od
LEFT JOIN Products p ON od.ProductID = p.ProductID WHERE p.ProductID IS NULL;
-- 121
UPDATE Customers
SET CustomerName = UPPER(LEFT(TRIM(CustomerName),1))
                 + LOWER(SUBSTRING(TRIM(CustomerName),2,99))
WHERE CustomerName IS NOT NULL;
-- 122
UPDATE Customers SET Email = 'Not Provided' WHERE Email IS NULL;
-- 123
-- Assumes a staging table StagingProducts with Price stored as text:
SELECT ProductID, ProductName, TRY_CONVERT(DECIMAL(10,2), Price) AS NumericPrice
FROM StagingProducts;
-- 124
-- Assumes a staging table StagingOrders with OrderDate stored as text:
SELECT * FROM StagingOrders
WHERE TRY_CONVERT(DATE, OrderDate) IS NULL AND NULLIF(TRIM(OrderDate), '') IS NOT NULL;
-- 125
-- Assumes a test table DuplicateTest with a stable unique key named ID and duplicate groups by Email.
WITH D AS (
    SELECT ID, ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID) AS rn
    FROM DuplicateTest
)
DELETE FROM D WHERE rn > 1;
GO

/* LEVEL 9: CTES */
-- 126
WITH OrderTotals AS (
    SELECT OrderID, SUM(Quantity * UnitPrice * (1 - Discount)) AS TotalValue
    FROM OrderDetails GROUP BY OrderID
)
SELECT * FROM OrderTotals;
-- 127
WITH ProductRevenue AS (
    SELECT p.ProductID, p.ProductName,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Products p JOIN OrderDetails od ON p.ProductID = od.ProductID
    GROUP BY p.ProductID, p.ProductName
)
SELECT TOP 5 * FROM ProductRevenue ORDER BY Revenue DESC;
-- 128
WITH ProductQuantity AS (
    SELECT ProductID, SUM(Quantity) AS TotalQuantity
    FROM OrderDetails GROUP BY ProductID
), ProductRevenue AS (
    SELECT ProductID, SUM(Quantity * UnitPrice * (1 - Discount)) AS Revenue
    FROM OrderDetails GROUP BY ProductID
)
SELECT p.ProductName, q.TotalQuantity, r.Revenue
FROM Products p LEFT JOIN ProductQuantity q ON p.ProductID = q.ProductID
LEFT JOIN ProductRevenue r ON p.ProductID = r.ProductID;
-- 129
WITH CustomerRevenue AS (
    SELECT o.CustomerID, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered' GROUP BY o.CustomerID
)
SELECT c.CustomerName, cr.Revenue FROM CustomerRevenue cr
JOIN Customers c ON cr.CustomerID = c.CustomerID WHERE cr.Revenue > 10000;
-- 130
WITH AveragePrice AS (SELECT AVG(Price) AS AvgPrice FROM Products)
SELECT p.* FROM Products p CROSS JOIN AveragePrice a WHERE p.Price > a.AvgPrice;
-- 131
WITH MonthlyRevenue AS (
    SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
)
SELECT * FROM MonthlyRevenue ORDER BY MonthStart;
-- 132
WITH CustomerOrders AS (
    SELECT CustomerID, COUNT(*) AS OrderCount FROM Orders GROUP BY CustomerID
)
SELECT c.CustomerName, co.OrderCount FROM CustomerOrders co
JOIN Customers c ON co.CustomerID = c.CustomerID WHERE co.OrderCount > 1;
-- 133
WITH CustomerRevenue AS (
    SELECT c.CustomerID, c.CustomerName,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY c.CustomerID, c.CustomerName
)
SELECT *, DENSE_RANK() OVER (ORDER BY Revenue DESC) AS RevenueRank
FROM CustomerRevenue;
-- 134
WITH Numbers AS (
    SELECT 1 AS n UNION ALL SELECT n + 1 FROM Numbers WHERE n < 20
)
SELECT n FROM Numbers OPTION (MAXRECURSION 20);
-- 135
WITH Months AS (
    SELECT CAST('2025-01-01' AS DATE) AS MonthStart
    UNION ALL
    SELECT DATEADD(MONTH, 1, MonthStart) FROM Months WHERE MonthStart < '2025-12-01'
)
SELECT MonthStart FROM Months OPTION (MAXRECURSION 12);
GO

/* LEVEL 10: WINDOW FUNCTIONS */
-- 136
SELECT ProductName, Price,
       ROW_NUMBER() OVER (ORDER BY Price DESC, ProductID) AS RowNum
FROM Products;
-- 137
SELECT ProductName, Price, RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Products;
-- 138
SELECT ProductName, Price, DENSE_RANK() OVER (ORDER BY Price DESC) AS PriceRank
FROM Products;
-- 139
WITH R AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY CategoryID ORDER BY Price DESC, ProductID) AS rn
    FROM Products
)
SELECT * FROM R WHERE rn <= 2;
-- 140
WITH R AS (
    SELECT *, DENSE_RANK() OVER (PARTITION BY CategoryID ORDER BY Price DESC) AS rnk
    FROM Products
)
SELECT * FROM R WHERE rnk = 3;
-- 141
SELECT CustomerID, OrderID, OrderDate,
       LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS PreviousOrderDate
FROM Orders;
-- 142
SELECT CustomerID, OrderID, OrderDate,
       LEAD(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS NextOrderDate
FROM Orders;
-- 143
SELECT CustomerID, OrderID, OrderDate,
       FIRST_VALUE(OrderDate) OVER (
           PARTITION BY CustomerID ORDER BY OrderDate, OrderID
       ) AS FirstOrderDate
FROM Orders;
-- 144
SELECT CustomerID, OrderID, OrderDate,
       LAST_VALUE(OrderDate) OVER (
           PARTITION BY CustomerID ORDER BY OrderDate, OrderID
           ROWS BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING
       ) AS LatestOrderDate
FROM Orders;
-- 145
SELECT ProductName, Price, NTILE(4) OVER (ORDER BY Price DESC) AS PriceGroup
FROM Products;
-- 146
WITH DailyRevenue AS (
    SELECT o.OrderDate, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered' GROUP BY o.OrderDate
)
SELECT OrderDate, Revenue,
       SUM(Revenue) OVER (ORDER BY OrderDate ROWS UNBOUNDED PRECEDING) AS RunningRevenue
FROM DailyRevenue;
-- 147
WITH CustomerOrderRevenue AS (
    SELECT o.CustomerID, o.OrderDate, o.OrderID,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY o.CustomerID, o.OrderDate, o.OrderID
)
SELECT *, SUM(Revenue) OVER (
    PARTITION BY CustomerID ORDER BY OrderDate, OrderID ROWS UNBOUNDED PRECEDING
) AS RunningCustomerRevenue
FROM CustomerOrderRevenue;
-- 148
WITH OrderRevenue AS (
    SELECT o.OrderID, o.OrderDate,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY o.OrderID, o.OrderDate
)
SELECT *, AVG(Revenue) OVER (
    ORDER BY OrderDate, OrderID ROWS BETWEEN 2 PRECEDING AND CURRENT ROW
) AS MovingAverage3
FROM OrderRevenue;
-- 149
WITH R AS (
    SELECT o.CustomerID, o.OrderID, o.OrderDate,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS OrderValue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    GROUP BY o.CustomerID, o.OrderID, o.OrderDate
)
SELECT *, OrderValue - LAG(OrderValue) OVER (
    PARTITION BY CustomerID ORDER BY OrderDate, OrderID
) AS DifferenceFromPrevious
FROM R;
-- 150
WITH CustomerCityRevenue AS (
    SELECT c.CustomerID, c.CustomerName, c.City,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY c.CustomerID, c.CustomerName, c.City
)
SELECT *, DENSE_RANK() OVER (PARTITION BY City ORDER BY Revenue DESC) AS CityRank
FROM CustomerCityRevenue;
GO

/* LEVEL 11: BUSINESS ANALYSIS */
-- 151
SELECT SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS TotalDeliveredRevenue
FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Delivered';
-- 152
SELECT YEAR(o.OrderDate) AS SalesYear, MONTH(o.OrderDate) AS SalesMonth,
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Delivered' AND o.OrderDate >= '20250101' AND o.OrderDate < '20260101'
GROUP BY YEAR(o.OrderDate), MONTH(o.OrderDate)
ORDER BY SalesYear, SalesMonth;
-- 153
WITH M AS (
    SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
)
SELECT TOP 1 * FROM M ORDER BY Revenue DESC;
-- 154
WITH M AS (
    SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
), P AS (
    SELECT *, LAG(Revenue) OVER (ORDER BY MonthStart) AS PreviousRevenue FROM M
)
SELECT *, 100.0 * (Revenue - PreviousRevenue) / NULLIF(PreviousRevenue, 0) AS MoMPercent
FROM P ORDER BY MonthStart;
-- 155
WITH C AS (
    SELECT cat.CategoryName,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Categories cat JOIN Products p ON cat.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY cat.CategoryName
)
SELECT *, 100.0 * Revenue / NULLIF(SUM(Revenue) OVER (), 0) AS RevenuePercent
FROM C ORDER BY Revenue DESC;
-- 156
SELECT TOP 5 c.CustomerID, c.CustomerName,
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Delivered'
GROUP BY c.CustomerID, c.CustomerName ORDER BY Revenue DESC;
-- 157
SELECT TOP 5 p.ProductID, p.ProductName,
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
FROM Products p JOIN OrderDetails od ON p.ProductID = od.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
WHERE o.OrderStatus = 'Delivered'
GROUP BY p.ProductID, p.ProductName ORDER BY Revenue DESC;
-- 158
WITH S AS (
    SELECT cat.CategoryName, p.ProductID, p.ProductName, SUM(od.Quantity) AS UnitsSold,
           DENSE_RANK() OVER (PARTITION BY cat.CategoryID ORDER BY SUM(od.Quantity) DESC) AS rnk
    FROM Categories cat JOIN Products p ON cat.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY cat.CategoryID, cat.CategoryName, p.ProductID, p.ProductName
)
SELECT * FROM S WHERE rnk = 1;
-- 159
WITH O AS (
    SELECT o.OrderID, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS OrderValue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered' GROUP BY o.OrderID
)
SELECT AVG(OrderValue) AS AverageDeliveredOrderValue FROM O;
-- 160
WITH F AS (
    SELECT CustomerID, MIN(OrderDate) AS FirstDeliveredOrder
    FROM Orders WHERE OrderStatus = 'Delivered' GROUP BY CustomerID
)
SELECT c.CustomerID, c.CustomerName, f.FirstDeliveredOrder
FROM F f JOIN Customers c ON f.CustomerID = c.CustomerID
WHERE f.FirstDeliveredOrder >= '20250101' AND f.FirstDeliveredOrder < '20260101';
-- 161
SELECT c.CustomerID, c.CustomerName
FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
WHERE o.OrderStatus = 'Delivered'
GROUP BY c.CustomerID, c.CustomerName
HAVING COUNT(DISTINCT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)) >= 2;
-- 162
SELECT c.CustomerID, c.CustomerName, MAX(o.OrderDate) AS LastOrderDate
FROM Customers c LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName
HAVING MAX(o.OrderDate) IS NULL OR MAX(o.OrderDate) < '20250601';
-- 163
SELECT OrderStatus, COUNT(*) AS OrderCount,
       100.0 * COUNT(*) / SUM(COUNT(*)) OVER () AS StatusPercent
FROM Orders GROUP BY OrderStatus;
-- 164
SELECT p.ProductID, p.ProductName
FROM Products p
WHERE NOT EXISTS (
    SELECT 1 FROM OrderDetails od JOIN Orders o ON o.OrderID = od.OrderID
    WHERE od.ProductID = p.ProductID AND o.OrderStatus = 'Delivered'
);
-- 165
WITH CityRevenue AS (
    SELECT c.City, SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
    JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY c.City
)
SELECT *, DENSE_RANK() OVER (ORDER BY Revenue DESC) AS CityRank
FROM CityRevenue;
GO

/* LEVEL 12: TRANSACTIONS, VIEWS, PROCEDURES, FUNCTIONS */
-- 166: stock reduction transaction
BEGIN TRY
    BEGIN TRANSACTION;
    UPDATE Products SET Stock = Stock - 1 WHERE ProductID = 102 AND Stock >= 1;
    IF @@ROWCOUNT <> 1 THROW 50001, 'Product missing or insufficient stock.', 1;
    COMMIT;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0 ROLLBACK;
    THROW;
END CATCH;
GO
-- 167: example atomic insert; assumes OrderID 1013 and existing CustomerID 1/ProductID 102
BEGIN TRY
    BEGIN TRANSACTION;
    INSERT INTO Orders (OrderID, CustomerID, OrderDate, OrderStatus)
    VALUES (1013, 1, CAST(GETDATE() AS DATE), 'Pending');
    INSERT INTO OrderDetails (OrderDetailID, OrderID, ProductID, Quantity, UnitPrice, Discount)
    VALUES (21, 1013, 102, 1, 800, 0);
    COMMIT;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0 ROLLBACK;
    THROW;
END CATCH;
GO
-- 168: generic TRY/CATCH transaction
BEGIN TRY
    BEGIN TRANSACTION;
    UPDATE Products SET Stock = Stock - 1 WHERE ProductID = 102 AND Stock > 0;
    IF @@ROWCOUNT <> 1 THROW 50002, 'Stock update failed.', 1;
    COMMIT;
END TRY
BEGIN CATCH
    IF XACT_STATE() <> 0 ROLLBACK;
    SELECT ERROR_NUMBER() AS ErrorNumber, ERROR_MESSAGE() AS ErrorMessage;
END CATCH;
GO
-- 169
CREATE OR ALTER VIEW dbo.vw_DeliveredOrderDetails AS
SELECT o.OrderID, o.OrderDate, c.CustomerName, p.ProductName, od.Quantity,
       od.UnitPrice, od.Discount,
       od.Quantity * od.UnitPrice * (1 - od.Discount) AS Revenue
FROM Orders o JOIN Customers c ON o.CustomerID = c.CustomerID
JOIN OrderDetails od ON o.OrderID = od.OrderID
JOIN Products p ON od.ProductID = p.ProductID
WHERE o.OrderStatus = 'Delivered';
GO
-- 170
CREATE OR ALTER VIEW dbo.vw_MonthlyRevenue AS
SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Delivered'
GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1);
GO
-- 171
CREATE OR ALTER PROCEDURE dbo.GetCustomerOrders @CustomerID INT
AS
BEGIN
    SET NOCOUNT ON;
    SELECT c.CustomerName, o.OrderID, o.OrderDate, o.OrderStatus
    FROM Customers c JOIN Orders o ON c.CustomerID = o.CustomerID
    WHERE c.CustomerID = @CustomerID ORDER BY o.OrderDate DESC;
END;
GO
-- 172
CREATE OR ALTER PROCEDURE dbo.GetProductsByPrice
    @MinPrice DECIMAL(10,2), @MaxPrice DECIMAL(10,2)
AS
BEGIN
    SET NOCOUNT ON;
    SELECT * FROM Products WHERE Price BETWEEN @MinPrice AND @MaxPrice ORDER BY Price;
END;
GO
-- 173
CREATE OR ALTER PROCEDURE dbo.GetRevenueByDateRange
    @StartDate DATE, @EndDate DATE
AS
BEGIN
    SET NOCOUNT ON;
    SELECT SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
      AND o.OrderDate >= @StartDate AND o.OrderDate < DATEADD(DAY, 1, @EndDate);
END;
GO
-- 174
CREATE OR ALTER FUNCTION dbo.CalculateRevenue
(@Quantity INT, @UnitPrice DECIMAL(10,2), @Discount DECIMAL(5,2))
RETURNS DECIMAL(18,2)
AS
BEGIN
    RETURN CAST(@Quantity * @UnitPrice * (1 - @Discount) AS DECIMAL(18,2));
END;
GO
-- 175
CREATE OR ALTER FUNCTION dbo.GetOrdersForCustomer(@CustomerID INT)
RETURNS TABLE
AS
RETURN (
    SELECT OrderID, CustomerID, OrderDate, OrderStatus
    FROM Orders WHERE CustomerID = @CustomerID
);
GO

/* LEVEL 13: PERFORMANCE AND EXTRA TOPICS */
-- 176
CREATE NONCLUSTERED INDEX IX_Orders_OrderDate ON Orders(OrderDate);
-- 177
CREATE NONCLUSTERED INDEX IX_Orders_CustomerID ON Orders(CustomerID);
-- 178
CREATE NONCLUSTERED INDEX IX_OrderDetails_OrderID_ProductID
ON OrderDetails(OrderID, ProductID);
-- 179: compare actual execution plans in SSMS before and after creating a useful index
SET STATISTICS IO ON;
SET STATISTICS TIME ON;
SELECT * FROM Orders WHERE OrderDate >= '20250101' AND OrderDate < '20250401';
SET STATISTICS IO OFF;
SET STATISTICS TIME OFF;
-- 180: review execution plans and IO for queries; example query to inspect
SELECT o.OrderID, c.CustomerName
FROM Orders o JOIN Customers c ON c.CustomerID = o.CustomerID
WHERE o.OrderDate >= '20250101';
-- 181
CREATE TABLE #MonthlyRevenue (MonthStart DATE, Revenue DECIMAL(18,2));
INSERT INTO #MonthlyRevenue (MonthStart, Revenue)
SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1),
       SUM(od.Quantity * od.UnitPrice * (1 - od.Discount))
FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
WHERE o.OrderStatus = 'Delivered'
GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1);
SELECT * FROM #MonthlyRevenue;
DROP TABLE #MonthlyRevenue;
-- 182
DECLARE @ProductList TABLE (ProductID INT PRIMARY KEY);
INSERT INTO @ProductList VALUES (101), (102), (103);
SELECT p.* FROM Products p JOIN @ProductList x ON p.ProductID = x.ProductID;
-- 183
SELECT
    SUM(CASE WHEN OrderStatus = 'Delivered' THEN 1 ELSE 0 END) AS DeliveredCount,
    SUM(CASE WHEN OrderStatus = 'Pending' THEN 1 ELSE 0 END) AS PendingCount,
    SUM(CASE WHEN OrderStatus = 'Cancelled' THEN 1 ELSE 0 END) AS CancelledCount
FROM Orders;
-- 184
WITH S AS (
    SELECT cat.CategoryName,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Categories cat JOIN Products p ON cat.CategoryID = p.CategoryID
    JOIN OrderDetails od ON p.ProductID = od.ProductID
    JOIN Orders o ON od.OrderID = o.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY cat.CategoryName
)
SELECT [Electronics], [Clothing], [Home], [Books]
FROM S PIVOT (SUM(Revenue) FOR CategoryName IN ([Electronics],[Clothing],[Home],[Books])) AS P;
-- 185
DECLARE @sql NVARCHAR(MAX) = N'SELECT ProductID, ProductName, Price FROM dbo.Products WHERE Price >= @MinPrice AND Price <= @MaxPrice;';
EXEC sys.sp_executesql @sql,
    N'@MinPrice DECIMAL(10,2), @MaxPrice DECIMAL(10,2)',
    @MinPrice = 1000, @MaxPrice = 5000;
GO

/* LEVEL 14: ADVANCED INTERVIEW CHALLENGES */
/* Questions 186-189 require an Employees table:
   Employees(EmployeeID INT, EmployeeName VARCHAR(100), DepartmentID INT, Salary DECIMAL(10,2)).
*/
-- 186
-- SELECT MAX(Salary) AS SecondHighestSalary
-- FROM Employees WHERE Salary < (SELECT MAX(Salary) FROM Employees);
-- 187
-- SELECT MAX(Salary) AS ThirdHighestSalary
-- FROM Employees
-- WHERE Salary < (SELECT MAX(Salary) FROM Employees WHERE Salary <
--               (SELECT MAX(Salary) FROM Employees));
-- 188
-- WITH E AS (
--   SELECT *, DENSE_RANK() OVER (PARTITION BY DepartmentID ORDER BY Salary DESC) AS rnk
--   FROM Employees
-- )
-- SELECT * FROM E WHERE rnk = 1;
-- 189
-- SELECT e.* FROM Employees e
-- WHERE e.Salary > (SELECT AVG(e2.Salary) FROM Employees e2
--                   WHERE e2.DepartmentID = e.DepartmentID);
-- 190: example assumes a test table DuplicateTest with ID and Email
WITH D AS (
    SELECT ID, Email, ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID) AS rn
    FROM DuplicateTest
)
SELECT * FROM D WHERE rn > 1;
-- 191: delete duplicates from a test table only
WITH D AS (
    SELECT ID, ROW_NUMBER() OVER (PARTITION BY Email ORDER BY ID) AS rn
    FROM DuplicateTest
)
DELETE FROM D WHERE rn > 1;
-- 192: find same-customer consecutive order dates (ordered events)
WITH O AS (
    SELECT CustomerID, OrderID, OrderDate,
           LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate, OrderID) AS PreviousDate
    FROM Orders
)
SELECT * FROM O WHERE DATEDIFF(DAY, PreviousDate, OrderDate) = 1;
-- 193: customers with orders in three consecutive calendar months
WITH CustomerMonths AS (
    SELECT DISTINCT CustomerID, DATEFROMPARTS(YEAR(OrderDate), MONTH(OrderDate), 1) AS MonthStart
    FROM Orders
), M AS (
    SELECT CustomerID, MonthStart,
           LAG(MonthStart, 1) OVER (PARTITION BY CustomerID ORDER BY MonthStart) AS PrevMonth,
           LAG(MonthStart, 2) OVER (PARTITION BY CustomerID ORDER BY MonthStart) AS Prev2Month
    FROM CustomerMonths
)
SELECT DISTINCT CustomerID FROM M
WHERE PrevMonth = DATEADD(MONTH, -1, MonthStart)
  AND Prev2Month = DATEADD(MONTH, -2, MonthStart);
-- 194: longest gap between orders for each customer
WITH O AS (
    SELECT CustomerID, OrderDate,
           LAG(OrderDate) OVER (PARTITION BY CustomerID ORDER BY OrderDate) AS PreviousDate
    FROM Orders
), G AS (
    SELECT CustomerID, PreviousDate, OrderDate,
           DATEDIFF(DAY, PreviousDate, OrderDate) AS GapDays
    FROM O WHERE PreviousDate IS NOT NULL
), R AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY CustomerID ORDER BY GapDays DESC) AS rn
    FROM G
)
SELECT CustomerID, PreviousDate, OrderDate, GapDays FROM R WHERE rn = 1;
-- 195: product monthly revenue higher than previous month
WITH M AS (
    SELECT od.ProductID, DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY od.ProductID, DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
), P AS (
    SELECT *, LAG(Revenue) OVER (PARTITION BY ProductID ORDER BY MonthStart) AS PreviousRevenue
    FROM M
)
SELECT p.ProductName, P.MonthStart, P.Revenue, P.PreviousRevenue
FROM P JOIN Products p ON p.ProductID = P.ProductID
WHERE P.Revenue > P.PreviousRevenue;
-- 196: cumulative revenue and percentage of monthly total revenue
WITH M AS (
    SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
)
SELECT *, SUM(Revenue) OVER (ORDER BY MonthStart ROWS UNBOUNDED PRECEDING) AS CumulativeRevenue,
       100.0 * Revenue / NULLIF(SUM(Revenue) OVER (), 0) AS PercentOfTotal
FROM M ORDER BY MonthStart;
-- 197: customers who purchased every product in a specified category (CategoryID = 1)
SELECT c.CustomerID, c.CustomerName
FROM Customers c
WHERE NOT EXISTS (
    SELECT 1 FROM Products p WHERE p.CategoryID = 1
    AND NOT EXISTS (
        SELECT 1 FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
        WHERE o.CustomerID = c.CustomerID AND od.ProductID = p.ProductID
    )
);
-- 198: pairs of customers who purchased the same product
WITH CustomerProducts AS (
    SELECT DISTINCT o.CustomerID, od.ProductID
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
)
SELECT cp1.CustomerID AS Customer1, cp2.CustomerID AS Customer2, p.ProductName
FROM CustomerProducts cp1
JOIN CustomerProducts cp2 ON cp1.ProductID = cp2.ProductID AND cp1.CustomerID < cp2.CustomerID
JOIN Products p ON p.ProductID = cp1.ProductID
ORDER BY p.ProductName, Customer1, Customer2;
-- 199: median product price
SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Price) OVER () AS MedianPrice
FROM Products;
-- 200: monthly revenue, order count, running total, MoM growth, and category contribution
WITH Monthly AS (
    SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           COUNT(DISTINCT o.OrderID) AS OrderCount,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS Revenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1)
), MonthlyCalc AS (
    SELECT *, SUM(Revenue) OVER (ORDER BY MonthStart ROWS UNBOUNDED PRECEDING) AS RunningRevenue,
           LAG(Revenue) OVER (ORDER BY MonthStart) AS PreviousRevenue
    FROM Monthly
), CategoryMonthly AS (
    SELECT DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1) AS MonthStart,
           cat.CategoryName,
           SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)) AS CategoryRevenue
    FROM Orders o JOIN OrderDetails od ON o.OrderID = od.OrderID
    JOIN Products p ON od.ProductID = p.ProductID
    JOIN Categories cat ON p.CategoryID = cat.CategoryID
    WHERE o.OrderStatus = 'Delivered'
    GROUP BY DATEFROMPARTS(YEAR(o.OrderDate), MONTH(o.OrderDate), 1), cat.CategoryName
)
SELECT mc.MonthStart, mc.Revenue, mc.OrderCount, mc.RunningRevenue,
       100.0 * (mc.Revenue - mc.PreviousRevenue) / NULLIF(mc.PreviousRevenue, 0) AS MoMPercent,
       cm.CategoryName, cm.CategoryRevenue,
       100.0 * cm.CategoryRevenue / NULLIF(mc.Revenue, 0) AS CategoryContributionPercent
FROM MonthlyCalc mc
LEFT JOIN CategoryMonthly cm ON mc.MonthStart = cm.MonthStart
ORDER BY mc.MonthStart, cm.CategoryName;
GO
