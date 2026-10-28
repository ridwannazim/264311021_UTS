-tabel dompet
CREATE TABLE dompet (
  id_dompet    INT AUTO_INCREMENT PRIMARY KEY,
  id_pengguna  INT NOT NULL UNIQUE,
  saldo        DECIMAL(14,2) NOT NULL DEFAULT 0,
  CONSTRAINT fk_dompet_pengguna FOREIGN KEY (id_pengguna)
    REFERENCES pengguna(id_pengguna) ON DELETE CASCADE ON UPDATE CASCADE
);

-tabel penarikan
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
  CONSTRAINT fk_penarikan_pengguna FOREIGN KEY (id_pengguna)
    REFERENCES pengguna(id_pengguna) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_penarikan_admin FOREIGN KEY (id_admin)
    REFERENCES admin(id_admin) ON DELETE SET NULL ON UPDATE CASCADE
);

-tabel mutasi saldo
CREATE TABLE mutasi_saldo (
  id_mutasi     INT AUTO_INCREMENT PRIMARY KEY,
  id_dompet     INT NOT NULL,
  id_transaksi  INT NULL,
  id_penarikan  INT NULL,
  jenis_mutasi  VARCHAR(6) NOT NULL,
  nominal       DECIMAL(14,2) NOT NULL,
  waktu         DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  CONSTRAINT fk_mutasi_dompet FOREIGN KEY (id_dompet)
    REFERENCES dompet(id_dompet) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_mutasi_transaksi FOREIGN KEY (id_transaksi)
    REFERENCES transaksi(id_transaksi) ON DELETE RESTRICT ON UPDATE CASCADE,
  CONSTRAINT fk_mutasi_penarikan FOREIGN KEY (id_penarikan)
    REFERENCES penarikan(id_penarikan) ON DELETE RESTRICT ON UPDATE CASCADE
);
