-- Aqui você deve colocar os códigos SQL referentes às

    -- SIMULAÇÕES DE UM CRUD --

-- CREATE
-- 1)
INSERT INTO clients(name) VALUES ('Georgia') RETURNING *;
-- OBS: 'ZERO' FOI DECLARADO COMO VALOR DEFAULT, POR ISSO O ATRIBUTO 'loyalty' ESTA AUSENTE

-- 2)
INSERT INTO orders(status, client_id) VALUES ('Recebido', 6) RETURNING *;

-- 3)
INSERT INTO product_order(product_id, order_id)
VALUES 
  (1,6),
  (2,6),
  (6,6),
  (8,6),
  (8,6)
RETURNING *;
-----------------------------------------------------------------------------------

-- READ
-- 1)
SELECT 
  cl.id, cl.name client, cl.loyalty,
  ord.id order_id, ord.status, ord.client_id,
  prod.id product_id, prod.name, prod.type, TRUNC(prod.price::numeric), prod.loyalty_pts
FROM product_order po 
  JOIN orders ord ON po.order_id = ord.id
  JOIN products prod ON po.product_id = prod.id
  JOIN clients cl ON ord.client_id = cl.id
  WHERE cl.id = 6;

-----------------------------------------------------------------------------------
-- UPDATE
-- 1)
UPDATE clients cl
SET loyalty = (
  SELECT 
    SUM(prod.loyalty_pts)
  FROM product_order po
    JOIN orders ord ON po.order_id = ord.id
    JOIN products prod ON po.product_id = prod.id
  WHERE ord.client_id = 6
) WHERE cl.name = 'Georgia' RETURNING *;

-----------------------------------------------------------------------------------

-- DELETE
-- 1)
DELETE FROM clients WHERE name = 'Marcelo' RETURNING *;
