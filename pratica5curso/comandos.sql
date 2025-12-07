--database: ./db.sqlite
DROP TABLE usuario;

CREATE TABLE "usuario" (
    "id" INTEGER PRIMARY KEY,
    "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
    "nome" TEXT NOT NULL,
    "tipo" TEXT NOT NULL DEFAULT 'usuario' CHECK ("tipo" IN ('usuario', 'admin')),
    "vitalicio" INTEGER DEFAULT 0 CHECK ("vitalicio" IN (0, 1)),
    "criado" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;


INSERT INTO "usuario" ("email", "nome")
    VALUES ('phelipe@email', 'Phelipe');

INSERT INTO "usuario" ("email", "nome", "vitalicio")
    VALUES ('dudu@email', 'Dudu', 1);

INSERT INTO "usuario" ("email", "nome", "tipo")
    VALUES ('Andre@email', 'Andre', 'admin');