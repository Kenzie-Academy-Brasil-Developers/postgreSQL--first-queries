-- Aqui você deve colocar os códigos SQL referentes à:

    -- CRIAÇÃO DE TABELAS -- 

-- Tabela clientes:
CREATE TABLE IF NOT EXISTS clients(
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100),
  loyalty INTEGER NOT NULL DEFAULT 0
);

-- Tabela endereços:
CREATE TABLE IF NOT EXISTS addresses(
  id BIGSERIAL PRIMARY KEY,
  cep VARCHAR(10) NOT NULL,
  street VARCHAR(50) NOT NULL,
  number INTEGER NOT NULL,
  district VARCHAR(50),
  complement VARCHAR(100),
  client_id INTEGER UNIQUE NOT NULL,
  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);
-- DROP TABLE addresses;

-- Tabela pedidos:
CREATE TABLE IF NOT EXISTS orders(
  id BIGSERIAL PRIMARY KEY,
  status VARCHAR(50),
  client_id INTEGER NOT NULL,
  FOREIGN KEY (client_id) REFERENCES clients(id) ON DELETE CASCADE
);

-- Tabela produtos:
CREATE TABLE IF NOT EXISTS products(
  id BIGSERIAL PRIMARY KEY,
  name VARCHAR(100),
  type VARCHAR(30),
  price FLOAT(8),
  loyalty_pts INTEGER NOT NULL
);

-- Tabela produtos_pedidos:
CREATE TABLE IF NOT EXISTS product_order(
  id BIGSERIAL PRIMARY KEY,
  product_id INTEGER NOT NULL,
  order_id INTEGER NOT NULL,
  FOREIGN KEY (product_id) REFERENCES products(id) ON DELETE CASCADE,
  FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE
);
