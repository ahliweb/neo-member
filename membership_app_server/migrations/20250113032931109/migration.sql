BEGIN;

--
-- ACTION CREATE TABLE
--
CREATE TABLE "akun" (
    "id" bigserial PRIMARY KEY,
    "accId" bigint NOT NULL,
    "relatedId" bigint NOT NULL,
    "username" text NOT NULL,
    "email" text NOT NULL,
    "role" text NOT NULL,
    "password" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "broadcast" (
    "id" bigserial PRIMARY KEY,
    "idMessage" bigint NOT NULL,
    "pesan" text NOT NULL,
    "tujuan" bigint NOT NULL,
    "tanggalDibuat" timestamp without time zone NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "database_member" (
    "id" bigserial PRIMARY KEY,
    "idDbMember" bigint NOT NULL,
    "idMember" bigint NOT NULL,
    "ktp" text NOT NULL,
    "buktiPembayaran" json NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "informasi" (
    "id" bigserial PRIMARY KEY,
    "idInformasi" bigint NOT NULL,
    "tujuan" text NOT NULL,
    "tanggalDibuat" timestamp without time zone NOT NULL,
    "judul" text NOT NULL,
    "deskripsi" text NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "member" (
    "id" bigserial PRIMARY KEY,
    "idMember" bigint NOT NULL,
    "namaPelanggan" text NOT NULL,
    "noWhatsapp" text NOT NULL,
    "nik" text NOT NULL,
    "alamatKtp" text NOT NULL,
    "kelurahan" text NOT NULL,
    "kecamatan" text NOT NULL,
    "kabupaten" text NOT NULL,
    "provinsi" text NOT NULL,
    "status" text NOT NULL,
    "idSales" bigint NOT NULL
);

--
-- ACTION CREATE TABLE
--
CREATE TABLE "sales" (
    "id" bigserial PRIMARY KEY,
    "idSales" bigint NOT NULL,
    "namaSales" text NOT NULL,
    "nik" text NOT NULL,
    "noWhatsapp" text NOT NULL
);


--
-- MIGRATION VERSION FOR membership_app
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('membership_app', '20250113032931109', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20250113032931109', "timestamp" = now();

--
-- MIGRATION VERSION FOR serverpod
--
INSERT INTO "serverpod_migrations" ("module", "version", "timestamp")
    VALUES ('serverpod', '20240516151843329', now())
    ON CONFLICT ("module")
    DO UPDATE SET "version" = '20240516151843329', "timestamp" = now();


COMMIT;
