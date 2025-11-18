-- database: ./db.sqlite

CREATE TABLE pessoas (id, nome, idade, emprego);

INSERT INTO pessoas (id, nome, idade, emprego) VALUES (1, 'Phelipe', 21, 'Desenvolvedor de Software');
INSERT INTO pessoas (id, nome, idade, emprego) VALUES (2, 'Dudu', 20, 'Marketing Digital');

SELECT * FROM pessoas;
SELECT nome FROM pessoas;

CREATE TABLE "cursos" (
   "id" INTEGER PRIMARY KEY,
  "nome" TEXT,
  "preco" INTEGER 
) STRICT;

INSERT INTO "cursos" ("nome", "preco") VALUES ('HTML', 1000);

CREATE TABLE "aulas" (
   "curso_id" INTEGER,
   "nome" TEXT
);

INSERT INTO "aulas" ("curso_id", "nome") VALUES (1, 'Fundamentos do CSS'); 

SELECT rowid, * from "aulas";

CREATE TABLE "produtos" (
   "id" INTEGER PRIMARY KEY,
   "nome" TEXT
) STRICT;

CREATE TABLE "pedidos" (
   "id" INTEGER PRIMARY KEY,
   "criado" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "produtos" ("nome") VALUES ('Smartphone');

CREATE TABLE "pedido_produtos" (
   "pedido_id" INTEGER,
   "produto_id" INTEGER,
   FOREIGN KEY ("pedido_id") REFERENCES "pedidos" ("id"),
   FOREIGN KEY ("produto_id") REFERENCES "produtos" ("id")
) STRICT;

INSERT INTO "pedidos" ("id") VALUES (1);
INSERT INTO "pedido_produtos" ("pedido_id", "produto_id") VALUES (1, 1), (1, 2);