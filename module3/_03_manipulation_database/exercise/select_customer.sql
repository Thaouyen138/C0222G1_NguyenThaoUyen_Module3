INSERT INTO customer (c_name, c_age)
VALUE ('Minh Quan', 30),
	  ('Ngoc Oanh', 20),
	  ('Hong Ha', 50);
      
INSERT INTO `order` (c_id, o_date, o_total_price)
VALUE (1, '2006-03-21', NULL),
	  (2, '2006-03-23', NULL),
      (1, '2006-03-16', NULL);
      
INSERT INTO product (p_name, p_price)
VALUE	('May Giat', 3),
		('Tu Lanh', 5),
		('Dieu Hoa', 7),
		('Quat', 1),
		('Bep Dien', 2);
        
INSERT INTO order_detail (o_id, p_id, od_qty)
VALUE	(1, 1, 3),
		(1, 3, 7),
		(1, 4, 2),
		(2, 1, 1),
		(3, 1, 8),
		(2, 5, 4),
		(2, 3, 3);
-- SELECT * FROM `order`;
SELECT  `order`.c_id, customer.c_name, product.p_id, product.p_name  FROM order_detail
JOIN `order` ON order_detail.o_id=`order`.o_id
JOIN product ON product.p_id=order_detail.p_id
JOIN customer ON `order`.c_id=customer.c_id;

SELECT c_name, c_id FROM customer
WHERE c_id NOT IN (SELECT c_id FROM `order`); 

SELECT o.o_id, o.o_date, sum(od.od_qty * p.p_price) as total_money FROM `order` as o
JOIN order_detail od ON o.o_id =od.o_id
JOIN product p ON p.p_id=od.p_id
GROUP BY o.c_id;

