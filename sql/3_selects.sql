SELECT * FROM addresses;
SELECT * FROM clients;
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM product_order;

-- Aqui você deve colocar os códigos SQL referentes às

    -- SELEÇÕES DE DADOS --

-- 1)
SELECT 
  ord.id, ord.status, ord.client_id,
  prod.id prod_id, prod.name, prod.type, TRUNC(prod.price::numeric, 2), prod.loyalty_pts
FROM product_order po 
  JOIN orders ord ON po.order_id = ord.id
  JOIN products prod ON po.product_id = prod.id;

-- 2)
SELECT
  ord.id
FROM product_order po
  JOIN orders ord ON po.order_id = ord.id
  JOIN products prod ON po.product_id = prod.id
    WHERE prod.name = 'Fritas';
    
-- 3)
SELECT
  cl.name likes_fries
FROM product_order po
  JOIN orders ord ON po.order_id = ord.id
  JOIN clients cl ON ord.client_id = cl.id
    WHERE po.product_id = 6;

-- 4)
SELECT
  TRUNC(SUM(prod.price::numeric), 2) total_laura
FROM product_order po
  JOIN products prod ON po.product_id = prod.id
  JOIN orders ord ON po.order_id = ord.id
  JOIN clients cl ON ord.client_id = cl.id
    WHERE cl.name = 'Laura';

-- 5)
SELECT
  prod.name product_name, COUNT(*) orders
FROM product_order po
  JOIN products prod ON po.product_id = prod.id
  GROUP BY prod.name
  ORDER BY prod.name;