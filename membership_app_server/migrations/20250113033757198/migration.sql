BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "akun" DROP COLUMN "accId";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "broadcast" DROP COLUMN "idMessage";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "database_member" DROP COLUMN "idDbMember";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "informasi" DROP COLUMN "idInformasi";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "member" DROP COLUMN "idMember";
--
-- ACTION ALTER TABLE
--
ALTER TABLE "sales" DROP COLUMN "idSales";

--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250113033757198', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250113033757198', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
