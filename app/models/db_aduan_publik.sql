-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 27, 2022 at 11:02 PM
-- Server version: 10.4.21-MariaDB
-- PHP Version: 8.0.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_aduan_publik`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id_admin` int(11) NOT NULL,
  `nama_admin` varchar(100) NOT NULL,
  `gender` enum('pria','wanita') NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id_admin`, `nama_admin`, `gender`, `no_telp`, `email`, `password`) VALUES
(1, 'Admin 1', 'pria', '08641235685', 'admin1@mail.com', 'passwordadmin1'),
(2, 'Admin 2', 'wanita', '088132569854', 'admin2@mail.com', 'passwordadmin2');

-- --------------------------------------------------------

--
-- Table structure for table `aduan`
--

CREATE TABLE `aduan` (
  `id_aduan` int(11) NOT NULL,
  `judul` varchar(200) NOT NULL,
  `isi` text NOT NULL,
  `tanggal_aduan` date NOT NULL,
  `lokasi` varchar(500) NOT NULL,
  `status_anonim` tinyint(1) NOT NULL,
  `status_rahasia` tinyint(1) NOT NULL,
  `status_aduan` enum('Menunggu','Direspon','Ditolak') NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_kategori` int(11) NOT NULL,
  `id_instansi` int(11) NOT NULL,
  `id_klasifikasi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `aduan`
--

INSERT INTO `aduan` (`id_aduan`, `judul`, `isi`, `tanggal_aduan`, `lokasi`, `status_anonim`, `status_rahasia`, `status_aduan`, `id_user`, `id_kategori`, `id_instansi`, `id_klasifikasi`) VALUES
(1, 'Aduan 1', 'Isi aduan 1', '2022-01-01', 'Lokasi 1', 0, 0, 'Direspon', 1, 1, 1, 1),
(2, 'Aduan 2', 'Isi aduan 2', '2021-12-22', 'Lokasi 2', 1, 1, 'Direspon', 2, 2, 2, 2),
(3, 'Aduan 3', 'Isi aduan 3', '2021-12-29', 'Lokasi 3', 1, 0, 'Ditolak', 1, 2, 3, 2),
(4, 'Aduan 4', 'Isi aduan 4', '2021-12-03', 'Lokasi 3', 0, 0, 'Menunggu', 2, 2, 4, 3),
(6, 'coba', 'tes', '2022-01-28', 'tes', 0, 0, 'Ditolak', 9, 1, 3, 2),
(8, 'tse', 'tes', '2022-01-28', 'tes', 0, 0, 'Direspon', 2, 1, 3, 2),
(9, 'lagi', 'lagi', '2022-01-28', 'sss', 0, 0, 'Direspon', 2, 1, 3, 2),
(10, 'tes', 'tes', '2022-01-28', 'ssssss', 0, 0, 'Direspon', 2, 1, 3, 2),
(11, 'tes', 'tes', '2022-01-28', 'aaaa', 0, 0, 'Menunggu', 2, 1, 3, 2),
(12, 'aaa', 'aaaa', '2022-01-28', 'ssss', 0, 0, 'Menunggu', 2, 1, 3, 2),
(13, 'tes', 'tes', '2022-01-28', 'tes', 0, 0, 'Menunggu', 2, 1, 3, 2),
(14, 'aa', 'sfdasd', '2022-01-28', 'dasd', 1, 1, 'Menunggu', 2, 1, 3, 2),
(15, 'ss', 'tes', '2022-01-28', 'qwe', 1, 1, 'Menunggu', 11, 2, 4, 1),
(16, 'aaa', 'qwe', '2022-01-28', 'qwe', 0, 0, 'Menunggu', 11, 2, 2, 3);

-- --------------------------------------------------------

--
-- Table structure for table `instansi`
--

CREATE TABLE `instansi` (
  `id_instansi` int(11) NOT NULL,
  `instansi` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `instansi`
--

INSERT INTO `instansi` (`id_instansi`, `instansi`, `email`) VALUES
(1, 'Instansi 1', 'instansi1@mail.com'),
(2, 'Instansi 2', 'instansi2@mail.com'),
(3, 'Instansi 3', 'instansi3@mail.com'),
(4, 'Instansi 4', 'instansi4@mail.com');

-- --------------------------------------------------------

--
-- Table structure for table `kategori_aduan`
--

CREATE TABLE `kategori_aduan` (
  `id_kategori` int(11) NOT NULL,
  `kategori` varchar(20) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kategori_aduan`
--

INSERT INTO `kategori_aduan` (`id_kategori`, `kategori`, `deskripsi`) VALUES
(1, 'Kategori 1', ''),
(2, 'Kategori 2', '');

-- --------------------------------------------------------

--
-- Table structure for table `klasifikasi_aduan`
--

