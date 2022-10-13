# EXERCICIO 21
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
