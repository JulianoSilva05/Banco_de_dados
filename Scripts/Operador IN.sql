SELECT * FROM dept_emp WHERE dept_no IN ("d004", "d005", "d006") ORDER BY dept_no;

/*Contando registros de determinados departamentos*/
SELECT COUNT(*) FROM dept_emp WHERE dept_no IN ("d004", "d005", "d006") ORDER BY dept_no;
