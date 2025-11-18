--database: ./db.sqlite

CREATE TABLE "produtos" (
   "id" INTEGER PRIMARY KEY,
   "nome" TEXT
) STRICT;

CREATE TABLE "pedidos" (
   "id" INTEGER PRIMARY KEY,
   "criado" TEXT DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE "pedido_produtos" (
   "pedido_id" INTEGER,
   "produto_id" INTEGER,
   FOREIGN KEY ("pedido_id") REFERENCES "pedidos" ("id"),
   FOREIGN KEY ("produto_id") REFERENCES "produtos" ("id")
) STRICT;

INSERT INTO "produtos" ("nome") VALUES ('Smartphone');
INSERT INTO "pedidos" ("id") VALUES (1);

INSERT INTO "pedido_produtos" ("pedido_id", "produto_id") VALUES (1,1), (1, 2);


CREATE TABLE "status_pedido" (
   "id" INTEGER PRIMARY KEY,
   "nome" TEXT UNIQUE NOT NULL,
   "cor" TEXT NOT NULL,
   "encerrado" INTEGER NOT NULL CHECK ("encerrado" IN (0,1))
) STRICT;

INSERT INTO
   "status_pedido" ("nome", "cor", "encerrado")
VALUES
   ('aguardando', '#FFC107', 0),
   ('pago', '#17A2B8', 0),
   ('separando', '#007BFF', 0),
   ('enviado', '#6610F2', 0),
   ('entregue', '#28A745', 1),
   ('cancelado', '#DC3545', 1); 