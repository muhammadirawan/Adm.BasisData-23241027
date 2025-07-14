-- Nama        : Muhammad Irawan
-- NIM         : 23241027
-- Kelas       : A
-- Mata Kuliah : ABD

-- Soal 1 
/* Munculkan Kode pelanggan, nama produk, kuantitinya, harga dan total harga dari semua produk
yang pernah ditransaksikan namun, outputnya yang berdasrkan total harganya*/

SELECT p.kode_pelanggan,
pr.nama_produk,
t.qty,pr.harga,
(t.qty * pr.harga) AS total_harga
FROM tr_penjualan_dqlab t
JOIN ms_pelanggan_dqlab p ON t.kode_pelanggan = p.kode_pelanggan
JOIN ms_produk_dqlab pr ON t.kode_produk = pr.kode_produk
ORDER BY total_harga DESC;


-- Soal 2 
/*Tampilkan nama pelanggan dan nilai transaksinya dengan nilai tarnsaksi terbanyak */

SELECT p.nama_pelanggan,SUM(t.qty * pr.harga) AS total_transaksi
FROM tr_penjualan_dqlab t
JOIN ms_pelanggan_dqlab p ON t.kode_pelanggan = p.kode_pelanggan
JOIN ms_produk_dqlab pr ON t.kode_produk = pr.kode_produk
GROUP BY p.nama_pelanggan
ORDER BY total_transaksi DESC;

-- Soal 3 
/*Tampilkan nama produk, kategori, dan harga dari produk yang tidak pernah terjual*/

SELECT 
    pr.nama_produk,
    pr.kategori_produk,
    pr.harga
FROM 
    ms_produk_dqlab pr
LEFT JOIN 
    tr_penjualan_dqlab t ON pr.kode_produk = t.kode_produk
WHERE 
    t.kode_produk IS NULL;



