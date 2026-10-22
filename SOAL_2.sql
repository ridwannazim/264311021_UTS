-- CREATE
-- insert ke tabel pengguna
INSERT INTO pengguna (id_pengguna, id_alamat, nama, no_telepon, email, password, kota) VALUES
(1, NULL, 'adit', '081234567890', 'budi@gmail.com', 'budi_123', 'Madiun'),
(2, NULL, 'sopo',  '082345678901', 'siti@gmail.com', 'siti_456', 'Surabaya'),
(3, NULL, 'jarwo',  '083456789012', 'andi@gmail.com', 'andi_789', 'Malang');

-- insert ke tabel admin
INSERT INTO admin (id_admin, nama, email, password) VALUES
(1, 'Admin tahu', 'admin1@gmail.com', '_admin1'),
(2, 'Admin tempe', 'admin2@gmail.com', '_admin2'),
(3, 'Admin bakwan', 'admin3@gmail.com', '_admin3');

-- insert ke setoran
INSERT INTO setoran (id_setoran, id_pengguna, id_admin, tanggal_setoran, status_setoran, foto_bukti) VALUES
(1, 1, 1, '2026-10-20 09:15:00', 'disetujui',  'bukti_001.jpg'),
(2, 2, 2, '2026-10-21 13:30:00', 'menunggu', 'bukti_002.jpg'),
(3, 3, 3, '2026-10-22 08:45:00', 'ditolak', 'bukti_003.jpg');

-- READ
SELECT * FROM pengguna;
SELECT * FROM setoran;
SELECT * FROM setoran WHERE id_setoran = 1;

-- UPDATE
UPDATE setoran
SET status_setoran = 'diproses'
WHERE id_setoran = 2;

-- DELETE
DELETE FROM setoran
WHERE id_setoran = 3;
