-- With LEFT EXCLUSIVE JOIN
SELECT name as Customers 
FROM Customers as a 
LEFT JOIN Orders as b 
ON a.id = b.customerId 
WHERE b.id IS NULL;

-- Without JOIN
SELECT name as Customers
FROM customers
WHERE ID NOT IN (SELECT CUSTOMERID FROM ORDERS);
