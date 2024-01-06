-- CASE
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
-- ORDER BY
-- do mais magro para o mais gordo
SELECT id,nome_completo,imc,classificacao FROM view_classificacao_imc WHERE nome_completo LIKE '%cardoso%' 
ORDER BY imc ASC;
-- do mais gordo para o mais magro
SELECT id,nome_completo,imc,classificacao FROM view_classificacao_imc WHERE nome_completo LIKE '%cardoso%' 
ORDER BY imc DESC;
--------------------
-- FUNCOES
-----------------
--SOMA
--Soma a idade de todos na familia cardoso
SELECT SUM (idade) FROM teste_pessoas
WHERE nome_completo LIKE '%cardoso%';
--MEDIA
--media do sexo masculino e feminino
--AGRUPAR
--media agrupada por sexo
SELECT sexo, AVG(idade) AS media_idade
FROM teste_pessoas GROUP BY sexo;
--MINIMO
--mais jovem membro da familia cardoso
SELECT MIN (idade) FROM teste_pessoas
WHERE nome_completo LIKE '%cardoso%';
--MAXIMO
--mais velho membro da familia cardoso
SELECT MAX (idade) FROM teste_pessoas
WHERE nome_completo LIKE '%cardoso%';
-- DISTINCT
SELECT DISTINCT sexo FROM teste_pessoas;
-- LIMIT
SELECT * FROM teste_pessoas LIMIT 5;
--COUNT
--conta numero de membros da familia cardoso
SELECT COUNT(*) FROM teste_pessoas
WHERE nome_completo LIKE '%Cardoso%'