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
