SELECT
  p.id_pengguna,
  p.nama,
  p.kota,
  COUNT(s.id_setoran) AS total_setoran_selesai
FROM pengguna AS p
INNER JOIN setoran AS s
  ON p.id_pengguna = s.id_pengguna
WHERE s.status_setoran = 'disetujui'
GROUP BY p.id_pengguna, p.nama, p.kota;
