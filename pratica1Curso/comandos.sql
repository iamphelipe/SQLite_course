-- database: ./auladb.sqlite
/* CREATE */
CREATE TABLE
   cursos (id, nome, aulas);

CREATE TABLE
   livros (id, titulo, anoFabricado);

/* DROP */
DROP TABLE cursos;

/* CRIANDO E INSERINDO DADOS */
CREATE TABLE
   livros (
      id INTEGER NOT NULL,
      nome TEXT NOT NULL,
      aulas INTEGER
   );

CREATE TABLE
   cursos (
      id INTEGER NOT NULL,
      nome TEXT NOT NULL,
      aulas INTEGER
   );

/* CONSULTAR INFORMAÇÕES DA TABELA */
PRAGMA table_info ('cursos');

SELECT
   *
FROM
   cursos;

/* INSERT - inserindo valores nos dados */
INSERT INTO
   cursos (id, nome, aulas)
VALUES
   (4, 'React', 21),
   (5, 'Typescript', 9),
   (6, 'NodeJS', 8);


DELETE FROM "cursos";
INSERT INTO cursos (nome, aulas) VALUES ('CSS', 12);

/* WHERE */
DELETE FROM "cursos" WHERE "id" = 1;
DELETE FROM "cursos" WHERE "nome" = 'HTML';
DELETE FROM "cursos" WHERE "nome" = 'JS';

/* SELECT */


SELECT "nome" FROM cursos;
SELECT * from cursos LIMIT 3;

SELECT * FROM cursos WHERE id >= 1;

SELECT * FROM cursos WHERE id > 1 AND aulas < 15;

/* UPDATE */
UPDATE "cursos" SET "nome" = 'ReactJS', "aulas" = 21 WHERE "id" = 4;