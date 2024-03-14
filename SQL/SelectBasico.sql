-- tabela do exercício
CREATE TABLE customers(
	id 	int PRIMARY KEY AUTO_INCREMENT,
    name	varchar(255),
    street	varchar(255),
    city	varchar(255),
    state	char(2),
    credit_limit float
    );
INSERT INTO customers (name,street,city,state,credit_limit)
VALUES ('Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS',700.00);

INSERT INTO customers (name,street,city,state,credit_limit)
VALUES ('Antonio Carlos Mamel',	'Av. Pinheiros',	'Belo Horizonte',	'MG',	3500.50);

INSERT INTO customers (name,street,city,state,credit_limit)
VALUES ('Luiza Augusta Mhor',	'Rua Salto Grande',	'Niteroi',	'RJ',	4000.00);

INSERT INTO customers (name,street,city,state,credit_limit)
VALUES ('Jane Ester',	'Av 7 de setembro',	'Erechim'	,'RS',	800.00);

INSERT INTO customers (name,street,city,state,credit_limit)
VALUES ('Marcos Antônio dos Santos',	'Av Farrapos'	,'Porto Alegre',	'RS',	4250.25);

-- resposta
SELECT name FROM customers
WHERE state = 'RS'