CREATE TABLE providers(
    id NUMERIC PRIMARY KEY,
    name VARCHAR(255),
    street VARCHAR(255),
    city VARCHAR(255),
    state CHAR(2)
);

INSERT INTO providers(id,name,street,city,state)
VALUES
(1,'Henrique','Av Brasil','Rio de Janeiro','RJ'),
(2,'Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG'),
(3,'Caroline Silva','Av São Paulo','Salvador','BA'),
(4,'Guilerme Staff','Rua Central','Porto Alegre','RS'),
(5,'Isabela Moraes','Av Juiz Grande','Curitiba','PR'),
(6,'Francisco Accerr','Av Paulista','São Paulo','SP');