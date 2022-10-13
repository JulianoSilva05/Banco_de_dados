/*
CREATE INDEX index_nome
ON tabela(coluna);

SHOW INDEX FROM pessoas;

*/
CREATE INDEX index_nome
ON pessoas (nome);

SHOW INDEX FROM pessoas;
