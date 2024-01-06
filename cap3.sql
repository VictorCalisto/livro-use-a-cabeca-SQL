-- inserindo um dado ficticio
INSERT INTO teste_pessoas (nome_completo, altura, peso, idade, sexo, data_nascimento, telefone, email)
VALUES ('Pessoa Fictícia', 1.75, 70.5, 25, 1, '1999-01-01', '123456789', 'pessoa.ficticia@email.com');
-- verificando se ele esta la
SELECT * FROM teste_pessoas WHERE email = 'pessoa.ficticia@email.com';
-- deletando o que foi adicinado errado // tem que ser prepreciso e sempre executar um select antes do delete
DELETE FROM teste_pessoas
WHERE
    nome_completo = 'Pessoa Fictícia' AND
    altura = 1.75 AND
    peso = 70.5 AND
    idade = 25 AND
    sexo = 1 AND
    data_nascimento = '1999-01-01' AND
    telefone = '123456789' AND
    email = 'pessoa.ficticia@email.com';
-- conferindo se foi apagado 
SELECT * FROM teste_pessoas WHERE email = 'pessoa.ficticia@email.com';
-- inserindo um dado parcialmente certo
INSERT INTO teste_pessoas (nome_completo, altura, peso, idade, sexo, data_nascimento, telefone, email)
VALUES ('Maria de Lourdes Nogueira', 1.65, 65, 45, 0, '1977-01-01', '61998765432', 'maria.lourdes@example.com');
-- corrigindo um dado ja inserido.
UPDATE teste_pessoas SET data_nascimento = '1977-01-02' WHERE nome_completo = 'Maria de Lourdes Nogueira' AND email = 'maria.lourdes@example.com';