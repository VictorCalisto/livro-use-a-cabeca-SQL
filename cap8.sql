SELECT *
FROM pessoas
CROSS JOIN telefones;
/* cros join sao conexoes cartesianas, produtos cartesianos.
 * um conceito teorico importeante mas inutiu na pratica.
 * consomem muito processamento e geram uma tabela sem normalizacao.*/

/*
 * 
INSERT INTO telefones (pessoa_id, tipo, numero) VALUES
(1, 'Residencial', 900000001),
(2, 'Residencial', 900000002),
(3, 'Residencial', 900000003),
(4, 'Residencial', 900000004),
(5, 'Residencial', 900000005),
(6, 'Residencial', 900000006),
(7, 'Residencial', 900000007),
(8, 'Residencial', 900000008),
(9, 'Residencial', 900000009),
(10,'Residencial', 900000010),
(1, 'Comercial'  , 910000001),
(2, 'Comercial'  , 920000001),
(3, 'Comercial'  , 930000001),
(4, 'Comercial'  , 940000001),
(5, 'Comercial'  , 950000001),
(6, 'Comercial'  , 960000001),
(7, 'Comercial'  , 970000001),
(8, 'Comercial'  , 980000001),
(9, 'Comercial'  , 990000001),
(10,'Comercial'  , 901000001),
(1, 'Celular'    , 911000001),
(2, 'Celular'    , 912000001),
(3, 'Celular'    , 913000001),
(4, 'Celular'    , 914000001),
(5, 'Celular'    , 915000001),
(6, 'Celular'    , 916000001),
(7, 'Celular'    , 917000001),
(8, 'Celular'    , 918000001),
(9, 'Celular'    , 919000001),
(10,'Celular'    , 910100001);*/

SELECT nome_completo AS nome, numero AS celular FROM pessoas
INNER JOIN
telefones
ON pessoas.id = telefones.pessoa_id 
WHERE telefones.tipo = 'Celular';
-- onde tem inner join tem o on pra restringir se nao vira o cros join, inutil.
-- o on do inner join pode ser trocada por where sem problemas
SELECT nome_completo, e.* FROM pessoas p
JOIN
enderecos e
WHERE e.pessoa_id = p.id ;
-- join e o mesmo que inner join
SELECT p.nome_completo,h.nome
FROM pessoas p
JOIN pessoas_hobbies ph ON ph.pessoa_id = p.id 
JOIN hobbies h ON ph.hobby_id = h.id;

