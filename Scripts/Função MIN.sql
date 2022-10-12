/*Para localizar o menor salario*/
/*Sem função*/
SELECT salary FROM salaries ORDER BY salary ASC LIMIT 1;

/*Com funsão*/
SELECT MIN(salary) FROM salaries;