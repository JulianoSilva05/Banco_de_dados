/* Exercício 14
Selecione na tabela titles todos as colunas, porém apenas as que emp_no for maior ou igual a 11500;
*/
USE employees;
DESC titles;
SELECT * FROM titles WHERE emp_no >= 11500;

/*Exercicio 15
Selecione na tabela titles todas as colunas, porém ordene os títulos por ordem descendente;
*/
DESC titles;
SELECT * FROM titles
ORDER BY title DESC
LIMIT 40;

/* Exercicio 16
● Selecione na tabela titles todas as colunas, porém limite a 5 resultados e ordene de 
forma ascendente;
● A ordem deve ser pela coluna de dept_name;
*/
SELECT * FROM titles ORDER BY title ASC LIMIT 5;

/*Exercicio 17
Faça um SELECT que conte o número de registros na tabela departments;
*/
SELECT * FROM departments;
SELECT COUNT(*) FROM departments;
DESC departments;
INSERT INTO departments(dept_no,dept_name)
VALUES ("d011","Tops");

/*Exercicio 18
Faça um SELECT na tabela titles;
Selecione todos os títulos que tenham Engineer na coluna title;
*/
SELECT * FROM titles WHERE title LIKE "%Engineer%";

/*Exercicio 19
 Na tabela employee faça um SELECT de todos os registros que contenham no sobrenome:
 Facello e Peac;
Utilize o IN;
*/
SELECT * FROM employees;
SELECT * FROM employees WHERE last_name IN ("Facello","Peac");

/*Exercicio 20
● Na tabela de salário faça um SELECT;
● Selecione os salários em uma faixa de 125000 a 175000;
● Utilize o BETWEEN;
*/
SELECT * FROM salaries ORDER BY salary DESC;
-- COM BETWEEN
SELECT * FROM salaries WHERE salary BETWEEN 125000 AND 175000;

-- SEM BETWEEN
SELECT * FROM salaries WHERE salary >=150000 AND salary <=175000;

/*EXERCICIO 21
 Crie um banco de dados banco e uma tabela chamada contas;
● Insira as colunas id, nome, sobrenome, saldo, data_nascimento;
● Encontre os melhores tipos de dados para as mesmas;
● A coluna de id deve ser PRIMARY KEY, AUTO_INCREMENT e NOT NULL;
● Crie um índice em saldo;
● Adicione 3 registros na tabela;
*/
CREATE DATABASE banco;
USE banco;

CREATE TABLE contas (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100),
  sobrenome VARCHAR(100),
  saldo DOUBLE(10,2),
  data_nascimento DATE
);

ALTER TABLE contas ADD COLUMN cpf VARCHAR(11) NOT NULL UNIQUE;
ALTER TABLE contas MODIFY COLUMN cpf VARCHAR(12) NOT NULL UNIQUE;
ALTER TABLE contas DROP COLUMN cpf;
DESC contas;

CREATE INDEX index_nome
ON contas (nome);

INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES 
("Juliano", "Fernando", 10000, "1989-06-05"),
("Bruna", "Sousa", 100000, "19821215");

SELECT * FROM contas;

/*Exercício 22
Utilize o INNER JOIN:
Para selecionar o primeiro nome, genero e cargo;
Tabelas “employees” e “titles”.
*/
SELECT employees.first_name AS Nome, employees.gender AS Genero, titles.title AS Cargo
FROM employees
INNER JOIN titles
ON employees.emp_no = titles.emp_no;