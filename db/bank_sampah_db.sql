-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jul 25, 2020 at 07:49 AM
-- Server version: 10.4.11-MariaDB
-- PHP Version: 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bank_sampah_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(15) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `berat` varchar(20) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `no_rekening` varchar(100) NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `nasabah`
--

CREATE TABLE `nasabah` (
  `id` int(100) NOT NULL,
  `no_rekening` varchar(100) NOT NULL,
  `nama` text NOT NULL,
  `alamat` text NOT NULL,
  `no_hp` text NOT NULL,
  `tgl` date NOT NULL DEFAULT current_timestamp(),
  `saldo` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `nasabah`
--

INSERT INTO `nasabah` (`id`, `no_rekening`, `nama`, `alamat`, `no_hp`, `tgl`, `saldo`) VALUES
(17, 'NB2006120001', 'Arfi', 'TEgal', '123', '2020-06-12', '1100'),
(18, 'NB2006120002', 'Nanda', 'TEGAL', '1234', '2020-06-12', '65500'),
(19, 'NB2007110001', 'Rian', 'Banjaranyar', '81223', '2020-07-11', '10000'),
(20, 'NB2007110002', 'Mia', 'Margasari', '085222', '2020-07-11', '0');

-- --------------------------------------------------------

--
-- Table structure for table `sampah`
--

CREATE TABLE `sampah` (
  `id` int(15) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `harga` int(20) NOT NULL,
  `keterangan` text NOT NULL,
  `qty` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sampah`
--

INSERT INTO `sampah` (`id`, `kategori`, `harga`, `keterangan`, `qty`) VALUES
(1, 'Kaca', 4500, 'Botol,Kaca,Cermin', 12),
(2, 'Besi', 3000, 'Seng,Besi', 9),
(3, 'Plastik', 1500, 'Gelas,botol', 15),
(7, 'Kardus', 1500, 'Kardus,Kertas,Buku', 14),
(8, 'Kertas', 5000, 'Koran, Buku', 0);

-- --------------------------------------------------------

--
-- Table structure for table `transaksi`
--

CREATE TABLE `transaksi` (
  `id` int(100) NOT NULL,
  `no_rek` varchar(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `ket` int(10) NOT NULL,
  `tgl` date NOT NULL DEFAULT current_timestamp(),
  `bulan` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi`
--

INSERT INTO `transaksi` (`id`, `no_rek`, `invoice`, `total`, `ket`, `tgl`, `bulan`) VALUES
(153, 'NB2006120001', 'IN2006120001', '10500', 1, '2020-06-12', 'Juni 2020'),
(155, 'Admin', 'IN2006120003', '15000', 3, '2020-06-12', 'Juni 2020'),
(160, 'NB2006120001', 'IN2006120007', '3000', 2, '2020-06-12', 'Juni 2020'),
(163, 'NB2006120001', 'IN2007040001', '5400', 2, '2020-07-04', 'Juli 2020'),
(164, 'NB2006120002', 'IN2007040002', '22500', 1, '2020-07-04', 'Juli 2020'),
(165, 'Admin', 'IN2007040003', '15000', 3, '2020-07-04', 'Juli 2020'),
(166, 'NB2006120001', 'IN2007040004', '500', 2, '2020-07-04', 'Juli 2020'),
(167, 'NB2007110001', 'IN2007130001', '15000', 1, '2020-07-13', 'Juli 2020'),
(168, 'NB2007110001', 'IN2007130002', '5000', 2, '2020-07-13', 'Juli 2020'),
(169, 'Admin', 'IN2007130003', '35000', 3, '2020-07-13', 'Juli 2020');

-- --------------------------------------------------------

--
-- Table structure for table `transaksi_detail`
--

CREATE TABLE `transaksi_detail` (
  `id` int(100) NOT NULL,
  `invoice` varchar(100) NOT NULL,
  `kategori` varchar(100) NOT NULL,
  `berat` varchar(100) NOT NULL,
  `harga` varchar(100) NOT NULL,
  `total` varchar(100) NOT NULL,
  `tgl` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `transaksi_detail`
--

INSERT INTO `transaksi_detail` (`id`, `invoice`, `kategori`, `berat`, `harga`, `total`, `tgl`) VALUES
(62, 'IN2006120001', 'Plastik', '3', '1500', '4500', '2020-06-12 17:14:06'),
(63, 'IN2006120001', 'Besi', '2', '3000', '6000', '2020-06-12 17:14:06'),
(66, 'IN2006120003', 'Kaca', '3', '5000', '15000', '2020-06-12 17:38:27'),
(69, 'IN2007040002', 'Kaca', '5', '4500', '22500', '2020-07-04 15:12:38'),
(70, 'IN2007040003', 'Kaca', '3', '5000', '15000', '2020-07-04 15:13:23'),
(71, 'IN2007130001', 'Besi', '2', '3000', '6000', '2020-07-13 08:46:28'),
(72, 'IN2007130001', 'Besi', '3', '3000', '9000', '2020-07-13 08:46:28'),
(73, 'IN2007130003', 'Besi', '5', '7000', '35000', '2020-07-13 08:55:52');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `email` text CHARACTER SET latin1 DEFAULT NULL,
  `image` text CHARACTER SET latin1 DEFAULT NULL,
  `password` text CHARACTER SET latin1 DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `name` text CHARACTER SET latin1 DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `createdDate` date DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `image`, `password`, `level`, `name`, `status`, `createdDate`) VALUES
(29, 'superadmin@gmail.com', 'default.jpg', '$2y$10$4Sr8xVCzqFAvTVh7NtmYb.x5GqY4pWG4GwcAsVrUnFPY9F3zG7AZi', 1, 'Super Admin', 1, '2020-05-01'),
(37, 'arfirizki42@gmail.com', 'default.jpg', 'fc0805dbd7502a6f30fec0bfc4bbac3f', 3, 'Arfi', 1, '0000-00-00'),
(38, 'NB2006020001', 'default.jpg', '89a9064e15c552ac4a09a824188de108', 2, 'Arfi', 1, '2020-06-02'),
(39, 'NB2006080001', 'default.jpg', 'f1ea43a0cfb86e960ac9794f5064131c', 2, 'Nanda', 1, '2020-06-08'),
(40, 'NB2006120001', 'default.jpg', 'cdbde5d88227386b99db67f71e0bc713', 2, 'Arfi', 1, '2020-06-12'),
(41, 'NB2006120002', 'default.jpg', 'be187cba08e85e013f5a64ac8d5fc09c', 2, 'Nanda', 1, '2020-06-12'),
(42, 'arfirizki56@gmail.com', 'default.jpg', '$2y$10$jDkirj684pGbDLYLSjg7XuPAmt.Vb8jWzk7cLNRw/Eq50tl3VbU8W', 2, 'Arfi RA', 1, '0000-00-00'),
(43, 'mia@gmail.com', 'default.jpg', '$2y$10$rvEVjG0ezTwcFkXXZMHt2.PmkfA1zdRZA4hjgUW3PQMHDh6yilb9m', 2, 'mia', 1, '0000-00-00'),
(44, 'NB2007110001', 'default.jpg', '1aae8910aaff334d9b20c698fff2173a', 2, 'ARLAN', 1, '2020-07-11'),
(45, 'NB2007110002', 'default.jpg', '72b3b09db96f9b75633cf02d2e7f4ad2', 2, 'Mia', 1, '2020-07-11');

-- --------------------------------------------------------

--
-- Table structure for table `user_access_menu`
--

CREATE TABLE `user_access_menu` (
  `id` int(11) NOT NULL,
  `level` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access_menu`
--

INSERT INTO `user_access_menu` (`id`, `level`, `menu_id`) VALUES
(1, 1, 1),
(10, 1, 3),
(12, 1, 2),
(13, 1, 7),
(14, 1, 8),
(15, 1, 9),
(17, 1, 11),
(18, 1, 10),
(19, 2, 11),
(20, 5, 2),
(21, 5, 11),
(22, 5, 7),
(23, 6, 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id` int(11) NOT NULL,
  `menu` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id`, `menu`) VALUES
(1, 'Admin'),
(2, 'User'),
(3, 'Menu'),
(7, 'Transaksi'),
(9, 'Laporan'),
(10, 'Kelola Sampah'),
(11, 'Nasabah');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id` int(11) NOT NULL,
  `role` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id`, `role`) VALUES
(1, 'Administrator'),
(5, 'Operator'),
(6, 'Nasabah');

-- --------------------------------------------------------

--
-- Table structure for table `user_sub_menu`
--

CREATE TABLE `user_sub_menu` (
  `id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL,
  `title` text NOT NULL,
  `url` text NOT NULL,
  `icon` text NOT NULL,
  `is_active` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_sub_menu`
--

INSERT INTO `user_sub_menu` (`id`, `menu_id`, `title`, `url`, `icon`, `is_active`) VALUES
(1, 1, 'Dashboard', 'admin', 'fas fa-fw fa-tachometer-alt', 1),
(2, 0, 'Nanda', '', '', 0),
(3, 2, 'Edit Profile', 'user/edit', 'fas fa-fw fa-user-edit', 1),
(4, 3, 'Menu Management', 'menu', 'fas fa-fw fa-folder', 1),
(5, 3, 'Submenu Management', 'menu/submenu', 'fas fa-fw fa-folder-open', 1),
(7, 1, 'Role', 'admin/role', 'fas fa-fw fa-user-tie', 1),
(9, 2, 'Change Password', 'user/changepassword', 'fas fa-fw fa-key', 1),
(15, 11, 'Data Nasabah', 'nasabah', 'fas fa-fw fa-book', 1),
(16, 7, 'Menabung', 'transaksi/tabung', 'fas fa-fw fa-book', 1),
(17, 10, 'Kategori', 'kategori', 'fas fa-fw fa-book', 1),
(19, 9, 'Laporan Tabung', 'laporan/tabung', 'fas fa-fw fa-book', 1),
(20, 7, 'Ambil', 'transaksi/ambil', 'fas fa-fw fa-book', 1),
(21, 9, 'Laporan Ambil', 'laporan/ambil', 'fas fa-fw fa-book', 1),
(23, 2, 'Data User', 'user/datauser', 'fas fa-fw fa-book', 1),
(24, 1, 'Data', 'admin/data', 'fas fa-fw fa-book', 1),
(25, 7, 'Jual', 'transaksi/jual', 'fas fa-fw fa-book', 1),
(27, 9, 'Laporan Jual', 'laporan/jual', 'fas fa-fw fa-book', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `nasabah`
--
ALTER TABLE `nasabah`
  ADD PRIMARY KEY (`id`),
  ADD KEY `no_rekening` (`no_rekening`);

--
-- Indexes for table `sampah`
--
ALTER TABLE `sampah`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaksi`
--
ALTER TABLE `transaksi`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice` (`invoice`),
  ADD KEY `no_rekening` (`no_rek`) USING BTREE;

--
-- Indexes for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD PRIMARY KEY (`id`),
  ADD KEY `invoice` (`invoice`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=151;

--
-- AUTO_INCREMENT for table `nasabah`
--
ALTER TABLE `nasabah`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `sampah`
--
ALTER TABLE `sampah`
  MODIFY `id` int(15) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `transaksi`
--
ALTER TABLE `transaksi`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=170;

--
-- AUTO_INCREMENT for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  MODIFY `id` int(100) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT for table `user_access_menu`
--
ALTER TABLE `user_access_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `user_sub_menu`
--
ALTER TABLE `user_sub_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `transaksi_detail`
--
ALTER TABLE `transaksi_detail`
  ADD CONSTRAINT `transaksi_detail_ibfk_1` FOREIGN KEY (`invoice`) REFERENCES `transaksi` (`invoice`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
