/*Exercicio 20
● Na tabela de salário faça um SELECT;
● Selecione os salários em uma faixa de 125000 a 175000;
● Utilize o BETWEEN;
*/
SELECT * FROM salaries ORDER BY salary DESC;
/*COM BETWEEN*/
SELECT * FROM salaries WHERE salary BETWEEN 125000 AND 175000;

/*SEM BETWEEN*/
SELECT * FROM salaries WHERE salary >=150000 AND salary <=175000;