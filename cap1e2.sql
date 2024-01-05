-- Deleta a tabela 'teste_pessoas' caso ela já exista
DROP TABLE teste_pessoas;
-- Cria a tabela 'teste_pessoas'
CREATE TABLE teste_pessoas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_completo VARCHAR(500),
    altura DECIMAL(1,2),
    peso DECIMAL(3,2),
    idade INTEGER,
    sexo BOOLEAN,
    data_nascimento DATE,
    telefone VARCHAR(150) UNIQUE,
    email VARCHAR(150) UNIQUE
);
-- Adiciona a coluna 'nacionalidade' à tabela 'teste_pessoas'
ALTER TABLE teste_pessoas
ADD COLUMN nacionalidade VARCHAR(150);
-- Remove a coluna 'nacionalidade' da tabela 'teste_pessoas'
ALTER TABLE teste_pessoas
DROP COLUMN nacionalidade;
-- Copia a tabela 'pessoas' para 'teste_pessoas'
INSERT INTO teste_pessoas
SELECT * FROM pessoas;