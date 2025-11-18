--database: ./db.sqlite

/* Crie as tabelas: produtos, clientes e compras */

CREATE TABLE produtos (
   id INTEGER NOT NULL,
   nome TEXT NOT NULL,
   preco INTEGER NOT NULL
);

CREATE TABLE clientes (
   id INTEGER NOT NULL,
   nome TEXT NOT NULL,
   email TEXT NOT NULL
);

CREATE TABLE compras (
   id INTEGER NOT NULL,
   cliente_id INTEGER NOT NULL,
   produto_id INTEGER NOT NULL,
   data TEXT NOT NULL
);

/* INSERT produtos */
INSERT INTO produtos (id, nome, preco) VALUES (1, 'Notebook', 1000);
INSERT INTO produtos (id, nome, preco) VALUES (2, 'Smartphone', 500);
INSERT INTO produtos (id, nome, preco) VALUES (3, 'Tablet', 300);

/* INSERT clientes */
INSERT INTO clientes (id, nome, email) VALUES (1, 'Maria', 'maria@email.com');
INSERT INTO clientes (id, nome, email) VALUES (2, 'João', 'joao@email.com');

/* INSERT compras */
INSERT INTO compras (id, cliente_id, produto_id, data) VALUES (1, 2, 1, '2049-01-01');
INSERT INTO compras (id, cliente_id, produto_id, data) VALUES (2, 1, 2, '2049-01-02');
INSERT INTO compras (id, cliente_id, produto_id, data) VALUES (3, 2, 3, '2049-01-03');

SELECT * FROM produtos;

SELECT "nome" from produtos WHERE preco > 400;

SELECT * FROM compras WHERE cliente_id = 2;