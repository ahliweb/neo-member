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
    "buktiPembayaran" json,
    "idPembayaran" bigint NOT NULL
);

--
-- ACTION ALTER TABLE
--
DROP INDEX "user_address_unique_idx";
ALTER TABLE "member" DROP CONSTRAINT "member_fk_1";
ALTER TABLE "member" DROP CONSTRAINT "member_fk_0";
ALTER TABLE ONLY "member"
    ADD CONSTRAINT "member_fk_0"
    FOREIGN KEY("_salesPelangganSalesId")
    REFERENCES "sales"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
--
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "database_member"
    ADD CONSTRAINT "database_member_fk_0"
    FOREIGN KEY("idPembayaran")
    REFERENCES "member"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;


--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250115020334587', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250115020334587', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
