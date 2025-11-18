--database: ./db.sqlite

CREATE TABLE "produtos" (
   "id" INT,
   "descontinuado" TINYINT,
   "nome" VARCHAR(100),
   "preco" DECIMAL(10, 2),
   "descricao" TEXT,
   "data_criacao" DATETIME
);

INSERT INTO "produtos" (
   "id", "descontinuado", "nome", "preco", "descricao", "data_criacao"
) VALUES (
   1, 0, 'Notebook', 200.5, null, '24-10-2049'
);

INSERT INTO "produtos" (
   "id", "descontinuado", "nome", "preco", "descricao", "data_criacao"
) VALUES (
   '1', '0', 007, '200.5', null, '24-10-2049'
);

SELECT "id", typeof("id"), typeof("preco") FROM "produtos";

/* strict */

CREATE TABLE "cursos" (
   "id" INTEGER,
   "nome" TEXT,
   "preco" INTEGER
) STRICT;

INSERT INTO "cursos" ("id", "nome", "preco") VALUES ('32423', 'HTML', 1000);

/* PRIMARY KEY */
CREATE TABLE "cursos2" (
   "id" INTEGER PRIMARY KEY,
   "nome" TEXT,
   "preco" INTEGER
) STRICT;

INSERT INTO "cursos2" ("nome", "preco") VALUES ( 'HTML', 1000);

CREATE TABLE "aulas" (
   "curso_id" INTEGER,
   "nome" TEXT
);

INSERT INTO
   "aulas" ("curso_id", "nome")
VALUES (1, 'Java');

INSERT INTO
   "aulas" ("curso_id", "nome")
VALUES (1, 'Spring');

SELECT * FROM aulas;
SELECT rowid, * FROM "aulas";
SELECT rowid, * FROM "cursos2";

PRAGMA foreign_keys;

CREATE TABLE "cursos" (
   "id" INTEGER PRIMARY KEY,
   "nome" TEXT
);

CREATE TABLE "aulas" (
   "id" INTEGER PRIMARY KEY,
   "curso_id" INTEGER,
   "nome" TEXT,
   FOREIGN KEY("curso_id") REFERENCES "cursos" ("id") ON DELETE CASCADE ON UPDATE CASCADE
) STRICT;

INSERT INTO "cursos" ("nome") VALUES ('JavaScript');
INSERT INTO "aulas" ("curso_id", "nome") VALUES (1, 'Fundamentos do JS');

DROP TABLE "aulas";
DELETE FROM "cursos" WHERE id = 1;

UPDATE "cursos" SET "id" = 2 WHERE "id" = 1;

/* UNIQUE */
CREATE TABLE "usuario" (
   "id" INTEGER PRIMARY KEY,
   "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
   "nome" TEXT NOT NULL,
   "tipo" TEXT NOT NULL DEFAULT 'usuario' CHECK ("tipo" IN ('usuario', 'admin')),
   "vitalicio" INTEGER DEFAULT 0 CHECK ("vitalicio" IN (0, 1)),
   "criado" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;

DROP TABLE "usuario";

CREATE TABLE "certificados" (
   "id" INTEGER PRIMARY KEY,
   "usuario_id" INTEGER NOT NULL,
   "curso_id" INTEGER NOT NULL,
   UNIQUE("usuario_id", "curso_id")
) STRICT;


INSERT INTO "usuario" ("email", "nome", "tipo") VALUES ('phelipe@email.com' ,'Phelipe', 'admin');
INSERT INTO "usuario" ("email", "nome", "tipo", "vitalicio") VALUES ('dudu@email.com' ,'Dudu', 'admin', 1);
INSERT INTO "certificados" ("usuario_id", "curso_id") VALUES (2, 3);