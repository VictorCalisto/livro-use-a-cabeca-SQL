SELECT pessoas.nome_completo , telefones.numero
FROM pessoas
RIGHT OUTER JOIN telefones ON pessoas.id = telefones.pessoa_id and telefones.tipo = 'Comercial'
-- tras todos os telefones
-- os que nao forem comercial ele traz como nulo
SELECT pessoas.nome_completo , telefones.numero
FROM pessoas
LEFT OUTER JOIN telefones ON pessoas.id = telefones.pessoa_id and telefones.tipo = 'Comercial'
-- tras todas as pessoas
-- que nao tiverem telefone comercial ela traz como nulo
SELECT pessoas.nome_completo , telefones.numero
FROM pessoas
INNER JOIN telefones ON pessoas.id = telefones.pessoa_id and telefones.tipo = 'Comercial'
-- so tras as pessoas que tem tefones comerciais
-- so tras os telefones que sao comercias
SELECT pessoas.nome_completo , telefones.numero
FROM pessoas
FULL OUTER JOIN telefones ON pessoas.id = telefones.pessoa_id AND telefones.tipo = 'Comercial' ;
-- o full join tras os dados null dos dois lados da tabela
-- por isso ele nao e muito util
-- lembra muito o cross join
-- ##### ATENCAO ##### --
/*
 * A RESTRICAO 'telefones.tipo = 'Comercial'' DEVE SER UM AND SEGUIDA AO ON DO LEFT/RIGHT JOIN
 * SE ELA FOR UM WHERE ELA TEM PRECEDENCIA E E EXECUTADA PRIMEIRO.
 * DE MODO QUE ISSO FILTRA A CONSULTA E MATA A IDEA DE TRAZER DADOS NULOS
 * OU SEJA ISSO MATA O LEFT/RIGHT JOIN 
 * TRANSFORMANDO ELES EM INNER JOIN SEMPRE
 * 
*/

-- EXEMPLO DE O QUE NAO FAZER --- 
SELECT pessoas.nome_completo , telefones.numero
FROM pessoas
LEFT OUTER JOIN telefones ON pessoas.id = telefones.pessoa_id
WHERE telefones.tipo = 'Comercial'
-- EXEMPLO DE O QUE NAO FAZER ---

-- a vantagem de left/right join e trazer celulas com null

-- UNION (TRAS TODOS OS VALORES E REMOVE OS DUPLICADOS)
SELECT pessoa_id FROM telefones t 
UNION
SELECT pessoa_id FROM enderecos e 
UNION
SELECT pessoa_id FROM pessoas_hobbies ph;
-- UNION ALL ( TRAS VALORES DUPLICADOS NAS TABELAS)
SELECT pessoa_id FROM telefones t 
UNION ALL
SELECT pessoa_id FROM enderecos e 
UNION ALL
SELECT pessoa_id FROM pessoas_hobbies ph;
-- INTERSECT ( TRAS VALORES COMUM A TODAS AS TABELAS)
SELECT pessoa_id FROM telefones t 
INTERSECT
SELECT pessoa_id FROM enderecos e 
INTERSECT
SELECT pessoa_id FROM pessoas_hobbies ph;
-- EXCETP ( TRAZ OS VALORES DA TABELA DE CIMA E REMOVE OS VALORES DA TABELA DE BAIXO.)
SELECT pessoa_id FROM telefones t 
EXCEPT
SELECT pessoa_id FROM pessoas_hobbies ph;
-- NAO PODE RETIRAR O CONJUNTO MAIOR DO MENOR
-- SEGUE EXEMPLO DE O QUE NAO DEVE SER FEITO
SELECT pessoa_id FROM pessoas_hobbies ph -- TEM 1,2,3
EXCEPT -- RETIRA
SELECT pessoa_id FROM telefones t -- 1,2,3,4,5,6,7,8,9,10 FICA SEM NADA