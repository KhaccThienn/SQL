-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 14, 2022 at 09:37 AM
-- Server version: 10.4.25-MariaDB
-- PHP Version: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `qlsv`
--

-- --------------------------------------------------------

--
-- Table structure for table `dm_khoa`
--

CREATE TABLE `dm_khoa` (
  `MaKH` varchar(6) NOT NULL,
  `TenKhoa` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `dm_khoa`
--

INSERT INTO `dm_khoa` (`MaKH`, `TenKhoa`) VALUES
('AV', 'Anh Văn'),
('TH', 'Tin Học'),
('TR', 'Triết Học'),
('VT', 'Vật Lý');

-- --------------------------------------------------------

--
-- Table structure for table `ketqua`
--

CREATE TABLE `ketqua` (
  `MaSV` varchar(6) NOT NULL,
  `MaMH` varchar(6) NOT NULL,
  `Diem` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `ketqua`
--

INSERT INTO `ketqua` (`MaSV`, `MaMH`, `Diem`) VALUES
('A01', '01', 2.5),
('A01', '03', 7),
('A02', '01', 5.5),
('A02', '05', 9),
('A03', '01', 5.5),
('A03', '03', 3),
('B01', '02', 6),
('B01', '03', 3),
('B02', '01', 7),
('B02', '04', 10),
('B03', '03', 6);

-- --------------------------------------------------------

--
-- Table structure for table `monhoc`
--

CREATE TABLE `monhoc` (
  `MaMH` varchar(6) NOT NULL,
  `TenMH` varchar(50) NOT NULL,
  `SoTiet` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `monhoc`
--

INSERT INTO `monhoc` (`MaMH`, `TenMH`, `SoTiet`) VALUES
('01', 'Cơ Sở Dữ Liệu', 45),
('02', 'Trí Tuệ Nhân Tạo', 45),
('03', 'Truyền Tin', 45),
('04', 'Đồ Họa', 60),
('05', 'Văn Phạm', 60),
('06', 'Đàm Thoại', 60);

-- --------------------------------------------------------

--
-- Table structure for table `sinhvien`
--

CREATE TABLE `sinhvien` (
  `MaSV` varchar(6) NOT NULL,
  `HoSV` varchar(30) NOT NULL,
  `TenSV` varchar(15) NOT NULL,
  `GioiTinh` tinyint(4) DEFAULT 1,
  `NgaySinh` date DEFAULT NULL,
  `NoiSinh` varchar(50) DEFAULT NULL,
  `DiaChi` varchar(50) DEFAULT NULL,
  `MaKH` varchar(6) DEFAULT NULL,
  `HocBong` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sinhvien`
--

INSERT INTO `sinhvien` (`MaSV`, `HoSV`, `TenSV`, `GioiTinh`, `NgaySinh`, `NoiSinh`, `DiaChi`, `MaKH`, `HocBong`) VALUES
('A01', 'Nguyễn Thị', 'Hải', 0, '1977-02-23', 'Sài Gòn', '12B Võ Văn Tần', 'TH', 60000),
('A02', 'Trần Văn', 'Chinh', 1, '1977-12-24', 'Sài Gòn', '34 Nguyễn Bỉnh Khiêm', 'TH', 1250000),
('A03', 'Lê Bạch', 'Yến', 0, '1996-02-21', 'Hà Nội', '765 Pasteur', 'TH', 1450000),
('B01', 'Trần Thanh', 'Mai', 0, '1977-08-12', 'Bến Tre', '32 Lê Lai', 'TH', 50000),
('B02', 'Trần Thu', 'Thủy', 0, '1977-01-01', 'Sài Gòn', '45 Nguyễn Thái Sơn', 'TH', 50000),
('B03', 'Lê Thị', 'Thanh', 0, '1975-01-01', 'Sài Gòn', '345 Nguyễn Kiệm', 'AV', 0),
('B04', 'Trần Trọng', 'Kim', 1, '1977-12-20', 'Sài Gòn', '123 Lê Văn Sỹ', 'AV', 120000),
('C01', 'Tào Hồng', 'Thiên', 1, '1978-07-01', 'Sài Gòn', '56 Hoàng Diệu', 'TH', 50000),
('C02', 'Hoàng Minh', 'Châu', 1, '1976-05-03', 'Sài Gòn', '102 Kỳ Đồng', 'AV', 0),
('C03', 'Phan Quỳnh', 'Hương', 0, '1979-05-05', 'Sài Gòn', '234 Phạm Văn Hai', 'AV', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `dm_khoa`
--
ALTER TABLE `dm_khoa`
  ADD PRIMARY KEY (`MaKH`);

--
-- Indexes for table `ketqua`
--
ALTER TABLE `ketqua`
  ADD PRIMARY KEY (`MaSV`,`MaMH`),
  ADD KEY `MaMH` (`MaMH`);

--
-- Indexes for table `monhoc`
--
ALTER TABLE `monhoc`
  ADD PRIMARY KEY (`MaMH`);

--
-- Indexes for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD PRIMARY KEY (`MaSV`),
  ADD KEY `MaKH` (`MaKH`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ketqua`
--
ALTER TABLE `ketqua`
  ADD CONSTRAINT `ketqua_ibfk_1` FOREIGN KEY (`MaSV`) REFERENCES `sinhvien` (`MaSV`),
  ADD CONSTRAINT `ketqua_ibfk_2` FOREIGN KEY (`MaMH`) REFERENCES `monhoc` (`MaMH`);

--
-- Constraints for table `sinhvien`
--
ALTER TABLE `sinhvien`
  ADD CONSTRAINT `sinhvien_ibfk_1` FOREIGN KEY (`MaKH`) REFERENCES `dm_khoa` (`MaKH`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
