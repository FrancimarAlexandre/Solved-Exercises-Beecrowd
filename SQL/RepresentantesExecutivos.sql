-- tabela do exercício

CREATE TABLE providers(
   id int PRIMARY KEY AUTO_INCREMENT,
   name	varchar(255),
   street varchar(255),
   city	varchar(255),
   state char(2)
  );
 
 CREATE TABLE categories(
	id int PRIMARY KEY AUTO_INCREMENT,
	name	varchar(255)
   );

CREATE TABLE products (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255),
  amount numeric,
  price numeric,
  id_providers int,
  id_categories int,
  
  FOREIGN KEY (id_providers) REFERENCES providers(id),
  FOREIGN KEY (id_categories) REFERENCES categories(id)
  );
  
  
  INSERT INTO products (name,amount,price)
  VALUES ('Two-door wardrobe',100,80);

  INSERT INTO products (name,amount,price)
  VALUES ('Dining table',1000,560);

  INSERT INTO products (name,amount,price)
  VALUES ('Towel holder',10000,5.50);

  INSERT INTO products (name,amount,price)
  VALUES ('Computer desk',350,100);

  INSERT INTO products (name,amount,price)
  VALUES ('Chair',3000,210.64);

  INSERT INTO products (name,amount,price)
  VALUES ('Single bed',750,99);

 -- providers
 
  INSERT INTO providers (name,street,city,state)
  VALUES ('Henrique','Av Brasil','Rio de Janeiro','RJ');
  
  INSERT INTO providers (name,street,city,state)
  VALUES ('Marcelo Augusto','Rua Imigrantes','Belo Horizonte','MG');
  
  INSERT INTO providers (name,street,city,state)
  VALUES ('Caroline Silva','Av São Paulo','Salvador','BA');
  
  INSERT INTO providers (name,street,city,state)
  VALUES ('Guilerme Staff','Rua Central','Porto Alegre','RS');
  
  INSERT INTO providers (name,street,city,state)
  VALUES ('Isabela Moraes','Av Juiz Grande','Curitiba','PR');
  
  INSERT INTO providers (name,street,city,state)
  VALUES ('Francisco Accerr','Av Paulista','São Paulo','SP');
-- categories
	
   INSERT INTO categories (name)
   VALUES ('old stock');
   
      INSERT INTO categories (name)
   VALUES ('new stock');
   
      INSERT INTO categories (name)
   VALUES ('modern');
   
      INSERT INTO categories (name)
   VALUES ('commercial');
   
      INSERT INTO categories (name)
   VALUES ('recyclable');
   
      INSERT INTO categories (name)
   VALUES ('executive');
   
      INSERT INTO categories (name)
   VALUES ('superior');
   
      INSERT INTO categories (name)
   VALUES ('wood');
   
      INSERT INTO categories (name)
   VALUES ('super luxury');
   
      INSERT INTO categories (name)
   VALUES ('vintage');
   