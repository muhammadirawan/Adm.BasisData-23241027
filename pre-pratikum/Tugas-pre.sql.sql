-- Membuat database
CREATE DATABASE IF NOT EXISTS PonselDB;
USE PonselDB;

-- Tabel: Pabrik
CREATE TABLE Pabrik (
    Sejarah_Produksi TEXT PRIMARY KEY,
    Reputasi VARCHAR(100),
    No_Distribusi INTEGER,
    Nama VARCHAR(100),
    Lokasi_Produksi VARCHAR(100)
);

-- Tabel: Jaringan_Distribusi
CREATE TABLE Jaringan_Distribusi (
    No_Distribusi INTEGER,
    Karyawan VARCHAR(100),
    FOREIGN KEY (No_Distribusi) REFERENCES Pabrik(No_Distribusi)
);

-- Tabel: Kategori_Ponsel
CREATE TABLE Kategori_Ponsel (
    Kategori VARCHAR(100) PRIMARY KEY,
    Penggunaan VARCHAR(100)
);

-- Tabel: Ponsel
CREATE TABLE Ponsel (
    Spesifikasi TEXT PRIMARY KEY,
    Tahun_Rilis INTEGER,
    Nama VARCHAR(100),
    Kategori VARCHAR(100),
    Sejarah_Produksi TEXT,
    FOREIGN KEY (Sejarah_Produksi) REFERENCES Pabrik(Sejarah_Produksi),
    FOREIGN KEY (Kategori) REFERENCES Kategori_Ponsel(Kategori)
);

-- Tabel: Karyawan
CREATE TABLE Karyawan (
    No_Tlpon_Karyawan INTEGER PRIMARY KEY,
    Tanggal_Lahir DATETIME
);

-- Tabel: Beli
CREATE TABLE Beli (
    No_Tlpon_Pelanggan INTEGER,
    Spesifikasi TEXT,
    Tanggal_Pembelian DATETIME,
    Tanggal_Pengambilan DATETIME,
    Garansi VARCHAR(50),
    No_Tlpon_Karyawan INTEGER,
    FOREIGN KEY (No_Tlpon_Pelanggan) REFERENCES Pelanggan(No_Telpon),
    FOREIGN KEY (Spesifikasi) REFERENCES Ponsel(Spesifikasi),
    FOREIGN KEY (No_Tlpon_Karyawan) REFERENCES Karyawan(No_Tlpon_Karyawan)
);

-- Tabel: Email
CREATE TABLE Email (
    Alamat_Email VARCHAR(100) PRIMARY KEY,
    Email VARCHAR(100)
);

-- Tabel: Pelanggan
CREATE TABLE Pelanggan (
    No_Telpon INTEGER PRIMARY KEY,
    Jenis_Kelamin BOOLEAN,
    Tanggal_Lahir DATETIME,
    Alamat_Email VARCHAR(100),
    Nama VARCHAR(100),
    Alamat VARCHAR(200),
    FOREIGN KEY (Alamat_Email) REFERENCES Email(Alamat_Email)
);
