/*
● Na tabela de salário faça um SELECT;
● Selecione os salários em uma faixa de 125000 a 175000;
● Utilize o BETWEEN;
*/
SELECT * FROM salaries ORDER BY salary DESC;
SELECT * FROM salaries WHERE salary BETWEEN 125000 AND 175000;