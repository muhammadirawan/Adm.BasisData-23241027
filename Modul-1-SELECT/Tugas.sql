USE PonselDB;

-- Pabrik
SELECT p.Nama AS Nama_Pabrik FROM Pabrik p;
SELECT p.Kode_Pabrik AS ID_Pabrik, p.Lokasi_Produksi AS Lokasi_Pabrik FROM Pabrik p;

-- Kategori_Ponsel
SELECT kp.Kategori AS Jenis_Kategori FROM Kategori_Ponsel kp;
SELECT kp.Kategori AS Kategori, kp.Penggunaan AS Fungsi_Penggunaan FROM Kategori_Ponsel kp;

-- Email
SELECT e.Alamat_Email AS Email_Primary FROM Email e;
SELECT e.Alamat_Email AS Alamat, e.Email AS Email_Resmi FROM Email e;

-- Karyawan
SELECT k.No_Tlpon_Karyawan AS Nomor_Karyawan FROM Karyawan k;
SELECT k.No_Tlpon_Karyawan AS Nomor, k.Tanggal_Lahir AS Tgl_Lahir FROM Karyawan k;

-- Jaringan_Distribusi
SELECT jd.Karyawan AS Nama_Karyawan_Distribusi FROM Jaringan_Distribusi jd;
SELECT jd.No_Distribusi AS ID_Distribusi, jd.Karyawan AS Nama_Distributor FROM Jaringan_Distribusi jd;

-- Pelanggan
SELECT pl.Nama AS Nama_Pelanggan FROM Pelanggan pl;
SELECT pl.No_Telpon AS Nomor, pl.Nama AS Nama_Pembeli FROM Pelanggan pl;

-- Ponsel
SELECT po.Nama AS Nama_Ponsel FROM Ponsel po;
SELECT po.Nama AS Ponsel, po.Tahun_Rilis AS Rilis_Tahun FROM Ponsel po;

-- Beli
SELECT b.Garansi AS Masa_Garansi FROM Beli b;
SELECT b.kode_beli AS Kode, b.Tanggal_Pembelian AS Tgl_Beli FROM Beli b;

-- Email
SELECT e.Email AS Alamat_Resmi FROM Email e;
SELECT e.Alamat_Email AS Email_ID, e.Email AS Email_Pengguna FROM Email e;

-- Pabrik
SELECT p.Reputasi AS Tingkat_Reputasi FROM Pabrik p;
SELECT p.Sejarah_Produksi AS Sejarah, p.Reputasi AS Reputasi_Pabrik FROM Pabrik p;
