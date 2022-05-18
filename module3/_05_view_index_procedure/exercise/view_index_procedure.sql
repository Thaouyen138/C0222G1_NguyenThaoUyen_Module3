CREATE DATABASE demo;
USE demo;

CREATE TABLE products
(
	id INT PRIMARY KEY AUTO_INCREMENT,
	product_code int,
	product_name VARCHAR(50),
	product_price DOUBLE ,
	product_amount INT,
	product_description VARCHAR(100),
	product_status VARCHAR(50)
);

INSERT INTO products(id, product_code,product_name, product_price, product_amount, product_description,product_status)
VALUES
 (1,1,'IPHONE', 30000,1,'NEW', '100%'),
 (2,2,'SAMSUNG', 25000,1,'OLD', '99%'),
 (3,3,'OPPA', 20000,2,'OLD', '94%'),
 (4,4,'NOKIA', 20000,1,'OLD', '94%'),
 (5,1,'IPHONE', 20000,2,'OLD', '94%'),
 (6,5,'VIVO', 10000,1,'OLD', '98%'),
 (7,5,'VIVO', 10000,3,'OLD', '98%');
 
 CREATE INDEX index_product ON products (product_code);
 
 CREATE INDEX index_name_price ON products(product_name,product_price);
 
 EXPLAIN SELECT * FROM products WHERE product_name= "IPHONE";
 
 CREATE VIEW w_product AS 
 SELECT p.product_code ,p.product_name, p.product_price, p.product_status
 FROM products p;
 SELECT * FROM w_product;
 
--  ALTER VIEW w_product
--  AS 
-- 	SELECT  p.product_code ,p.product_name, p.product_price, p.product_status
-- FROM products
-- GO;

UPDATE w_product SET product_name="LG" WHERE product_code=1;

DROP VIEW w_product;

DELIMITER $$ 
CREATE PROCEDURE sp_product()
BEGIN 
SELECT * FROM products;
END $$
DELIMITER ;
CALL sp_product();

DELIMITER $$ 
CREATE PROCEDURE sp_new_product(in product_code INT,product_name VARCHAR(50), product_price DOUBLE, product_amount INT, product_description VARCHAR(50),product_status VARCHAR(50))
BEGIN 
INSERT INTO products()
VALUES ( product_code ,product_name,product_price,product_amount, product_description,product_status);
END $$
DELIMITER ;
CALL sp_new_product(5,'VIVO', 10000,3,'OLD', '98%');
