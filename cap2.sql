-- Insere um dado ficticio.
INSERT INTO teste_pessoas (nome_completo, altura, peso, idade, sexo, data_nascimento, telefone, email)
VALUES ('Ana Maria Braga', 1.65, 50.0, 25, 0, '1999-01-01', '62998765432', 'ana.maria@email.com');
-- consulta generica
SELECT * FROM teste_pessoas;
-- consulta com filtro. Restrição: Horizontal. Reduz linhas para a tabela final.
SELECT * FROM teste_pessoas WHERE email = 'ana.maria@email.com';
-- consulta com seletor.Projeção: Vertical. Reduz Colunas para a tabela final.
SELECT nome_completo,email FROM teste_pessoas;
-- consulta com projecao e restricao
SELECT nome_completo,email FROM teste_pessoas WHERE email = 'ana.maria@email.com';
-- consulta que persiste como uma view (tela de vizualizacao) e pode ser consultada
CREATE VIEW view_imc AS
SELECT
    id,
    nome_completo,
    altura,
    peso,
    (peso / (altura * altura)) AS imc
FROM teste_pessoas;
-- mostrar a view
SELECT * FROM view_imc;
-- consultar uma view
SELECT nome_completo,imc FROM view_imc WHERE imc = 'Ana Maria Braga' ;
-- criar uma view a partir de outra
CREATE VIEW view_classificacao_imc AS
SELECT
    id,
    nome_completo,
    imc,
    CASE
        WHEN imc < 18.5 THEN 'Abaixo do Peso'
        WHEN imc >= 18.5 AND imc <= 24.9 THEN 'Peso Ideal'
        WHEN imc >= 25.0 THEN 'Acima do Peso'
        ELSE 'Não Classificado'
    END AS classificacao
FROM view_imc;
-- mostrar a view criada
SELECT * FROM view_classificacao_imc;
-- COMANDO LIKE
-- Listas da familia cardoso das mais magras as mais gordas.
SELECT id,nome_completo,imc,classificacao FROM view_classificacao_imc WHERE nome_completo LIKE '%cardoso%' ORDER BY imc;
-- COMANDO NOT
-- Listas das pessoas que NAO SAO gordas
SELECT id,nome_completo,imc,classificacao FROM view_classificacao_imc WHERE classificacao IS NOT 'Acima do Peso';
