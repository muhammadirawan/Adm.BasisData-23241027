-- Membuat database
CREATE DATABASE IF NOT EXISTS PonselDB;
USE PonselDB;

-- Tabel: Pabrik
CREATE TABLE Pabrik (
    Kode_Pabrik INTEGER PRIMARY KEY,
    Sejarah_Produksi VARCHAR(255),
    Reputasi VARCHAR(100),
    Nama VARCHAR(100),
    Lokasi_Produksi VARCHAR(100)
);
INSERT INTO Pabrik VALUES 
(1, 'Produksi sejak 1990', 'Baik', 'PT Ponsel Canggih', 'Jakarta'),
(2, 'Didirikan tahun 2005', 'Sangat Baik', 'PT Gadget Modern', 'Bandung'),
(3, 'Produksi global', 'Cukup', 'PT Mobile Indotech', 'Surabaya');

-- Tabel: Kategori_Ponsel
CREATE TABLE Kategori_Ponsel (
    Kategori VARCHAR(100) PRIMARY KEY,
    Penggunaan VARCHAR(100)
);
INSERT INTO Kategori_Ponsel VALUES 
('Gaming', 'Untuk bermain game'),
('Photography', 'Untuk fotografi berkualitas'),
('Business', 'Untuk pekerjaan dan bisnis'),
('Budget', 'Untuk penggunaan sehari-hari');

-- Tabel: Email
CREATE TABLE Email (
    Alamat_Email VARCHAR(100) PRIMARY KEY,
    Email VARCHAR(100)
);
INSERT INTO Email VALUES 
('agus@mail.com', 'agus@mail.com'),
('rani@domain.com', 'rani@domain.com'),
('doni@contoh.com', 'doni@contoh.com');

-- Tabel: Karyawan
CREATE TABLE Karyawan (
    No_Tlpon_Karyawan VARCHAR(15) PRIMARY KEY,
    Tanggal_Lahir DATETIME
);
INSERT INTO Karyawan VALUES 
('081234567890', '1990-05-10'),
('082345678901', '1985-03-22'),
('083456789012', '1992-11-01');

-- Tabel: Jaringan_Distribusi
CREATE TABLE Jaringan_Distribusi (
    No_Distribusi INTEGER PRIMARY KEY,
    Karyawan VARCHAR(100),
    Kode_Pabrik INTEGER,
    FOREIGN KEY (Kode_Pabrik) REFERENCES Pabrik(Kode_Pabrik)
);
INSERT INTO Jaringan_Distribusi VALUES 
(1001, 'Budi', 1),
(1002, 'Santi', 2),
(1003, 'Raka', 3);

-- Tabel: Pelanggan
CREATE TABLE Pelanggan (
    No_Telpon VARCHAR(15) PRIMARY KEY,
    Jenis_Kelamin BOOLEAN,
    Tanggal_Lahir DATETIME,
    Alamat_Email VARCHAR(100),
    Nama VARCHAR(100),
    Alamat VARCHAR(200),
    FOREIGN KEY (Alamat_Email) REFERENCES Email(Alamat_Email)
);
INSERT INTO Pelanggan VALUES 
('089876543210', 1, '1998-07-21', 'agus@mail.com', 'Agus Santoso', 'Jl. Merdeka No.10'),
('088765432109', 0, '1995-12-11', 'rani@domain.com', 'Rani Wijaya', 'Jl. Sudirman No.20'),
('087654321098', 1, '2000-03-15', 'doni@contoh.com', 'Doni Saputra', 'Jl. Diponegoro No.5');

-- Tabel: Ponsel
CREATE TABLE Ponsel (
    Spesifikasi VARCHAR(255) PRIMARY KEY,
    Tahun_Rilis INTEGER,
    Nama VARCHAR(100),
    Kategori VARCHAR(100),
    Kode_Pabrik INTEGER,
    FOREIGN KEY (Kode_Pabrik) REFERENCES Pabrik(Kode_Pabrik),
    FOREIGN KEY (Kategori) REFERENCES Kategori_Ponsel(Kategori)
);
INSERT INTO Ponsel VALUES 
('Snapdragon 888, 8GB RAM, 128GB', 2023, 'Phone X1', 'Gaming', 1),
('Mediatek Helio G95, 6GB RAM, 64GB', 2022, 'Phone C2', 'Budget', 2),
('Exynos 2100, 12GB RAM, 256GB', 2023, 'Galaxy Ultra', 'Photography', 3);

-- Tabel: Beli
CREATE TABLE Beli (
    kode_beli INTEGER PRIMARY KEY,
    No_Tlpon_Pelanggan VARCHAR(15), 
    Spesifikasi VARCHAR(255),
    Tanggal_Pembelian DATETIME,
    Tanggal_Pengambilan DATETIME,
    Garansi VARCHAR(50),
    No_Tlpon_Karyawan VARCHAR(15),
    FOREIGN KEY (No_Tlpon_Pelanggan) REFERENCES Pelanggan(No_Telpon),
    FOREIGN KEY (Spesifikasi) REFERENCES Ponsel(Spesifikasi),
    FOREIGN KEY (No_Tlpon_Karyawan) REFERENCES Karyawan(No_Tlpon_Karyawan)
);
INSERT INTO Beli VALUES 
(501, '089876543210', 'Snapdragon 888, 8GB RAM, 128GB', '2024-01-10', '2024-01-12', '1 Tahun', '081234567890'),
(502, '088765432109', 'Mediatek Helio G95, 6GB RAM, 64GB', '2024-02-05', '2024-02-07', '6 Bulan', '082345678901'),
(503, '087654321098', 'Exynos 2100, 12GB RAM, 256GB', '2024-03-01', '2024-03-03', '1 Tahun', '083456789012');
