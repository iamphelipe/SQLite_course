--database: ./db.sqlite

CREATE TABLE "cursos" (
    "id" INTEGER PRIMARY KEY,
    "nome" TEXT
) STRICT;

CREATE TABLE "aulas" (
    "id" INTEGER PRIMARY KEY,
    "curso_id" INTEGER,
    "nome" TEXT,
    FOREIGN KEY("curso_id") REFERENCES "cursos" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) STRICT;

INSERT INTO "cursos" ("nome")
    VALUES ('HTML');

INSERT INTO "cursos" ("nome")
    VALUES ('CSS');

INSERT INTO "cursos" ("nome")
    VALUES ('JS');

INSERT INTO "aulas" ("curso_id", "nome")
    VALUES (1, 'Fundamentos do HTML');

DELETE FROM "cursos" WHERE "id" = 1;

UPDATE "cursos" SET ("id") = 1 WHERE id = 3;


DROP TABLE aulas