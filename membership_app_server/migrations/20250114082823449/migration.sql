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
    "nikPelanggan" text NOT NULL,
    "buktiPembayaran" json
);

--
-- ACTION DROP TABLE
--
DROP TABLE "member" CASCADE;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "member" (
    "id" bigserial PRIMARY KEY,
    "namaPelanggan" text NOT NULL,
    "noWhatsapp" text NOT NULL,
    "nik" text NOT NULL,
    "alamatKtp" text NOT NULL,
    "kelurahan" text NOT NULL,
    "kecamatan" text NOT NULL,
    "kabupaten" text NOT NULL,
    "provinsi" text NOT NULL,
    "status" text NOT NULL,
    "ktp" text,
    "nikSales" text NOT NULL,
    "tanggalDibuat" timestamp without time zone NOT NULL
);

-- Indexes
CREATE UNIQUE INDEX "nik_pelanggan_idx" ON "member" USING btree ("nik");

--
-- ACTION ALTER TABLE
--
CREATE UNIQUE INDEX "nik_sales_idx" ON "sales" USING btree ("nik");

--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250114082823449', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250114082823449', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
