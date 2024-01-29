-- Criação da tabela pessoas
CREATE TABLE pessoas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_completo VARCHAR(500),
    altura DECIMAL(1,2),
    peso DECIMAL(3,2),
    sexo BOOLEAN,
    data_nascimento DATE,
    email VARCHAR(150) UNIQUE
);

-- Criação da tabela telefones
CREATE TABLE telefones (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pessoa_id INTEGER,
    tipo VARCHAR(50),
    numero VARCHAR(20),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

-- Criação da tabela enderecos
CREATE TABLE enderecos (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    pessoa_id INTEGER,
    logradouro VARCHAR(255),
    quadra VARCHAR(10),
    lote VARCHAR(10),
    complemento VARCHAR(255),
    bairro VARCHAR(100),
    cidade VARCHAR(100),
    estado VARCHAR(50),
    cep VARCHAR(10),
    ponto_referencia VARCHAR(255),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id)
);

CREATE TABLE hobbies (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100) UNIQUE
);

-- Criação da tabela pessoas_hobbies para representar o relacionamento N para N
CREATE TABLE pessoas_hobbies (
    pessoa_id INTEGER,
    hobby_id INTEGER,
    PRIMARY KEY (pessoa_id, hobby_id),
    FOREIGN KEY (pessoa_id) REFERENCES pessoas(id),
    FOREIGN KEY (hobby_id) REFERENCES hobbies(id)
);

-- Inserção de dados nas tabelas hobbies e pessoas_hobbies
INSERT INTO hobbies (nome) VALUES
    ('Leitura'),
    ('Esportes'),
    ('Música'),
    ('Viagens');

INSERT INTO pessoas_hobbies (pessoa_id, hobby_id) VALUES
    (1, 1),  -- João gosta de leitura
    (1, 3),  -- João gosta de música
    (2, 2),  -- Maria pratica esportes
    (3, 1),  -- Carlos gosta de leitura
    (3, 4);  -- Carlos gosta de viagens

-- Inserir dados na tabela pessoas
INSERT INTO pessoas (nome_completo, altura, peso, sexo, data_nascimento, email)
VALUES
    ('João Silva', 1.75, 70.5, 1, '1990-05-15', 'joao.silva@email.com'),
    ('Maria Oliveira', 1.65, 55.2, 0, '1985-09-22', 'maria.oliveira@email.com'),
    ('Carlos Pereira', 1.80, 80.0, 1, '1982-03-10', 'carlos.pereira@email.com'),
    ('Ana Souza', 1.60, 50.5, 0, '1995-11-08', 'ana.souza@email.com'),
    ('Roberto Santos', 1.70, 68.3, 1, '1988-07-17', 'roberto.santos@email.com'),
    ('Fernanda Lima', 1.68, 58.9, 0, '1992-02-25', 'fernanda.lima@email.com'),
    ('Lucas Costa', 1.75, 75.1, 1, '1980-12-01', 'lucas.costa@email.com'),
    ('Aline Rocha', 1.62, 53.7, 0, '1993-06-12', 'aline.rocha@email.com'),
    ('Gustavo Oliveira', 1.78, 82.4, 1, '1984-04-05', 'gustavo.oliveira@email.com'),
    ('Isabela Santos', 1.67, 60.0, 0, '1991-09-30', 'isabela.santos@email.com');

-- Inserir dados na tabela telefones
INSERT INTO telefones (pessoa_id, tipo, numero)
VALUES
    (1, 'Residencial', 123456789),
    (2, 'Comercial', 987654321),
    (3, 'Celular', 555112233),
    (4, 'Residencial', 998877665),
    (5, 'Celular', 444433322),
    (6, 'Comercial', 123443211),
    (7, 'Celular', 777788889),
    (8, 'Residencial', 112233445),
    (9, 'Celular', 999000111),
    (10, 'Comercial', 666777888);

-- Inserir dados na tabela enderecos
INSERT INTO enderecos (pessoa_id, logradouro, quadra, lote, complemento, bairro, cidade, estado, cep, ponto_referencia)
VALUES
    (1, 'Rua A', 'Q1', 'L2', 'Apto 101', 'Centro', 'Cidade A', 'Estado X', '12345-678', 'Próximo ao mercado'),
    (2, 'Avenida B', 'Q2', 'L3', 'Casa 2', 'Bairro B', 'Cidade B', 'Estado Y', '98765-432', 'Ao lado da escola'),
    (3, 'Alameda C', 'Q3', 'L4', 'Sala 3', 'Setor C', 'Cidade C', 'Estado Z', '54321-876', 'Perto do parque'),
    (4, 'Rua D', 'Q4', 'L5', 'Apto 202', 'Centro', 'Cidade A', 'Estado X', '23456-789', 'Próximo à farmácia'),
    (5, 'Avenida E', 'Q5', 'L6', 'Casa 4', 'Bairro B', 'Cidade B', 'Estado Y', '87654-321', 'Ao lado do banco'),
    (6, 'Alameda F', 'Q6', 'L7', 'Sala 5', 'Setor C', 'Cidade C', 'Estado Z', '34567-890', 'Perto da academia'),
    (7, 'Rua G', 'Q7', 'L8', 'Apto 303', 'Centro', 'Cidade A', 'Estado X', '45678-901', 'Próximo ao hospital'),
    (8, 'Avenida H', 'Q8', 'L9', 'Casa 6', 'Bairro B', 'Cidade B', 'Estado Y', '78901-234', 'Ao lado da igreja'),
    (9, 'Alameda I', 'Q9', 'L10', 'Sala 7', 'Setor C', 'Cidade C', 'Estado Z', '56789-012', 'Perto da escola'),
    (10, 'Rua J', 'Q10', 'L11', 'Apto 404', 'Centro', 'Cidade A', 'Estado X', '67890-123', 'Próximo à padaria');


/*
Em um relacionamento um pra um a chave estrangeira pode ser coloca de um lado dou de outro. mas nunca dos dois.

em um relacionamento um pra n a chave estangeira vai do lado n. no nosso exemplo telefone e um atributo mutivalorado e recebeu pessoa_id

em um relacionamento npra n e necessario criar uma tabela de relacionametos. no nosso exexmplo a tabela pessoas_hobbies.
*/