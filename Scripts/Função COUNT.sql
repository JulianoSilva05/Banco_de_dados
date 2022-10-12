/*Sem ultilizar função*/
SELECT * FROM employees WHERE gender = "M";

/*Utilizando função para contar a quantidade de "M" em gender*/
SELECT COUNT(*) AS NUM_HOMEM FROM employees WHERE gender = "M";
