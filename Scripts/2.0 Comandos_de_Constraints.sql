CREATE DATABASE constraints;
USE constraints;

# 1 - NOT NULL
CREATE TABLE pessoas(
  nome VARCHAR(100) NOT NULL,
  idade INT
);

INSERT INTO pessoas (nome) VALUES ("Matheus");
SELECT * FROM pessoas;
/*Teste em banco do dados - tento inserir um valor 
"NULL" em um atributo que não aceita NULL*/
INSERT INTO pessoas (nome, idade) VALUES (NULL, 30);
INSERT INTO pessoas (nome, idade) VALUES ("João",NULL);
INSERT INTO pessoas (nome) VALUES ("Maria");
INSERT INTO pessoas (idade) VALUES (18);

#2 - UNIQUE
ALTER TABLE pessoas ADD COLUMN email VARCHAR(255) UNIQUE;

INSERT INTO pessoas (nome, idade, email) VALUES ("João", 30, "joao@gmai.com");
INSERT INTO pessoas (nome, idade, email) VALUES ("João Paulo", 25, "joao@gmai.com");
INSERT INTO pessoas (nome, idade, email) VALUES ("João Paulo", 25, "joaop@gmai.com");
# 3 - PRIMARY KEY
CREATE TABLE produtos(
  id INT NOT NULL,
  nome VARCHAR(255),
  sku VARCHAR(10),
  PRIMARY KEY (id)
);
DESC produtos;

INSERT INTO produtos (id, nome, sku) VALUES (1, 'Batedeira', '123asd');
INSERT INTO produtos (id, nome, sku) VALUES (NULL, 'Fogão', '1244');
INSERT INTO produtos (id, nome, sku) VALUES (1, 'TV', '555');

# 4 - AUTO INCREMENT

CREATE TABLE frutas (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(200)
);

DESC frutas;

INSERT INTO frutas (nome) VALUES ("Maçã");
INSERT INTO frutas (nome) VALUES ("Mamão");
INSERT INTO frutas (nome) VALUES ("Morango");
SELECT * FROM frutas;

# 5 - PRIMARY KEY
DROP TABLE pessoas;

CREATE TABLE pessoas(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  idade INT
);

INSERT INTO pessoas(nome,idade) VALUES ("juliano", 33);
ALTER TABLE pessoas ADD COLUMN email VARCHAR(40) NOT NULL UNIQUE;
ALTER TABLE pessoas MODIFY COLUMN email VARCHAR(255) NOT NULL UNIQUE;
DESC pessoas;
SELECT * FROM pessoas;
UPDATE pessoas SET email = "julianoqm@gmail.com"
WHERE id=1;

INSERT INTO pessoas(nome,idade) VALUES ("Juliano", 33,"julianoqm@gmail.com");
/*UPDATE altera o registro, ALTER TABLE altera a tabela*/
UPDATE pessoas SET nome = "Juliano", idade=30, email="julianoqm2@gmail.com"
WHERE id=1;

# 5.1 - FOREIGN KEY
CREATE TABLE enderecos (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  rua VARCHAR(100),
  numero VARCHAR(10),
  pessoa_id INT NOT NULL,
  FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

INSERT INTO enderecos (rua, numero, pessoa_id) VALUES ("Rua teste", "12", 1);
INSERT INTO pessoas (nome, idade) VALUES ("Pedro", 32); 
INSERT INTO enderecos (rua, numero, pessoa_id) VALUES ("Rua teste", "12", 1);
SELECT * FROM enderecos;


DROP TABLE pessoas; 

# 6 - INDEX

CREATE INDEX index_nome
ON pessoas (nome);

SHOW INDEX FROM pessoas;

# 7 - DELETE INDEX

DROP INDEX index_nome ON pessoas;

# EXERCICIO 21
CREATE DATABASE banco;

USE banco;

CREATE TABLE contas (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100),
  sobrenome VARCHAR(100),
  saldo INT,
  data_nascimento DATE
);

CREATE INDEX idx_saldo
ON contas (saldo);

INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES ("Matheus", "Battisti", 10000, "1991-02-05");
INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES ("Aléxia", "Couto", 25000, "1995-08-30");
INSERT INTO contas (nome, sobrenome, saldo, data_nascimento) VALUES ("Bruno", "Ribeiro", 100000, "1982-12-15");