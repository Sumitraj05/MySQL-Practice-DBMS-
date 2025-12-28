-- Methon 1 - using Limit and Offset
SELECT (
    SELECT DISTINCT salary
    FROM Employee
    ORDER BY salary DESC
    LIMIT 1 OFFSET 1
) AS SecondHighestSalary;

-- Method 2 - Using Max function and Subquery
SELECT MAX(salary) AS SecondHighestSalary
FROM Employee
WHERE salary < (SELECT MAX(salary) FROM Employee);

-- Method 3 - Using DENSE_RANK function 
SELECT (
    SELECT DISTINCT salary
    FROM (
        SELECT 
            salary,
            DENSE_RANK() OVER (ORDER BY salary DESC) as rnk
        FROM Employee
    ) AS RankedSalaries
    WHERE rnk = 2
) AS SecondHighestSalary;
