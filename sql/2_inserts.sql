-- INSERÇÃO DE DADOS NAS TABELAS --

INSERT INTO clients
  (name, loyalty)
VALUES
  ('Paula', 64),
  ('Francisco', 168),
  ('Elise', 24),
  ('Marcelo', 48),
  ('Laura', 36);

INSERT INTO addresses
  (cep, street, number, district, complement, client_id)
VALUES
  ('09092-909', 'Rua 1', 121, 'Bairro 1', 'apto. 302', 1),
  ('12345-995', 'Rua 2', 254, 'Bairro 2', null, 2),
  ('54625-845', 'Rua 3', 1050, 'Bairro 3', null, 3),
  ('65655-321', 'Rua 4', 79, 'Bairro 4', 'APTO. 505', 4),
  ('15484-565', 'Rua 5', 32, 'Bairro 5', null, 5);
    
INSERT INTO products
  (name, type, price, loyalty_pts)
VALUES
  ('Big Serial', 'Burguer', 24.99, 12),
  ('Varchapa', 'Burguer', 32.99, 16),
  ('Update sem WHERE', 'Burguer', 42.99, 20), 
  ('Um pra Dois', 'Burguer', 49.99, 24),
  ('DELETE sem WHERE', 'Burguer', 54.99, 32), 
  ('Fritas', 'Acompanhamento', 14.99, 8), 
  ('Cebola', 'Acompanhamento', 19.99, 12),
  ('Coca-Cola', 'Bebida', 5.99, 6), 
  ('Fanta', 'Bebida', 5.99, 6), 
  ('Guaraná', 'Bebida', 5.99, 6);
    

INSERT INTO orders 
    (status, client_id)
VALUES
  ('Em preparo', 1),
  ('Finalizado', 2),
  ('Recebido', 3),
  ('Entregue', 4),
  ('Recebido', 5);
    
INSERT INTO product_order
  (order_id, product_id)
VALUES
  (1, 4),
  (1, 2),
  (1, 6),
  (2, 2),
  (2, 4),
  (2, 7),
  (2, 9),
  (3, 5),
  (3, 6),
  (3, 9),
  (4, 1),
  (4, 1),
  (4, 6),
  (4, 10),
  (5, 3),
  (5, 2),
  (5, 7),
  (5, 8);
