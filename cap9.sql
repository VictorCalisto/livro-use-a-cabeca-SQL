-- extrutura basica de uma sub consulta
-- a expressao OPERADOR poder ser qualquer expressao logica, =, in, exists,<,>...
SELECT coluna(s)
FROM tabela
WHERE coluna OPERADOR (SELECT coluna(s) FROM outra_tabela WHERE condição);
-- exempro de sub consulta
-- na consulta externa pesquisamos pessoas com pelo menos um hobbie
-- na consulta interna pesquisamos entra as pessoas com algum hobbie aquelas que tem exatamente 2 hobbies.
SELECT nome_completo
FROM pessoas
WHERE id IN (
    SELECT pessoa_id
    FROM pessoas_hobbies
    GROUP BY pessoa_id
    HAVING COUNT(hobby_id) = 2
);
-- GROUP BY pessoa_id: Esta é uma cláusula de agrupamento. Ela agrupa os registros da tabela pessoas_hobbies pelo valor da coluna pessoa_id.
-- HAVING COUNT(hobby_id) = 2: Esta é uma cláusula HAVING, que filtra os grupos resultantes da subconsulta. Aqui, estamos filtrando apenas os grupos onde o número de registros (contados usando COUNT(hobby_id)) é igual a 2
/* - TODOS TERAM CELULAR
 * - 1,2,3 TERAM CELULAR, RESIDENCIAL E COMERCIAL
 * - 4,5,6 TERAM CELULAR, RESIDENCIAL APENAS
 * - 7,8,9 TERAM CELULAR, COMERCIAL APENAS
 * - 10, TERA APENAS CELULAR.
 *
 
DELETE
FROM telefones
WHERE pessoa_id BETWEEN 4 AND 6
AND tipo = 'Comercial';
----
DELETE
FROM telefones
WHERE pessoa_id BETWEEN 7 AND 9
AND tipo = 'Residencial';
--
DELETE
FROM telefones
WHERE pessoa_id = 10
AND tipo IN ('Comercial', 'Residencial');
--
*/
-- Agora vamos filtar as pessoas que mais de um telefone.
-- e desse grupo vamos pegar os que tem os que tem algum hobbie
SELECT nome_completo
FROM pessoas p 
WHERE (
	SELECT COUNT(*) 
	FROM telefones t
	WHERE t.pessoa_id = p.id
) >1
AND EXISTS (
	SELECT *
	FROM pessoas_hobbies ph 
	WHERE ph.pessoa_id = p.id 
);
-- das pessoas que tem telefone comercial e mais de um hobbie
SELECT nome_completo
FROM pessoas p 
WHERE EXISTS (
	SELECT *
	FROM telefones t
	WHERE t.pessoa_id = p.id
	AND t.tipo = 'Comercial'
)
AND (
	SELECT COUNT(*) 
	FROM pessoas_hobbies ph 
	WHERE ph.pessoa_id = p.id 
)>1;
-- Repare que quando eu estou usando o COUNT eu deixo o OPERADOR logico no final do parentese em vez de no comeco.
---------
-- uma pessoa que nao tenha telefone residencial, nem comercial, com mais de 150cm e menos de 100kg do sexo feminino sem nenhum hobbie registrado.
SELECT nome_completo 
FROM pessoas
WHERE altura > 1.50 AND peso < 100 AND SEXO = 0
AND id NOT IN (
    SELECT pessoa_id
    FROM telefones
    WHERE tipo IN ('Residencial', 'Comercial')
)
AND id NOT IN (
    SELECT pessoa_id
    FROM pessoas_hobbies
);
-- repare que nos filtramos primeiro na propria tabela pessoas.
-- depois seguimos para as demais sub consultas.
---------
-- das pessoas que tem mais de um telefone e menos de 2 hobbies eu quero aquela que tem a maior altura

SELECT nome_completo, altura
FROM pessoas
WHERE id IN (
    SELECT pessoa_id
    FROM telefones
    GROUP BY pessoa_id
    HAVING COUNT(*) > 1
)
AND (
	-- se hobbies for igual a zero a pessoa nao vai estar na lista e precisa de uma consulta a parte.
    id NOT IN (
        SELECT pessoa_id
        FROM pessoas_hobbies
    )
    -- se hobbies menor que dois e diferente de zero.
    OR id IN (
        SELECT pessoa_id
        FROM pessoas_hobbies
        GROUP BY pessoa_id
        HAVING COUNT(*) < 2
    )
)
ORDER BY altura DESC
LIMIT 1;

/*
O HAVING é uma cláusula SQL que é usada em conjunto com a cláusula GROUP BY 
para filtrar os resultados de uma consulta que contém funções de agregação, 
como COUNT, SUM, AVG, MAX e MIN. 
Ele permite aplicar condições de filtro às linhas agrupadas resultantes de uma consulta GROUP BY.

A sintaxe básica é: HAVING condição.
A condição pode ser qualquer expressão lógica que você deseja aplicar aos grupos resultantes.
O HAVING deve sempre ser usado após a cláusula GROUP BY.
Usos Mais Comuns:

Contagem Condicional: Filtrar grupos com base em uma contagem específica, como no exemplo fornecido.
Filtragem por Soma: Filtrar grupos com base na soma de valores em uma coluna.
Filtragem por Média: Filtrar grupos com base na média de valores em uma coluna.
Filtragem por Valor Máximo ou Mínimo: Filtrar grupos com base no valor máximo ou mínimo em uma coluna.

