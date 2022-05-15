CREATE DATABASE management_customer;

USE management_customer;

CREATE TABLE product
(
	p_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
	p_name VARCHAR(50),
	p_price DOUBLE
);
    
CREATE TABLE customer
(
    c_id INT PRIMARY KEY AUTO_INCREMENT,
    c_name VARCHAR(30),
    c_age int
);

CREATE TABLE `order`
(
	o_id INT NOT NULL  PRIMARY KEY AUTO_INCREMENT,
    c_id int ,
    o_date DATETIME,
    o_total_price DOUBLE,
    FOREIGN KEY (c_id) REFERENCES customer(c_id)
); 
    
CREATE TABLE order_detail
(
	o_id INT,
    p_id INT,
    od_qty INT,
    PRIMARY KEY(o_id,p_id),
    FOREIGN KEY(o_id)REFERENCES `order`(o_id),
    FOREIGN KEY(p_id)REFERENCES product(p_id)
);