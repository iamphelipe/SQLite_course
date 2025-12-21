-- database: ./db.sqlite

CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "email" TEXT NOT NULL UNIQUE
) STRICT;

CREATE TABLE "users_config" (
    "user_id" INTEGER PRIMARY KEY REFERENCES "users" ("id") ON DELETE CASCADE,
    "config" TEXT NOT NULL CHECK (json_valid("config"))
) STRICT;

INSERT INTO "users" ("email") VALUES ('phelipe@email.com'), ('andre@email.com');

INSERT INTO "users_config" ("config") VALUES (json('{"video": 1, "speed": 2.5, "font": "monospace"}')), (json('{"video": 2, "speed": 1, "font": "arial"}'));

DELETE FROM "users_config" WHERE "user_id" = 3;

INSERT INTO "users_config" ("config") VALUES (json_object('video', 2, 'speed', 1, 'font', 'arial'));

SELECT typeof(json_extract("config", '$.speed')) AS 'speed' FROM "users_config";

SELECT "config" ->> '$.speed' AS 'speed', "config" ->> '$.video' AS "video" FROM "users_config";

SELECT * FROM "users_config" WHERE "config" ->> '$.font' = 'arial';

UPDATE "users_config" 
SET "config" = json_set("config", '$.font', 'helvetica') 
WHERE "user_id" = 2;

UPDATE "users_config" 
SET "config" = json_remove("config", '$.font') 
WHERE "user_id" = 2;

UPDATE "users_config" 
SET "config" = json_insert("config", '$.ads', 0);

ALTER TABLE "users_config" ADD COLUMN "ads" INTEGER AS ("config" ->> '$.ads');



INSERT INTO "users" ("email") VALUES ('phelipe@email.com'), ('andre@email.com');
INSERT INTO "users" ("email") VALUES ('marcia@email.com');

INSERT INTO "users_config" ("config") VALUES (json('{"video": 1, "speed": 2.5, "font": "monospace", "ads": 1}'));

SELECT '[3,2,4,6,8]' ->> '$[2]';

SELECT json_array('pt','en','es') ->> '$[2]';
SELECT json_set(json_array('pt','en','es'), '$[1]', 'it');

SELECT * FROM "users_config"