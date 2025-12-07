--database: ./db.sqlite

CREATE TABLE "cursos" (id, nome, aulas);

DROP TABLE cursos;

CREATE TABLE "cursos" (
    id INTEGER NOT NULL, 
    nome TEXT NOT NULL,
    aulas INTEGER
);

PRAGMA table_info("cursos");


SELECT * from cursos;

INSERT INTO "cursos" (id, nome, aulas)
    VALUES (1, 'HTML', 20),
           (2, 'CSS', 30),
           (3, 'JS', 17);

INSERT INTO cursos(id, nome, aulas) VALUES (
    4, 'React', 15
);

INSERT INTO "cursos" (id, nome, aulas) VALUES ('HTML', 20);


DELETE FROM cursos;
DELETE FROM "cursos" WHERE "nome" = 'JS';


SELECT id, nome FROM cursos LIMIT 2;

SELECT id, nome FROM cursos WHERE id > 2; 
SELECT id, nome FROM cursos WHERE id > 2 AND aulas > 10;

UPDATE "cursos" SET "nome" = 'HTML e CSS',  aulas = 11 WHERE "id" = 1;















-- Exercicio 01

CREATE TABLE "produtos" (
    "id" INTEGER NOT NULL,
    "nome" TEXT NOT NULL,
    "preco" INTEGER NOT NULL
    );
CREATE TABLE "clientes" (
    "id" INTEGER NOT NULL, 
    "nome" TEXT NOT NULL, 
    "email" TEXT NOT NULL
    );
CREATE TABLE "compras" (
    "id" INTEGER NOT NULL,
    "cliente_id" INTEGER NOT NULL, 
    "produto_id" INTEGER NOT NULL, 
    "data" TEXT NOT NULL
    );

INSERT INTO "produtos"
    VALUES (
        1, 'Notebook', 1000
    ), (
        2, 'Smartphone', 500
    ), (
        3, 'Tablet', 300
    );

INSERT INTO "clientes"
    VALUES (
    1, 'Maria', 'maria@email.com'
    ), (
        2, 'Joao', 'joao@email.com'
    );

INSERT INTO "compras"
    VALUES (
        1, 2, 1, '2049-01-01'
    ), (
        2, 1, 2, '2049-01-02'
    ), (
        3, 2, 3, '2049-01-03'
    );

SELECT * FROM "produtos";

SELECT "nome" FROM "produtos" WHERE "preco" > 400;

SELECT id, "cliente_id" AS "Joao", "produto_id", "data" FROM "compras" WHERE cliente_id = 2;