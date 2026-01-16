select e1.unique_id, e2.name from
Employees e2 left join employeeuni e1
on e2.id = e1.id;
