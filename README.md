# RSN Membership Web App

Sistem manajemen keanggotaan berbasis web menggunakan **Serverpod** sebagai backend dan **Jaspr** sebagai frontend. Sistem ini memiliki role **Admin**, **Sales**, dan **Member**, serta role **Superadmin**.

---

## Teknologi yang Digunakan
- **Backend**: [Serverpod](https://serverpod.dev)
- **Frontend**: [Jaspr](https://jaspr.dev)
- **Database**: PostgreSQL

---

## Struktur Proyek

```plaintext
project/
├── membership_app_server/     # Backend (Serverpod)
├── membership_app_client/     # Client API untuk backend
├── frontend/                  # Frontend (Jaspr)
```

## Setup Proyek
### Instalasi Awal
- Jaspr
```bash
dart pub global activate jaspr
```
- Serverpod
```bash
dart pub global activate serverpod
```
- PostgreSQL

Inisialisasi Database PostgreSQL

### Konfigurasi Backend
1. Masuk ke folder backend
```bash
cd membership_app_server
```
2. Perbarui konfigurasi pada file config/development.yaml sesuai database yang dibuat 
```bash
# contoh
database:
  host: localhost
  port: 5432
  name: rsn_membership
  user: postgres
  password: your_password
```
3. Jika ada perubahan yang dilakukan, lakukan generate kode serverpod
```bash
serverpod generate
```
```bash
# Jika ada perubahan pada model database di lib/src/models

serverpod create-migration 
```
4. Aktivasi server backend
```bash
dart bin/main.dart
```
```bash
# Jika ingin sekaligus migrasi database
dart bin/main.dart --apply-migrations
```
### Konfigurasi Frontend
1. Masuk ke folder frontend
```bash
cd frontend
```
2. Instalasi dependensi
```bash
dart pub get
```
3. Aktivasi server frontend
```bash
# Sesuaikan dengan port yang terbuka
jaspr serve --port 8083
```
4. Masuk ke tampilan frontend melalui http://localhost:8083/login, saat ini belum ada autentikasi, masuk pada halaman login :
- Sisi admin (desktop web) : user admin, pass admin123
- Sisi member (mobile web) : user member, pass member123
- Sisi sales (mobile web) : user sales, pass sales123
- Untuk member dan sales, ubah settingan developer tools (F12) di browser agar menjadi tampilan mobile


### Progress
1. Frontend
- Admin : Sudah sesuai desain UI
- Member : Missing halaman untuk detail informasi
- Sales : Missing halaman untuk detail informasi
- Superadmin : Belum ada menu untuk atur role, desain UI belum ada

2. Backend
- Admin : Menu informasi sudah terintegrasi, progress pada menu member
