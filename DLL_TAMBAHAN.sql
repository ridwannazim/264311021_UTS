-TABEL dompet
CREATE TABLE dompet (
  id_dompet    INT AUTO_INCREMENT PRIMARY KEY,
  id_pengguna  INT NOT NULL UNIQUE,
  saldo        DECIMAL(14,2) NOT NULL DEFAULT 0,
);

-TABEL penarikan
CREATE TABLE penarikan (
  id_penarikan        INT AUTO_INCREMENT PRIMARY KEY,
  id_pengguna         INT NOT NULL,
  id_admin            INT NULL,
  jumlah              DECIMAL(14,2) NOT NULL,
  metode_tujuan       VARCHAR(20) NOT NULL,
  no_rekening_tujuan  VARCHAR(40) NOT NULL,
  status_penarikan    VARCHAR(15) NOT NULL DEFAULT 'diajukan',
  tanggal_pengajuan   DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  tanggal_verifikasi  DATETIME NULL,
  catatan             VARCHAR(255) NULL,
);

-TABEL mutasi_saldo
CREATE TABLE mutasi_saldo (
  id_mutasi     INT AUTO_INCREMENT PRIMARY KEY,
  id_dompet     INT NOT NULL,
  id_transaksi  INT NULL,
  id_penarikan  INT NULL,
  jenis_mutasi  VARCHAR(6) NOT NULL,
  nominal       DECIMAL(14,2) NOT NULL,
  waktu         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
);
