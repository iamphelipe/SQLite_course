--database: ./db.sqlite

CREATE TABLE "users" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT NOT NULL,
  "email" TEXT NOT NULL UNIQUE,
  "created" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;

CREATE TABLE "users_preferences" (
  "id" INTEGER PRIMARY KEY,
  "user_id" INTEGER NOT NULL,
  "ads" INTEGER NOT NULL DEFAULT 0 CHECK ("ads" IN (0,1)),
  FOREIGN KEY("user_id") REFERENCES "users" ("id")
) STRICT;

INSERT INTO "users" ("name", "email") VALUES ('Phelipe', 'phelipe@origamid.com');

DELETE FROM "users";
DELETE FROM "users_preferences";

BEGIN;
  INSERT INTO "users" ("name", "email")
  VALUES ('André', 'andre@origamid.com');

  INSERT INTO "users_preferences" ("user_id")
  VALUES ((SELECT "id" FROM "users" WHERE "email" = 'andre@origamid.com'));

  UPDATE "users_preferences"
  SET "ads" = 1
  WHERE "user_id" = (SELECT "id" FROM "users" WHERE "email" = 'phelipe@origamid.com');
COMMIT;

DROP TABLE "users";
DROP TABLE "users_preferences";

CREATE TABLE "users" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT NOT NULL,
  "e-mail" TEXT NOT NULL UNIQUE,
  "role" TEXT DEFAULT 'user',
  "created" INTEGER NOT NULL DEFAULT (strftime('%s','now'))
) STRICT;

-- RENOMEIAR
ALTER TABLE "users" RENAME "e-mail" TO "email";
--DELETAR
ALTER TABLE "users" DROP "role";
-- ADICIONAR
ALTER TABLE "users" ADD "ads" INTEGER DEFAULT 0;
-- ALTERAR O NOME DA TABELA
ALTER TABLE "users" RENAME TO "users_old";
ALTER TABLE "users_old" RENAME TO "users";

INSERT INTO "users" ("name", "email") 
VALUES ('Phelipe', 'phelipe@email.com');






-- 1 Desativar chaves estrangeiras
PRAGMA foreign_keys = OFF;

-- 2 Iniciar transaction
BEGIN;

-- 3 Guardar Index, Trigger e View
SELECT "type", "sql" FROM "sqlite_schema" WHERE "tbl_name"='users'

-- 4 Criar tabela nova
CREATE TABLE "users_new" (
  "id" INTEGER PRIMARY KEY,
  "name" TEXT NOT NULL,
  "email" TEXT NOT NULL UNIQUE,
  "created" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

-- 5 Transferir dados
INSERT INTO "users_new" ("id", "nome", "email", "created")
SELECT "id", "name", "e-mail", datetime("created",'unixepoch')
FROM "users";

-- 6 Deletar tabela antiga
DROP TABLE "users";

-- 7 Renomear tabela nova
ALTER TABLE "users_new" RENAME TO "users";

-- 8/9 Recriar Index, Trigger e View. Modificar o que for necessário

-- 10 Checar se quebrou alguma foreign key
PRAGMA foreign_key_check;

-- 11 Commit
COMMIT;

-- 12 Reabilidatar chaves estrangeiras
PRAGMA foreign_keys = ON;