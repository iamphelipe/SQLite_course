--database: ./db.sqlite

/*

Considerações:

- Use STRICT. OK

- CURRENT_TIMESTAMP retorna a data e hora atual. OK

- PRIMARY KEY (id1, id2) define uma chave primária composta.

- O SLUG do curso precisa ser único OK
/api/javascript-basico OK

- O SLUG da aula precisa ser único em relação ao curso. OK
/api/javascript-basico/variaveis-let-const OK

- Se o usuário for deletado, as aulas concluídas e certificados desse usuário também devem ser removidas.

- O campo "free" na tabela de aulas deve ser um booleano. OK

*/

DROP TABLE "users";

CREATE TABLE "users" (
   "id" INTEGER PRIMARY KEY ,
   "name" TEXT NOT NULL,
   "password" TEXT NOT NULL,
   "email" TEXT NOT NULL COLLATE NOCASE UNIQUE,
   "created" TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
) STRICT;

INSERT INTO "users" (name, password, email)
VALUES
   ('Phelipe','lipe123', 'lipe@email.com'),
   ('Dudu', 'dudu123', 'dudu@email.com'),
   ('Guilherme', 'sampaio123', 'guilherme@email.com');

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
VALUES
   ('javascript-basico', 'JavaScript Básico', 'Aprenda os fundamentos da linguagem JavaScript.', 20, 5),
   ('react-introducao', 'React Introdução', 'Introduzindo o conceito e prática da biblioteca.', 24, 11),
   ('css-avancado', 'CSS Avançado', 'Avançando seus conhecimentos em CSS.', 11, 23);

CREATE TABLE "lessons" (
   "id" INTEGER PRIMARY KEY,
   "course_id" INTEGER NOT NULL,
   "slug" TEXT NOT NULL COLLATE NOCASE,
   "title" TEXT NOT NULL,
   "materia" TEXT NOT NULL,
   "materia_slug" TEXT NOT NULL,
   "seconds" INTEGER NOT NULL,
   "video" TEXT NOT NULL,
   "description" TEXT NOT NULL,
   "lesson_order" INTEGER NOT NULL,
   "free" INTEGER NOT NULL DEFAULT 1 CHECK ("free" IN (0, 1)),
   "created" TEXT DEFAULT CURRENT_TIMESTAMP,
   UNIQUE("course_id", "slug"),
   FOREIGN KEY ("course_id") REFERENCES "courses" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO
   "lessons" ("course_id", "slug", "title", "materia", "materia_slug", "seconds", "video", "description", "lesson_order", "free")
VALUES
   (1, 'variaveis-let-const', 'Variáveis: let e const', 'Fundamentos', 'fundamentos', 400, 'variaveis.mp4', 'Entenda a diferença entre let, const e var.', 3, 1),
   (2, 'hook-usestate', 'Hook: UseState', 'Hooks', 'hooks', 500, 'hooks.mp4', 'Como manipular dados usando o useState', 2, 1),
   (3, 'flexbox-position', 'Posicionando com FlexBox', 'Display', 'display', 200, 'display.mp4', 'Aprenda a fazer um layout com Flexbox', 4, 1);

CREATE TABLE "lessons_completed" (
   "user_id" INTEGER NOT NULL,
   "course_id" INTEGER NOT NULL,
   "lesson_id" INTEGER NOT NULL,
   "completed" TEXT DEFAULT CURRENT_TIMESTAMP,
   PRIMARY KEY ("user_id", "course_id", "lesson_id"),
   FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
   FOREIGN KEY ("course_id") REFERENCES "courses" ("id") ON DELETE CASCADE,
   FOREIGN KEY ("lesson_id") REFERENCES "lessons" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO "lessons_completed" ("user_id", "course_id", "lesson_id")
VALUES
   (1, 1, 1),
   (2, 2, 2), 
   (3, 3, 3);

INSERT INTO "lessons_completed" ("user_id", "course_id", "lesson_id")
VALUES
   (1, 2, 2), 
   (2, 1, 1);

INSERT INTO "lessons_completed" ("user_id", "course_id", "lesson_id")
VALUES
   (3, 2, 2);

CREATE TABLE "certificates" (
   "id" TEXT PRIMARY KEY,
   "user_id" INTEGER NOT NULL,
   "course_id" INTEGER NOT NULL,
   "completed" TEXT DEFAULT CURRENT_TIMESTAMP,
   UNIQUE ("user_id", "course_id"),
   FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE CASCADE,
   FOREIGN KEY ("course_id") REFERENCES "courses" ("id") ON DELETE CASCADE
) STRICT;

INSERT INTO "certificates" ("id", "user_id", "course_id")
VALUES
   ('aq32scsqd', 1, 1),
   ('sdjfsdf99', 2, 2),
   ('pppdfszv32', 3, 3);

INSERT INTO "certificates" ("id", "user_id", "course_id")
VALUES
   ('oijhsdsd10', 1, 2);

INSERT INTO "certificates" ("id", "user_id", "course_id")
VALUES
   ('osdfsfffe07', 1, 3);

DROP TABLE "certificates";
DELETE FROM "users" WHERE "id" = 1;  