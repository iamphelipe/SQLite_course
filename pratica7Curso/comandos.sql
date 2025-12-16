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