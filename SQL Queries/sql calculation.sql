select * from Sales_Cleaned
select * from products_Cleaned
select * from categories_Cleaned
select * from customers_Cleaned

--update s 
--set Total_price = (s.Quantity * p.Price * (1 - s.Discount)) 
--from Sales_Cleaned as s
--join products_Cleaned as p
--on s.Product_id = p.ProductID

SELECT 
    s.Sales_id,
    s.Quantity,
    s.Sales_date,
    s.Discount,
    p.Price,
    p.ProductName,
    c.CategoryName,
    CONCAT(cu.FirstName,' ',cu.LastName) AS Full_Name,
    (s.Quantity * p.Price * (1 - s.Discount)) AS Revenue_Calculated
FROM Sales_Cleaned AS s
JOIN Products_Cleaned AS p
    ON s.Product_id = p.ProductID
JOIN Categories_Cleaned AS c
    ON p.CategoryID = c.CategoryID
JOIN Customers_Cleaned AS cu
    ON s.Customer_id = cu.CustomerID
