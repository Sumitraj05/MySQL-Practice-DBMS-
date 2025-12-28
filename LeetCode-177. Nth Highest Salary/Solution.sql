-- Method 1 - Using LIMIT and Offset
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    SET N = N - 1;
    RETURN (
        SELECT DISTINCT salary
        FROM Employee
        ORDER BY salary DESC
        LIMIT 1 OFFSET N
    );
END

-- Method 2 - Using DENSE_RANk function
CREATE FUNCTION getNthHighestSalary(N INT) RETURNS INT
BEGIN
    
  RETURN (
      # Write your MySQL query statement below.
      SELECT DISTINCT salary 
      FROM(
        SELECT salary,
        DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
        FROM Employee
      ) AS rankedsalaries
      WHERE rnk = N
  );
END
