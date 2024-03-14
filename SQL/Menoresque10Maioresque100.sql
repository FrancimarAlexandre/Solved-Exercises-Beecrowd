-- tabela do exercício
CREATE TABLE products (
  id int PRIMARY KEY AUTO_INCREMENT,
  name varchar(255),
  amount numeric,
  price numeric
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

  -- Resposta
SELECT id,name FROM products
WHERE price <10 OR price > 100