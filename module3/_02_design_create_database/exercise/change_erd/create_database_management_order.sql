CREATE DATABASE management_order;

USE management_order;

CREATE TABLE phone_number (
    id_phone VARCHAR(30) NOT NULL PRIMARY KEY,
    phone VARCHAR(13),
    telephone VARCHAR(13)
);

CREATE TABLE product (
    id_product VARCHAR(30) NOT NULL PRIMARY KEY,
    name_product VARCHAR(30) NOT NULL,
    address VARCHAR(50),
    id_phone VARCHAR(30),
    FOREIGN KEY (id_phone) REFERENCES phone_number (id_phone)
);

CREATE TABLE exports (
    number_exports INT PRIMARY KEY,
    date_exports DATE
);

CREATE TABLE imports (
    number_import INT PRIMARY KEY,
    date_import DATE
);

CREATE TABLE orders (
    number_order INT PRIMARY KEY AUTO_INCREMENT,
    date_order DATE,
    id_product VARCHAR(30),
    FOREIGN KEY (id_product) REFERENCES product (id_product)
);

CREATE TABLE facility (
    id_facility INT PRIMARY KEY AUTO_INCREMENT,
    name_facility VARCHAR(30)
);

CREATE TABLE order_facility (
    number_order INT,
    id_facility INT,
    PRIMARY KEY (number_order , id_facility),
    FOREIGN KEY (number_order) REFERENCES orders (number_order),
    FOREIGN KEY (id_facility) REFERENCES facility (id_facility)
);

CREATE TABLE facility_export(
	id_facility INT,
    number_exports INT, 
    price_products DOUBLE,
    amount_exports INT,
    PRIMARY KEY (id_facility,number_exports),
	FOREIGN KEY (id_facility) REFERENCES facility (id_facility),
	FOREIGN KEY (number_exports) REFERENCES exports (number_exports)
    );
    
    
CREATE TABLE facility_import(
	id_facility INT,
    number_imports INT, 
    price_products DOUBLE,
    amount_imports INT,
    PRIMARY KEY (id_facility,number_imports),
	FOREIGN KEY (id_facility) REFERENCES facility (id_facility),
	FOREIGN KEY (number_imports) REFERENCES imports (number_import)
    )
    
    


