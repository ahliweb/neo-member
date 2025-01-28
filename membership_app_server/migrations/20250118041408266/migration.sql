BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "member" ADD COLUMN "alamatDomisili" text;
ALTER TABLE "member" ADD COLUMN "kelurahanDomisili" text;
ALTER TABLE "member" ADD COLUMN "kecamatanDomisili" text;
ALTER TABLE "member" ADD COLUMN "kabupatenDomisili" text;
ALTER TABLE "member" ADD COLUMN "provinsiDomisili" text;

--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250118041408266', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250118041408266', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
