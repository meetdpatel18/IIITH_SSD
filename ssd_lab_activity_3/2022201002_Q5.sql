use COMPANY;

select d.mgr_ssn AS "Manager Ssn", d.dnumber AS "Dept. Id", count(*) AS "Number of dependents" from department d,(select dl.dnumber from dept_locations as dl GROUP BY dl.dnumber HAVING count(*)>=2) as dloc,dependent AS dep where d.dnumber=dloc.dnumber AND d.mgr_ssn=dep.essn GROUP BY d.dnumber, d.mgr_ssn