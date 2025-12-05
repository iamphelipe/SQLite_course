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

UPDATE "cursos" SET "nome" = 'HTML e CSS',  aulas = 11 WHERE "id" = 1