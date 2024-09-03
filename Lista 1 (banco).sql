CREATE DATABASE IF NOT EXISTS ecommerce_22C;
use ecommerce_22C;

Exercício 1: 
SELECT 
    Orders.OrderID,
    Orders.OrderDate,
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName,
    Customers.Email
FROM 
    Orders
JOIN 
    Customers ON Orders.CustomerID = Customers.CustomerID;
  
  
Exercício 2:
SELECT 
    Products.ProductName,
    Order_Items.Quantity
FROM 
    Order_Items
JOIN 
    Orders ON Order_Items.OrderID = Orders.OrderID
JOIN 
    Products ON Order_Items.ProductID = Products.ProductID
WHERE 
    Orders.CustomerID = 1;
    
    
Exercício 3:
SELECT 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName,
    SUM(Order_Items.Quantity * Products.Price) AS TotalSpent
FROM 
    Customers
JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
JOIN 
    Order_Items ON Orders.OrderID = Order_Items.OrderID
JOIN 
    Products ON Order_Items.ProductID = Products.ProductID
GROUP BY 
    Customers.CustomerID, FullName;
    
    
Exercício 4:
SELECT 
    CONCAT(Customers.FirstName, ' ', Customers.LastName) AS FullName
FROM 
    Customers
LEFT JOIN 
    Orders ON Customers.CustomerID = Orders.CustomerID
WHERE 
    Orders.OrderID IS NULL;
    
    
Exercício 5:
SELECT 
    Products.ProductName,
    SUM(Order_Items.Quantity) AS TotalQuantitySold
FROM 
    Order_Items
JOIN 
    Products ON Order_Items.ProductID = Products.ProductID
GROUP BY 
    Products.ProductName
ORDER BY 
    TotalQuantitySold DESC;