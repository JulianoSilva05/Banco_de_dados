/*
CREATE TABLE tabela(
  coluna tipo AUTO_INCREMENT,
  coluna2 tipo,
  coluna3 tipo,
  coluna4 tipo NOT NULL UNIQUE
);
*/
CREATE TABLE pessoas(
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  nome VARCHAR(100) NOT NULL,
  idade INT,
  email VARCHAR(200) NOT NULL UNIQUE
);