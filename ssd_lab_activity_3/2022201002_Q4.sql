use COMPANY;

select d.dnumber AS "Dept. Id", d.dname AS "Dept. Name", count(*) AS "Number of Locations" from department AS d,(select essn, count(*) from dependent where sex="F" GROUP BY essn having count(*)>=2) AS t, dept_locations AS dl where d.mgr_ssn=t.essn AND d.dnumber=dl.dnumber GROUP BY d.mgr_ssn, d.dnumber, d.dname