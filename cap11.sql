CREATE TABLE moedas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    valor INTEGER CHECK (valor IN (1, 5, 10, 25, 50, 100))
);

CREATE TABLE moedas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    valor INTEGER CHECK (valor BETWEEN 1 AND 10)
);
ALTER TABLE pessoas 
ADD CONSTRAINT CHECK pessoas.sexo IN ('M','F');
-- altera o campo pessoas de m e f para somente m e f
-- no me caso nao funciona porque eu coloque ele como boolean


----------
-- estrutura basica de uma view

CREATE VIEW nome_da_view AS
SELECT coluna(s)
FROM tabela
WHERE condição;
-- views sao para consultas frequentes
-- e uma tabela virtual, que so existe quando e consultada
-- porem nao persiste no banco
CREATE VIEW imc AS
SELECT 
    nome_completo,
    peso,
    altura,
    (peso / (altura * altura)) AS imc,
    CASE 
        WHEN (peso / (altura * altura)) < 18.5 THEN 'Abaixo do Peso'
        WHEN (peso / (altura * altura)) >= 18.5 AND (peso / (altura * altura)) < 25 THEN 'Peso Normal'
        WHEN (peso / (altura * altura)) >= 25 AND (peso / (altura * altura)) < 30 THEN 'Sobrepeso'
        WHEN (peso / (altura * altura)) >= 30 AND (peso / (altura * altura)) < 35 THEN 'Obesidade Grau I'
        WHEN (peso / (altura * altura)) >= 35 AND (peso / (altura * altura)) < 40 THEN 'Obesidade Grau II'
        ELSE 'Obesidade Grau III'
    END AS classificacao
FROM pessoas;

--------------

--tramsacao // O SQLITE NAO SUPORTA
-- ACID
-- Inicia a transação
BEGIN TRANSACTION; -- em alguns sgdb e star transiction

-- Declara uma variável para armazenar a altura original
DECLARE @altura_original DECIMAL(5,2);

-- Obtém a altura original da pessoa com ID específico
SELECT @altura_original = altura
FROM pessoas
WHERE id = 1;

-- Atualiza a altura adicionando 0.01
UPDATE pessoas
SET altura = altura + 0.01
WHERE id = 1;

-- Verifica se a altura atual é 0.01 maior que a altura original
IF (SELECT altura FROM pessoas WHERE id = 1) > @altura_original + 0.01
BEGIN
    -- Se sim, realiza o commit da transação
    COMMIT TRANSACTION;
    --PRINT 'Transação concluída com sucesso. Altura atualizada com sucesso.';
END
ELSE
BEGIN
    -- Se não, realiza o rollback da transação
    ROLLBACK TRANSACTION;
    --PRINT 'Erro: A nova altura não é maior que a altura original. Transação cancelada.';
END

	
