use COMPANY;

select d.mgr_ssn as "Manager ssn", count(*) as "Number of Projects" from works_on w INNER JOIN department d INNER JOIN project p ON d.dnumber=p.dnum AND p.Pname="ProductY" AND w.essn=d.mgr_ssn GROUP BY d.mgr_ssn;
