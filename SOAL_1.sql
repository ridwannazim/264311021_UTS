-- tabel pengguna
CREATE TABLE pengguna (
  id_pengguna INT NOT NULL AUTO_INCREMENT,
  nama        VARCHAR(100) NOT NULL,
  no_telepon  VARCHAR(20)  NULL,
  email       VARCHAR(100) NOT NULL,
  password    VARCHAR(255) NOT NULL,
  kota        VARCHAR(100) NULL,
  PRIMARY KEY (id_pengguna),
  UNIQUE KEY uq_pengguna_email (email),
  KEY idx_pengguna_alamat (id_alamat),
  CONSTRAINT fk_pengguna_alamat
    FOREIGN KEY (id_alamat) REFERENCES alamat (id_alamat)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;

-- tabel admin
CREATE TABLE admin (
  id_admin INT NOT NULL AUTO_INCREMENT,
  nama     VARCHAR(100) NOT NULL,
  email    VARCHAR(100) NOT NULL,
  password VARCHAR(255) NOT NULL,
  PRIMARY KEY (id_admin),
  UNIQUE KEY uq_admin_email (email)
) ENGINE=InnoDB;

-- tabel setoran
CREATE TABLE setoran (
  id_setoran      INT NOT NULL AUTO_INCREMENT,
  id_pengguna     INT NOT NULL,
  id_admin        INT NULL,
  tanggal_setoran DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  status_setoran  ENUM('menunggu','diproses','disetujui','ditolak') NOT NULL DEFAULT 'menunggu',
  foto_bukti      VARCHAR(255) NULL,
  PRIMARY KEY (id_setoran),
  KEY idx_setoran_pengguna (id_pengguna),
  KEY idx_setoran_admin (id_admin),
  CONSTRAINT fk_setoran_pengguna
    FOREIGN KEY (id_pengguna) REFERENCES pengguna (id_pengguna)
    ON UPDATE CASCADE ON DELETE RESTRICT,
  CONSTRAINT fk_setoran_admin
    FOREIGN KEY (id_admin) REFERENCES admin (id_admin)
    ON UPDATE CASCADE ON DELETE SET NULL
) ENGINE=InnoDB;
