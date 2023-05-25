-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 08, 2022 at 01:13 AM
-- Server version: 10.4.22-MariaDB
-- PHP Version: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tokocamera`
--
CREATE DATABASE IF NOT EXISTS `tokocamera` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `tokocamera`;

-- --------------------------------------------------------

--
-- Table structure for table `detail_transaksi`
--

CREATE TABLE `detail_transaksi` (
  `id_detail_transaksi` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `qty` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `detail_transaksi`
--

INSERT INTO `detail_transaksi` (`id_detail_transaksi`, `id_transaksi`, `id_produk`, `qty`) VALUES
(1, 1, 10, 1),
(2, 2, 2, 1),
(3, 2, 8, 1),
(4, 3, 2, 2),
(5, 3, 4, 1),
(6, 3, 10, 1),
(7, 4, 5, 1),
(8, 5, 2, 1),
(9, 6, 2, 1),
(10, 7, 1, 1),
(11, 8, 2, 1),
(12, 8, 2, 1),
(13, 9, 2, 1),
(14, 10, 1, 1),
(15, 11, 2, 1),
(16, 12, 11, 1),
(17, 13, 1, 1),
(18, 14, 1, 1),
(19, 15, 1, 1),
(20, 16, 1, 1),
(22, 17, 2, 1),
(23, 18, 1, 1),
(24, 18, 3, 1),
(25, 19, 1, 1),
(26, 19, 2, 1),
(27, 19, 3, 1),
(28, 20, 1, 1),
(29, 20, 2, 1),
(30, 21, 4, 1),
(31, 23, 1, 5),
(32, 24, 2, 7),
(33, 25, 3, 4),
(34, 25, 3, 1),
(35, 26, 10, 1),
(36, 27, 2, 1),
(37, 27, 6, 1),
(38, 28, 1, 1),
(39, 28, 3, 1),
(40, 29, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(11) NOT NULL,
  `nama_produk` varchar(100) NOT NULL,
  `deskripsi` text NOT NULL,
  `harga` int(15) NOT NULL,
  `foto` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `nama_produk`, `deskripsi`, `harga`, `foto`) VALUES
(1, 'Pentax K1000', '1976, Japan/China', 3899000, '1.  Pentax_K1000.jpg'),
(2, 'Nikon F3', '1980, Japan', 11474000, '2.  Nikon_F3.jpg'),
(3, 'Olympus Trip 300', '1996, Japan', 2579000, '3. Olympus_Trip_300.jpg'),
(4, 'Pentax Espio 80', '1992, Japan', 3899000, '4.  Pentax_Espio_80.jpg'),
(5, 'Pentax Espio 115G', '1992, Japan', 3539000, '5.  Pentax_Espio_115G.jpg'),
(6, 'Pentax Espio 145M', '2002, Japan', 3299000, '6.  Pentax_Espio_145M.jpg'),
(7, 'Olympus XA2', '1980, Japan', 2579000, '7.  Olympus_XA2.jpg'),
(8, 'Olympus Stylus, Silver', '1991, Japan', 2219000, '8.  Olympus_Stylus_Zoom_silver.jpg'),
(9, 'Olympus Stylus Zoom, Black', '1991, Japan', 2519000, '9.  Olympus_Stylus_Zoom_black.jpg'),
(10, 'Polaroid SX-70 : OneStep', '1981, USA', 1199000, '10.  Polaroid_SX-70.jpg'),
(11, 'Polaroid SX-70 : The Button', '1981, USA', 1079000, '11.  Polaroid_SX-70_Button.jpg'),
(12, 'Polaroid 600 : Supercolor', '1988, USA', 1559000, '12.  Polaroid_600.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `produk_sampai`
--

CREATE TABLE `produk_sampai` (
  `id_produk_sampai` int(11) NOT NULL,
  `id_transaksi` int(11) NOT NULL,
  `tgl_sampai` date NOT NULL,
  `denda` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `produk_sampai`
--

INSERT INTO `produk_sampai` (`id_produk_sampai`, `id_transaksi`, `tgl_sampai`, `denda`) VALUES
(1, 3, '2022-09-27', 0),
(2, 4, '2022-09-27', 0),
(3, 5, '2022-09-27', 0),
(4, 6, '2022-09-27', 0),
(5, 7, '2022-10-04', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id_transaksi` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `tgl_transaksi` date NOT NULL,
  `tgl_sampai` date NOT NULL,
  `status` enum('menunggu dikonfirm','barang sudah di konfirm','produk sedang dikemas','produk sedang dikirim','produk telah diterima') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id_transaksi`, `id_user`, `tgl_transaksi`, `tgl_sampai`, `status`) VALUES
(1, 2, '2022-09-18', '2022-09-23', 'produk telah diterima'),
(2, 3, '2022-09-18', '2022-09-23', 'produk telah diterima'),
(3, 2, '2022-09-18', '2022-09-23', 'produk telah diterima'),
(4, 2, '2022-09-27', '2022-10-02', 'produk telah diterima'),
(5, 2, '2022-09-27', '2022-10-02', 'produk telah diterima'),
(6, 2, '2022-09-27', '2022-10-02', 'produk telah diterima'),
(7, 2, '2022-10-04', '2022-10-09', 'produk telah diterima'),
(8, 3, '2022-10-04', '2022-10-09', 'produk telah diterima'),
(9, 2, '2022-10-04', '2022-10-09', 'produk telah diterima'),
(10, 2, '2022-10-05', '2022-10-10', 'produk telah diterima'),
(11, 2, '2022-10-05', '2022-10-10', 'produk telah diterima'),
(12, 2, '2022-10-05', '2022-10-10', 'produk telah diterima'),
(13, 2, '2022-10-24', '2022-10-29', 'produk telah diterima'),
(14, 2, '2022-10-24', '2022-10-29', 'produk telah diterima'),
(15, 2, '2022-10-24', '2022-10-29', 'produk telah diterima'),
(16, 2, '2022-10-24', '2022-10-29', 'produk telah diterima'),
(17, 2, '2022-10-24', '2022-10-29', 'produk telah diterima'),
(19, 2, '2022-10-25', '2022-10-30', 'menunggu dikonfirm'),
(20, 2, '2022-10-25', '2022-10-30', 'menunggu dikonfirm'),
(21, 2, '2022-10-25', '2022-10-30', 'menunggu dikonfirm'),
(23, 2, '2022-10-25', '2022-10-30', 'menunggu dikonfirm'),
(24, 2, '2022-10-25', '2022-10-30', 'menunggu dikonfirm'),
(25, 2, '2022-10-25', '2022-10-30', 'menunggu dikonfirm'),
(26, 2, '2022-10-26', '2022-10-31', 'produk telah diterima'),
(27, 2, '2022-10-26', '2022-10-31', 'produk telah diterima'),
(28, 2, '2022-10-27', '2022-11-01', 'menunggu dikonfirm'),
(29, 2, '2022-10-27', '2022-11-01', 'menunggu dikonfirm');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `nama_user` varchar(100) NOT NULL,
  `username` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `level` varchar(100) NOT NULL,
  `alamat` text NOT NULL,
  `telp` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `username`, `password`, `level`, `alamat`, `telp`) VALUES
(1, 'M. Irza Dwi Pahlevi', 'Hieroic', '123', 'petugas', 'Jember', '082222'),
(2, 'Alif F H kece', 'alif', '123', 'pelanggan', 'Pasuruan', '0856789'),
(3, 'Rafano p', 'rafano', '123', 'pelanggan', 'Blitar', '0899922'),
(9, 'dreamer', 'dreamer', '123', 'petugas', 'jember', '085678933344444445'),
(10, 'abid', 'abid', '123', 'pelanggan', 'malang', '0896456789'),
(11, 'ipul', 'ipul', '123', 'pelanggan', 'nganjuk', '0891234567');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  ADD PRIMARY KEY (`id_detail_transaksi`),
  ADD KEY `id_pembelian_produk` (`id_transaksi`),
  ADD KEY `id_produk` (`id_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `produk_sampai`
--
ALTER TABLE `produk_sampai`
  ADD PRIMARY KEY (`id_produk_sampai`),
  ADD KEY `id_pembelian_produk` (`id_transaksi`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id_transaksi`),
  ADD KEY `id_petugas` (`id_user`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `detail_transaksi`
--
ALTER TABLE `detail_transaksi`
  MODIFY `id_detail_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `produk_sampai`
--
ALTER TABLE `produk_sampai`
  MODIFY `id_produk_sampai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id_transaksi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
