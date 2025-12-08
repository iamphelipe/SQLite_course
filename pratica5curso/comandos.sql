--database: ./db.sqlite

-- - Use STRICT.

-- - CURRENT_TIMESTAMP retorna a data e hora atual.

-- - PRIMARY KEY (id1, id2) define uma chave primária composta.

-- - O SLUG do curso precisa ser único
-- /api/javascript-basico

-- - O SLUG da aula precisa ser único em relação ao curso.
-- /api/javascript-basico/variaveis-let-const

-- - Se o usuário for deletado, as aulas concluídas e certificados desse usuário também devem ser removidas.

-- - O campo "free" na tabela de aulas deve ser um booleano.

DROP TABLE "courses";
DELETE FROM "courses";

CREATE TABLE "users" (
    "id" INTEGER PRIMARY KEY,
    "name" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "email" TEXT NOT NULL UNIQUE COLLATE NOCASE,
    "created" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "users" ("name", "password", "email")
    VALUES ('Phelipe', '123456', 'phelipe@gmail.com');

CREATE TABLE "courses" (
    "id" INTEGER PRIMARY KEY,
    "slug" TEXT NOT NULL COLLATE NOCASE UNIQUE,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "aulas" INTEGER NOT NULL,
    "horas" INTEGER NOT NULL,
    "created" TEXT DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "courses" ("slug", "title", "description", "aulas", "horas")
    VALUES ('javascript-basico', 'JavaScript Básico', 'Aprenda os fundamentos da linguagem JavaScript.', 20, 5);


CREATE TABLE lessons (
    "id" INTEGER PRIMARY KEY,
    "course_id" INTEGER,
    "slug" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "materia" TEXT NOT NULL,
    "materia_slug" TEXT NOT NULL,
    "seconds" INTEGER NOT NULL,
    "video" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "lesson_order" INTEGER NOT NULL,
    "free" INTEGER DEFAULT 0 CHECK("free" IN (0, 1)),
    "created" TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("course_id") REFERENCES "courses" ("id"),
    UNIQUE ("course_id", "slug")
) STRICT;

INSERT INTO "lessons" ("course_id", "slug", "title", "materia", "materia_slug", "seconds", "video", "description",  "lesson_order", "free")
    VALUES (
        1, 'variaveis-let-const', 'Variáveis: let e const', 'Fundamentos', 'fundamentos',
        480, 'variaveis.mp4', 'Entenda a diferença entre let, const e var.', 3, 0
    );

CREATE TABLE "lessons_completed" (
    "user_id" INTEGER,
    "course_id" INTEGER,
    "lesson_id" INTEGER,
    "completed" TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("course_id") REFERENCES "courses" ("id"),
    FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id")
) STRICT;

INSERT INTO "lessons_completed" ("user_id", "course_id", "lesson_id")
    VALUES (1, 1, 1);


CREATE TABLE "certificates" (
    "id" TEXT NOT NULL,
    "user_id" INTEGER,
    "course_id" INTEGER,
    "completed" TEXT DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
    FOREIGN KEY ("course_id") REFERENCES "courses" ("id")
    UNIQUE("user_id", "course_id")
);

INSERT INTO "certificates" ("id", "user_id", "course_id")
    VALUES ('aq32scsqd', 1, 1 );

DROP TABLE certificates

-- {
--   "id": "aq32scsqd",
--   "user_id": 42,
--   "course_id": 1,
--   "completed": "2049-06-15 09:10:00"
-- }
