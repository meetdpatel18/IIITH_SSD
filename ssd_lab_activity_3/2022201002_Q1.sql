use COMPANY;

select CONCAT(Fname,' ',Minit,' ',Lname) as "Full Name", ssn, dno as "Dept. Id", Dname as "Dept. Name" from employee e,(select w.essn, sum(w.hours) AS hrs, p.dnum from works_on w, project p where w.pno=p.pnumber GROUP BY w.essn,p.dnum) AS t, department d where t.hrs<40 and e.ssn=t.essn and d.mgr_ssn=e.ssn GROUP by Fname, Minit, Lname, ssn, dno, Dname