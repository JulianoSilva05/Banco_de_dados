/*
Exercício 22
Utilize o INNER JOIN:
Para selecionar o primeiro nome, genero e cargo;
Tabelas “employees” e “titles”.
*/
SELECT employees.first_name AS Nome, employees.gender AS Genero, titles.title AS Cargo
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no;