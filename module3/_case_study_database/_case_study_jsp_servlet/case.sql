CREATE DATABASE furama;
USE furama;
CREATE TABLE `role`
( 
role_id INT PRIMARY KEY,
role_name VARCHAR(255)
);

CREATE TABLE `user`
( 
user_name  VARCHAR(255) PRIMARY KEY,
role_name VARCHAR(255)
);

CREATE TABLE user_role
(
role_id INT,
user_name VARCHAR(255),
FOREIGN KEY(role_id) REFERENCES `role`(rode_id),
FOREIGN KEY(user_name) REFERENCES user_role(user_name)
);

CREATE TABLE position
(
position_id INT PRIMARY KEY,
position_name VARCHAR(45)
);

CREATE TABLE education_degree
(
education_degree_id INT PRIMARY KEY,
education_degree_name VARCHAR(45)
);

CREATE TABLE division
(
division_id INT PRIMARY KEY,
division_name VARCHAR(45)
);

CREATE TABLE employee
(
employee_id INT PRIMARY KEY,
employee_name VARCHAR(45) NOT NULL,
employee_birthday DATE NOT NULL,
employee_id_card  DOUBLE NOT NULL,
employee_salary VARCHAR(45) NOT NULL,
employee_phone VARCHAR(45 ) NOT NULL,
employee_email VARCHAR(45),
employee_address VARCHAR(45),
position_id INT,
education_degree_id INT,
division_id INT,
user_name VARCHAR(255),
FOREIGN KEY (position_id) REFERENCES position (position_id),
FOREIGN KEY(education_degree_id) REFERENCES education_degree (education_degree_id),
FOREIGN KEY(division_id) REFERENCES division(division_id),
FOREIGN KEY(user_name) REFERENCES `user`(user_name)
);

CREATE TABLE customer_type
(
customer_type_id INT PRIMARY KEY,
customer_type_name VARCHAR(45)
);
CREATE TABLE customer
(
customer_id INT PRIMARY KEY,
customer_type_id INT,
customer_name VARCHAR(45) NOT NULL,
customer_birthday DATE NOT NULL,
customer_gender BIT(1) NOT NULL,
customer_id_card VARCHAR(45) NOT NULL,
customer_phone VARCHAR(45) NOT NULL,
customer_email VARCHAR(45),
customer_address VARCHAR(45),
FOREIGN KEY (customer_type_id) REFERENCES customer_type(customer_type_id)
);

CREATE TABLE service_type
(
service_type_id INT PRIMARY KEY,
service_type_name VARCHAR(45)
);

CREATE TABLE rent_type
(
rent_type_id INT PRIMARY KEY,
rent_type_name VARCHAR(45),
rent_type_cost DOUBLE
);

CREATE TABLE service
(
service_id INT PRIMARY KEY,
service_name VARCHAR(45)  NOT NULL,
service_area INT,
service_cost DOUBLE  NOT NULL,
service_max_people INT,
rent_type_id INT,
service_type_id INT,
standard_room VARCHAR(45),
description_other_convenience VARCHAR(45),
pool_area DOUBLE,
number_of_floors INT,
FOREIGN KEY (rent_type_id) REFERENCES rent_type(rent_type_id),
FOREIGN KEY (service_type_id) REFERENCES service_type(service_type_id)
);

CREATE TABLE contract
(
contract_id INT PRIMARY KEY,
contract_start_date DATETIME  NOT NULL,
contract_end_date DATETIME  NOT NULL,
contract_deposit DOUBLE  NOT NULL,
contract_total_money DOUBLE  NOT NULL,
employee_id INT,
customer_id INT,
service_id INT,
FOREIGN KEY (employee_id) REFERENCES employee(employee_id),
FOREIGN KEY (customer_id) REFERENCES customer(customer_id),
FOREIGN KEY (service_id) REFERENCES service(service_id)
);

CREATE TABLE attach_service
(
attach_service_id  INT PRIMARY KEY,
attach_service_name VARCHAR(45)  NOT NULL,
attach_service_cost DOUBLE  NOT NULL,
attach_service_unit INT NOT NULL,
attach_service_status VARCHAR(45)
);

CREATE TABLE contract_detail
(contract_detail_id  INT PRIMARY KEY,
contract_id  INT,
attach_service_id INT,
quantity INT NOT NULL,
FOREIGN KEY (contract_id) REFERENCES contract(contract_id),
FOREIGN KEY (attach_service_id) REFERENCES attach_service(attach_service_id)
);