CREATE TABLE `klasifikasi_aduan` (
  `id_klasifikasi` int(11) NOT NULL,
  `klasifikasi` varchar(100) NOT NULL,
  `icon` varchar(200) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `klasifikasi_aduan`
--

INSERT INTO `klasifikasi_aduan` (`id_klasifikasi`, `klasifikasi`, `icon`, `deskripsi`) VALUES
(1, 'Pengaduan', 'img/pengaduan.svg', 'Menyampaikan aduan terkait suatu hal atau permasalahan yang ditemukan'),
(2, 'Aspirasi', 'img/aspirasi.svg', 'Menyampaikan aspirasi atau saran agar disampaikan ke pihak terkait'),
(3, 'Permintaan Informasi', 'img/permintaan-informasi.svg', 'Melakukan permintaan informasi baik berupa mengkonfirmasi atau meminta detail terkait suatu kebijakan atau penjelasan informasi yang ditemukan');

-- --------------------------------------------------------

--
-- Table structure for table `kurasi`
--

CREATE TABLE `kurasi` (
  `id_kurasi` int(11) NOT NULL,
  `id_aduan` int(11) NOT NULL,
  `id_admin` int(11) NOT NULL,
  `tanggal_respon` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `kurasi`
--

INSERT INTO `kurasi` (`id_kurasi`, `id_aduan`, `id_admin`, `tanggal_respon`) VALUES
(1, 2, 1, '2022-01-02'),
(2, 3, 2, '2022-01-02');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `gender` enum('pria','wanita','lainnya') NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `alamat` varchar(500) NOT NULL,
  `no_telp` varchar(12) NOT NULL,
  `pekerjaan` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_user`, `nama`, `gender`, `tanggal_lahir`, `alamat`, `no_telp`, `pekerjaan`, `email`, `password`) VALUES
(1, 'User 1', 'pria', '2000-05-17', '', '08126541234', 'Pekerjaan 1', 'user1@mail.com', 'passworduser1'),
(2, 'User 2', 'wanita', '2003-02-05', '', '085965423598', 'Pekerjaan 2', 'user2@mail.com', 'passworduser2'),
(3, 'Meong', 'pria', '2002-05-11', 'Jonggol', '0877777', 'Mengeong', 'meong@meong.nya', 'meong'),
(4, '123', 'pria', '2022-01-19', 'aaa', '123123', '123', 's@d.ccc', '123'),
(5, 'abc', 'pria', '2022-01-27', 'abc', '123', 'abc', 'mail1@mail.com', '123'),
(7, 'tes', 'pria', '2022-01-27', 'def', '123', 'tes', 'tes@tes.com', 'tes'),
(8, 'abc', 'pria', '2022-01-27', 'abc', '+62812365945', 'abc', 'abc@abc.com', 'abc'),
(9, 'coba', 'pria', '2022-01-27', 'coba', '086956231254', 'coba', 'coba@mail.com', '$2y$10$GcpDoJ4zrYTBc5amIjyh.OCGoyyr33CBQ0bGIahieUWO7YnY8sn8u'),
(10, 'tes1', 'pria', '2022-01-27', 'tes1', '086545698745', 'tes1', 'tes1@tes1.com', '$2y$10$M/IniVdMH1QJrgLFC9lMse.DDzA3azD/W0.VKp/7iVCJRWar7ZZbm'),
(11, 'Leonardo', 'pria', '2022-01-27', 'Italia', '+62851568756', 'Pelukis', 'leonardo@gmail.com', '$2y$10$0OC.JvI2jm1rvAWmAYTnRuZgvqvXzuIWVqIAsDJozZ9mpYXOky/qm'),
(14, 'tes', 'pria', '2022-01-28', 'tes', '+62865978546', '', 'kosong@mail.com', '$2y$10$xLZtm7knr9RrH4VWiy8Zg.nuaDEbB.uHDt4IA9MWv3haszRXp9Lfy');

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_role`, `role`) VALUES
(1, 'Admin'),
(2, 'Member');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `aduan`
--
ALTER TABLE `aduan`
  ADD PRIMARY KEY (`id_aduan`),
  ADD KEY `fk_kategori_aduan` (`id_kategori`),
  ADD KEY `fk_instansi` (`id_instansi`),
  ADD KEY `fk_klasifikasi_aduan` (`id_klasifikasi`),
  ADD KEY `fk_user` (`id_user`);

--
-- Indexes for table `instansi`
--
ALTER TABLE `instansi`
  ADD PRIMARY KEY (`id_instansi`);

--
-- Indexes for table `kategori_aduan`
--
ALTER TABLE `kategori_aduan`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `klasifikasi_aduan`
--
ALTER TABLE `klasifikasi_aduan`
  ADD PRIMARY KEY (`id_klasifikasi`);

--
-- Indexes for table `kurasi`
--
ALTER TABLE `kurasi`
  ADD PRIMARY KEY (`id_kurasi`),
  ADD KEY `fk_aduan` (`id_aduan`),
  ADD KEY `fk_admin` (`id_admin`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `aduan`
--
ALTER TABLE `aduan`
  MODIFY `id_aduan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `instansi`
--
ALTER TABLE `instansi`
  MODIFY `id_instansi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori_aduan`
--
ALTER TABLE `kategori_aduan`
  MODIFY `id_kategori` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `klasifikasi_aduan`
--
ALTER TABLE `klasifikasi_aduan`
  MODIFY `id_klasifikasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `kurasi`
--
ALTER TABLE `kurasi`
  MODIFY `id_kurasi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `aduan`
--
ALTER TABLE `aduan`
  ADD CONSTRAINT `fk_instansi` FOREIGN KEY (`id_instansi`) REFERENCES `instansi` (`id_instansi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_kategori_aduan` FOREIGN KEY (`id_kategori`) REFERENCES `kategori_aduan` (`id_kategori`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_klasifikasi_aduan` FOREIGN KEY (`id_klasifikasi`) REFERENCES `klasifikasi_aduan` (`id_klasifikasi`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id_user`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `kurasi`
--
ALTER TABLE `kurasi`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`id_admin`) REFERENCES `admins` (`id_admin`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_aduan` FOREIGN KEY (`id_aduan`) REFERENCES `aduan` (`id_aduan`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
