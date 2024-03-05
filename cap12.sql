-- para my sql
set password for 'root'@'localhost' = password ('12345');
-- para oracle
alter user root identified by new-password;
-- para postgree
ALTER USER root WITH PASSWORD '12345';
-- listar usuarios no postgres
SELECT usename FROM pg_user;
-- criar um novo usuario no my sql
create user fulano indentied by 'senha';
-- criar um novo usuario no postgres
CREATE USER fulano WITH PASSWORD 'senha';
-- verifica todas as permissoes de um usuario no postgres
SELECT grantee, privilege_type, table_name
FROM information_schema.role_table_grants
WHERE grantee = 'fulano';
-- grant - concede permissao de acesso a uma tabela em expecifico ou grupo de tabelas
grant select,update,delete,insert on teste.sch_pessoas.pessoas to fulano;
-- grant - concede acesso a todo um schema
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA apagar2 TO fulano;
-- grant OPTION - concede permissao para dar permissao
-- o usuario so pode dar a permissao que ele proprio tem
grant select on all tables in schema apagar2 to fulano with grant option 
-- REVOKE revoga acesso do grant
-- o grant e TO e o revoke e FROM
revoke delete on teste.sch_pessoas.pessoas from fulano;
-- remova a capacidade de dar permisao sem remover a permissao em si
revoke grant option on delete on teste.apagar2.telefones from fulano;-- no my sql
revoke grant option for delete on teste.apagar2.telefones from fulano;-- no postgres
-- com o comando CASCADE voce remove a permissao recursivamente.
revoke delete on all tables in schema apagar2 from fulano cascade;
-- com o comando  RESTRICT voce remove so a permissao grant option do usuario. sem ser recursivo.
revoke delete on all tables in schema apagar2 from fulano restrict;
-- uma role e um grupo que pode receber varios usuarios todos com as mesmas permissoes
CREATE ROLE grupo1;
-- permissoes que o grupo um vai ter
GRANT SELECT,INSERT ON teste.sch_pessoas.pessoas TO grupo1;
-- adicionando pessoas ao grupo1
GRANT grupo1 TO fulano;
-- apagando o grupo1
-- primeiro regue tudo de grupo1
REVOKE ALL PRIVILEGES ON ALL TABLES IN SCHEMA sch_pessoas FROM grupo1;
-- agora delete o grupo1
DROP ROLE grupo1;
-- revogando acesso de todos do grupo1
REVOKE INSERT ON teste.sch_pessoas.pessoas FROM grupo1;
