/* Exercício 14
Selecione na tabela titles todos as colunas, porém apenas as que emp_no for maior ou igual a 11500;
*/
USE employees;
DESC titles;
SELECT * FROM titles WHERE emp_no >= 11500;