/*
***NAO GARANTEM CONSITENCIA NOS DADOS DA COLUNA***
CHANGE - Muda o nome e os tipos de dados da coluna
MODIFY - Muda os tipos de dados e a posica de uma coluna.
***NAO GARANTEM CONSITENCIA NOS DADOS DA COLUNA***
POR ISSO NAO VAMOS USAR
RENAME - renomeia a tabela
*/
-- Adiciona a coluna 'nacionalidade' à tabela 'teste_pessoas'
ALTER TABLE teste_pessoas
ADD COLUMN nacionalidade VARCHAR(150);
-- Remove a coluna 'nacionalidade' da tabela 'teste_pessoas'
ALTER TABLE teste_pessoas
DROP COLUMN nacionalidade;