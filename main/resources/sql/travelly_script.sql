CREATE
    SEQUENCE IF NOT EXISTS hibernate_sequence;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

DROP TABLE IF EXISTS localisation CASCADE;
CREATE TABLE IF NOT EXISTS localisation
(
	"id" BIGINT PRIMARY KEY,
    "uuid" UUID DEFAULT uuid_generate_v4(),
    country VARCHAR(50) NOT NULL,
	city VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS "role";
CREATE TABLE "role" (
  "id" BIGINT PRIMARY KEY,
  "uuid" UUID DEFAULT uuid_generate_v4(),
  "name" varchar(50) DEFAULT NULL
);

INSERT INTO "role" VALUES (1,uuid_generate_v4(),'ADMIN');
INSERT INTO "role" VALUES (2,uuid_generate_v4(),'USER');

DROP TABLE IF EXISTS "user" CASCADE;
CREATE TABLE IF NOT EXISTS "user"
(
	"id" BIGINT PRIMARY KEY,
    "uuid" UUID DEFAULT uuid_generate_v4(),
    email VARCHAR(50) UNIQUE NOT NULL,
	"image" BYTEA,
	user_name VARCHAR(50) UNIQUE NOT NULL,
	"password" VARCHAR(255) NOT NULL,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
	date_of_birth DATE,
	"languages" VARCHAR(255),
	"enable" boolean,
	hobbies VARCHAR(255),
	localisation_id BIGINT,
	role_id BIGINT,
	CONSTRAINT localisation_fk FOREIGN KEY (localisation_id) REFERENCES localisation (id) ON DELETE SET NULL,
	CONSTRAINT role_fk FOREIGN KEY (role_id) REFERENCES "role" (id) ON DELETE SET NULL
);

DROP TYPE IF EXISTS POST_TYPE CASCADE;
CREATE TYPE POST_TYPE AS ENUM('TRIP', 'FOOD', 'COMPANIONSHIP');

DROP TABLE IF EXISTS post CASCADE;
CREATE TABLE IF NOT EXISTS post
(
	"id" BIGINT PRIMARY KEY,
    "uuid" UUID DEFAULT uuid_generate_v4(),
	title VARCHAR(50) NOT NULL,
	"description" VARCHAR(255) NOT NULL,
	creation_timestamp TIMESTAMP not null,
	active_from DATE NOT NULL,
	active_to DATE NOT NULL,
	active boolean default true not null,
	"type" varchar(55) NOT NULL,
	participants INTEGER,
	start_point varchar(55) NOT NULL,
	end_point varchar(55) NOT NULL,
	user_id BIGINT,
	CONSTRAINT user_fk FOREIGN KEY (user_id) REFERENCES "user" (id) ON DELETE SET NULL
);

DROP TABLE IF EXISTS post_attachment CASCADE;
CREATE TABLE IF NOT EXISTS post_attachment
(
	id BIGINT PRIMARY KEY,
    uuid UUID NOT NULL,
	url VARCHAR(255) NOT NULL,
	profile_image BOOLEAN NOT NULL,
	post_id BIGINT NOT NULL,
	CONSTRAINT post_fk FOREIGN KEY (post_id) REFERENCES post (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS chat CASCADE;
CREATE TABLE IF NOT EXISTS chat
(
	"id" BIGINT PRIMARY KEY,
    "uuid" UUID DEFAULT uuid_generate_v4(),
	first_participant_id BIGINT,
	second_participant_id BIGINT,
	CONSTRAINT first_participant_fk FOREIGN KEY (first_participant_id) REFERENCES "user" (id) ON DELETE SET NULL,
	CONSTRAINT second_participant_fk FOREIGN KEY (second_participant_id) REFERENCES "user" (id) ON DELETE SET NULL
);

DROP TABLE IF EXISTS "message" CASCADE;
CREATE TABLE IF NOT EXISTS "message"
(
	"id" BIGINT PRIMARY KEY,
    "uuid" UUID DEFAULT uuid_generate_v4(),
	chat_id BIGINT,
	sender_id BIGINT,
	recipient_id BIGINT,
	CONSTRAINT sender_fk FOREIGN KEY (sender_id) REFERENCES "user" (id) ON DELETE SET NULL,
	CONSTRAINT recipient_fk FOREIGN KEY (recipient_id) REFERENCES "user" (id) ON DELETE SET NULL,
	CONSTRAINT chat_fk FOREIGN KEY (chat_id) REFERENCES "chat" (id) ON DELETE CASCADE
);

DROP TABLE IF EXISTS "message_attachment" CASCADE;
CREATE TABLE IF NOT EXISTS message_attachment
(
	"id" BIGINT PRIMARY KEY,
    "uuid" UUID DEFAULT uuid_generate_v4(),
	message_id BIGINT,
	CONSTRAINT message_fk FOREIGN KEY (message_id) REFERENCES "message" (id) ON DELETE CASCADE
);









