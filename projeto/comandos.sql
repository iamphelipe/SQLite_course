--database: ./db.sqlite

-- 1 - PRAGMA
-- Definir as configurações PRAGMA.

-- Configurações recomendadas para app web
PRAGMA foreign_keys = 1;

PRAGMA journal_mode = WAL; -- Persiste
PRAGMA synchronous = NORMAL;

PRAGMA cache_size = 2000;
PRAGMA busy_timeout = 5000;
PRAGMA temp_store = memory;

PRAGMA analysis_limit = 1000;
PRAGMA optimize = 0x10002;

-- 2 - CREATE TABLE
--     Tabelas: users, sessions, resets, courses, lessons, lessons_completed, certificates
--     Adicionar novas colunas se necessário
--     Criar indices

CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
    "password" TEXT NOT NULL,
    "created" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

CREATE TABLE "sessions" (
    "id" INTEGER PRIMARY KEY,
    "user_id" INTEGER NOT NULL,
    "access_token" TEXT NOT NULL UNIQUE,
    "refresh_token" TEXT NOT NULL UNIQUE,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO "sessions" ("user_id", "access_token", "refresh_token")
VALUES 
( 1, lower(hex(randomblob(16))), lower(hex(randomblob(16)))),
( 2, lower(hex(randomblob(16))), lower(hex(randomblob(16)))),
( 3, lower(hex(randomblob(16))), lower(hex(randomblob(16)))),
( 4, lower(hex(randomblob(16))), lower(hex(randomblob(16)))),
( 5, lower(hex(randomblob(16))), lower(hex(randomblob(16))));


INSERT INTO "users" ("name", "email", "password")
VALUES
 ('Phelipe', lower('phelipe@email.com'), '3456345'),
 ('Dudu', lower('Dudu@email.com'), '32345'),
 ('Jose', lower('Jose@email.com'), '6457346'),
 ('Iury', lower('Iury@email.com'), '34563'),
 ('Augusto', lower('Augusto@email.com'), '2345656'),
 ('Guilherme', lower('Guilherme@email.com'), '879786'),
 ('Isadora', lower('Isadora@email.com'), '567765'),
 ('Dina', lower('Dina@email.com'), 'DFGHDFCGH'),
 ('Renato', lower('Renato@email.com'), '345645'),
 ('Alessandra', lower('Alessandra@email.com'), 'DSFG534W6');

delete FROM "sessions";

--(lower(hex(randomblob(16))))
DROP TABLE sessions;