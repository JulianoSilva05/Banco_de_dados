/*
CREATE TABLE tabela(
  coluna tipo AUTO_INCREMENT,
  coluna2 tipo,
  coluna3 tipo,
  coluna4 tipo NOT NULL, 
  FOREIGN KEY (coluna4) REFERENCES tabela_referenciada(coluna_referenciada) 
);
*/
CREATE TABLE enderecos (
  id INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
  rua VARCHAR(100),
  numero VARCHAR(10),
  pessoa_id INT NOT NULL,
  FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);