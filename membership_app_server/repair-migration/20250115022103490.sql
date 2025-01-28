BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "database_member" (
    "id" bigserial PRIMARY KEY,
    "buktiPembayaran" json,
    "idPembayaran" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "member" (
    "id" bigserial PRIMARY KEY,
    "namaPelanggan" text NOT NULL,
    "noWhatsapp" text NOT NULL,
    "nik" bigint NOT NULL,
    "alamatKtp" text NOT NULL,
    "kelurahan" text NOT NULL,
    "kecamatan" text NOT NULL,
    "kabupaten" text NOT NULL,
    "provinsi" text NOT NULL,
    "status" text NOT NULL,
    "ktp" text,
    "tanggalDibuat" timestamp without time zone NOT NULL,
    "_salesPelangganSalesId" bigint
);

-- Indexes
CREATE UNIQUE INDEX "nik_pelanggan_idx" ON "member" USING btree ("nik");

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
-- ACTION CREATE FOREIGN KEY
--
ALTER TABLE ONLY "member"
    ADD CONSTRAINT "member_fk_0"
    FOREIGN KEY("_salesPelangganSalesId")
    REFERENCES "sales"("id")
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

--
-- MIGRATION VERSION FOR _repair
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('_repair', '20250115022103490', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250115022103490', "timestamp" = now();


COMMIT;
