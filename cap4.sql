/*
Normalizar é atomizar os dados.

Normalização é o processo de organização de dados em um banco de dados.
Isso inclui a criação de tabelas e o estabelecimento de relações
entre essas tabelas de acordo com as regras projetadas para proteger
os dados e tornar o banco de dados mais flexível,
eliminando a redundância e a dependência inconsistente.

Primeiro formulário normal
- Eliminar grupos repetidos em tabelas individuais.
{mas de um campo de endereco}
- Crie uma tabela separada para cada conjunto de dados relacionados.
{um tabela so com os enderecos}
- Identifique cada conjunto de dados relacionados com uma chave primária.
{uma chave etrangeira ligando os esderecos}

Segundo formulário normal
- Crie tabelas separadas para conjuntos de valores que se aplicam a vários registros.
{o mesmo end se aplica a varios lugares, end do cliente, end de entrega,end de fatura ...}
{entao separa a o end na tabela}
- Relacione essas tabelas com uma chave estrangeira.
{liga por chave estangeira o end a todas as tabelas}

Terceira forma normal
- Elimine campos que não dependem da chave.
{quando a tabela for crecer vai separando as informacoes em novas tabelas}
*/

--PRIMEIRA FORMA
--exemplo errado
CREATE TABLE teste_pessoas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_completo VARCHAR(500),
    altura DECIMAL(1,2),
    peso DECIMAL(3,2),
    idade INTEGER,
    sexo BOOLEAN,
    data_nascimento DATE,
    telefone VARCHAR(150) UNIQUE,
    email VARCHAR(150) UNIQUE,
    endereco_completo VARCHAR(1000) -- Campo multivalorado
);
--corrigido
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

CREATE TABLE endereco (
    pessoa_id INTEGER PRIMARY KEY,
    endereco_completo VARCHAR(1000),
    FOREIGN KEY (pessoa_id) REFERENCES teste_pessoas(id)
);
--SEGUNDA FORMA
-- exemplo errado
CREATE TABLE teste_pessoas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_completo VARCHAR(500),
    altura DECIMAL(1,2),
    peso DECIMAL(3,2),
    idade INTEGER,
    sexo BOOLEAN,
    data_nascimento DATE,
    telefone VARCHAR(150) UNIQUE,
    email VARCHAR(150) UNIQUE,
    cidade VARCHAR(100), -- Dependência parcial de id
    estado VARCHAR(50)
);
--corrigido
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

CREATE TABLE endereco (
    pessoa_id INTEGER PRIMARY KEY,
    cidade VARCHAR(100),
    estado VARCHAR(50),
    FOREIGN KEY (pessoa_id) REFERENCES teste_pessoas(id)
);
-- TERCEIRA FORMA
--exemplo errado
CREATE TABLE teste_pessoas (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nome_completo VARCHAR(500),
    altura DECIMAL(1,2),
    peso DECIMAL(3,2),
    idade INTEGER,
    sexo BOOLEAN,
    data_nascimento DATE,
    telefone VARCHAR(150) UNIQUE,
    email VARCHAR(150) UNIQUE,
    grupo_sanguineo VARCHAR(5) -- Dependência transitiva de id
);
--corrigido
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

CREATE TABLE informacoes_medicas (
    pessoa_id INTEGER PRIMARY KEY,
    grupo_sanguineo VARCHAR(5),
    FOREIGN KEY (pessoa_id) REFERENCES teste_pessoas(id)
);
