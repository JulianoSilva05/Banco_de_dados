/*Buscando o maior salário sem usar função*/
SELECT * FROM salaries ORDER BY salary DESC LIMIT 10;
-- 158220 --

/*Usando função MAX*/
SELECT MAX(salary) AS salary FROM salaries;
-- 158220 --