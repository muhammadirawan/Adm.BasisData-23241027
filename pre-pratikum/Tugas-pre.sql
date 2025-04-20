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

-- Tabel: Kategori_Ponsel
CREATE TABLE Kategori_Ponsel (
    Kategori VARCHAR(100) PRIMARY KEY,
    Penggunaan VARCHAR(100)
);

-- Tabel: Email
CREATE TABLE Email (
    Alamat_Email VARCHAR(100) PRIMARY KEY,
    Email VARCHAR(100)
);

-- Tabel: Karyawan
CREATE TABLE Karyawan (
    No_Tlpon_Karyawan VARCHAR(15) PRIMARY KEY,
    Tanggal_Lahir DATETIME
);

-- Tabel: Jaringan_Distribusi
CREATE TABLE Jaringan_Distribusi (
    No_Distribusi INTEGER PRIMARY KEY,
    Karyawan VARCHAR(100),
    Kode_Pabrik INTEGER,
    FOREIGN KEY (Kode_Pabrik) REFERENCES Pabrik(Kode_Pabrik)
);

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


