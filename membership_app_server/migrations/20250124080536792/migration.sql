BEGIN;

--
-- ACTION ALTER TABLE
--
ALTER TABLE "member" DROP CONSTRAINT "member_fk_0";
ALTER TABLE "member" ADD COLUMN "salesPelangganSalesId" bigint;
ALTER TABLE ONLY "member"
    ADD CONSTRAINT "member_fk_1"
    FOREIGN KEY("_salesPelangganSalesId")
    REFERENCES "sales"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;
ALTER TABLE ONLY "member"
    ADD CONSTRAINT "member_fk_0"
    FOREIGN KEY("salesPelangganSalesId")
    REFERENCES "sales"("id")
    ON DELETE NO ACTION
    ON UPDATE NO ACTION;

--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250124080536792', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250124080536792', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
