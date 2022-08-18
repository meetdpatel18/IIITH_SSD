use company;

select concat(emp1.fname,' ',emp1.lname) as "Full Name", emp1.ssn, emp1.dno, emp2.super_ssn, count(emp2.super_ssn) as noe from employee emp1, employee emp2 where emp1.ssn=emp2.super_ssn group by emp2.super_ssn