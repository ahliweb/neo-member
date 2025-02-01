BEGIN;

--
-- ACTION DROP TABLE
--
DROP TABLE "database_member" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "database_member" (
    "id" bigserial PRIMARY KEY,
    "buktiPembayaran" text NOT NULL,
    "keterangan" text NOT NULL,
    "pelangganId" bigint NOT NULL
);

--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "database_member"
    ADD CONSTRAINT "database_member_fk_0"
    FOREIGN KEY("pelangganId")
    REFERENCES "member"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250130034112847', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250130034112847', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
