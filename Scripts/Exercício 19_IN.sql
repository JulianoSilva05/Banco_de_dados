/*Exercicio 19
 Na tabela employee faça um SELECT de todos os registros que contenham no sobrenome:
 Facello e Peac;
Utilize o IN;
*/
SELECT * FROM employees;
SELECT * FROM employees WHERE last_name IN ("Facello","Peac");