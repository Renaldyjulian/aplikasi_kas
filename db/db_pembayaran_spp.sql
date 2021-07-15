-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 15, 2021 at 07:35 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_pembayaran_spp`
--

-- --------------------------------------------------------

--
-- Table structure for table `tb_fakultas`
--

CREATE TABLE `tb_fakultas` (
  `kode_fakultas` varchar(50) NOT NULL,
  `nama_fakultas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_fakultas`
--

INSERT INTO `tb_fakultas` (`kode_fakultas`, `nama_fakultas`) VALUES
('F0001', 'Menikah'),
('F0002', 'Belum Menikah');

-- --------------------------------------------------------

--
-- Table structure for table `tb_identitas`
--

CREATE TABLE `tb_identitas` (
  `kode_universitas` varchar(50) NOT NULL,
  `nama_universitas` varchar(250) NOT NULL,
  `sk_universitas` varchar(250) NOT NULL,
  `alamat_universitas` varchar(250) NOT NULL,
  `alamat_universitas_2` varchar(250) NOT NULL,
  `no_hp` int(13) NOT NULL,
  `pimpinan_universitas` varchar(50) NOT NULL,
  `bendahara_universitas` varchar(50) NOT NULL,
  `kordinator_universitas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_identitas`
--

INSERT INTO `tb_identitas` (`kode_universitas`, `nama_universitas`, `sk_universitas`, `alamat_universitas`, `alamat_universitas_2`, `no_hp`, `pimpinan_universitas`, `bendahara_universitas`, `kordinator_universitas`) VALUES
('0008', 'Perumahan Puri Sentosa', 'izin sk dirjen pendis no. 1926 tahun 2017', 'jalan uka perumahan mutiara garuda sakti blok h.15 kelurahan air putih kec. tampan kota pekanbaru , provinsi riau - indonesia', 'jalan kartini, kelurahan simpang empat, kecamatan pekanbaru kota, kota pekanbaru, provinsi riau - indonesia', 987654321, 'AHMAD IBNU HAJAR., S.T., M.T.,Eng', 'MURTADHO., S.Pdi', 'JAKFAR SHODIQ., S.T');

-- --------------------------------------------------------

--
-- Table structure for table `tb_jenis_spp`
--

CREATE TABLE `tb_jenis_spp` (
  `kode_jenis_spp` varchar(50) NOT NULL,
  `keterangan_spp` varchar(50) NOT NULL,
  `harga` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jenis_spp`
--

INSERT INTO `tb_jenis_spp` (`kode_jenis_spp`, `keterangan_spp`, `harga`) VALUES
('S0001', 'Iuran Sampah', 120000),
('S0002', 'Iuran Keamanan', 240000),
('S0003', 'Iuran Kematian dan Sakit', 120000),
('S0004', 'Iuran Lain Lain', 120000);

-- --------------------------------------------------------

--
-- Table structure for table `tb_jurusan`
--

CREATE TABLE `tb_jurusan` (
  `kode_jurusan` varchar(50) NOT NULL,
  `nama_jurusan` varchar(50) NOT NULL,
  `kode_fakultas` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_jurusan`
--

INSERT INTO `tb_jurusan` (`kode_jurusan`, `nama_jurusan`, `kode_fakultas`) VALUES
('J0001', 'Pemilik', 'F0001'),
('J0002', 'Kontrak', 'F0002');

-- --------------------------------------------------------

--
-- Table structure for table `tb_keterangan`
--

CREATE TABLE `tb_keterangan` (
  `kode_keterangan` varchar(100) NOT NULL,
  `keterangan` varchar(100) NOT NULL,
  `kode_tahun_masuk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_keterangan`
--

INSERT INTO `tb_keterangan` (`kode_keterangan`, `keterangan`, `kode_tahun_masuk`) VALUES
('K001', 'Pemilik', 'T001');

-- --------------------------------------------------------

--
-- Table structure for table `tb_mahasiswa`
--

CREATE TABLE `tb_mahasiswa` (
  `nim` varchar(50) NOT NULL,
  `nirm` varchar(50) NOT NULL,
  `nama_mahasiswa` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `kode_jurusan` varchar(50) NOT NULL,
  `kode_fakultas` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `no_hp` varchar(13) NOT NULL,
  `password` varchar(50) NOT NULL,
  `tahun_angkatan` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_mahasiswa`
--

INSERT INTO `tb_mahasiswa` (`nim`, `nirm`, `nama_mahasiswa`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `kode_jurusan`, `kode_fakultas`, `alamat`, `email`, `no_hp`, `password`, `tahun_angkatan`) VALUES
('3571012806950004', '001', 'Rangga Bramantya', 'Kediri', '1995-06-28', 'Laki-Laki', 'J0002', 'F0001', 'Puri Sentosa Blok A3/3A Desa Cicau, Kec. Cikarang ', 'ranggabramantya88@gmail.com', '082297321345', 'd50172dd13307346dd1e213d4ad5c31b', '2020');

-- --------------------------------------------------------

--
-- Table structure for table `tb_pembayaran`
--

CREATE TABLE `tb_pembayaran` (
  `kode_pembayaran` varchar(50) NOT NULL,
  `kode_tagihan` varchar(50) NOT NULL,
  `jumlah_bayar` double NOT NULL,
  `keterangan_pembayaran` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_pembayaran`
--

INSERT INTO `tb_pembayaran` (`kode_pembayaran`, `kode_tagihan`, `jumlah_bayar`, `keterangan_pembayaran`, `tanggal`) VALUES
('P0001', '74', 1000000, 'BELUM LUNAS', '2020-02-06 07:29:32'),
('P0002', '74', 500000, 'BELUM LUNAS', '2020-02-06 07:29:51'),
('P0003', '77', 500000, 'BELUM LUNAS', '2020-02-06 07:38:28'),
('P0004', '78', 1500000, 'LUNAS', '2021-07-15 04:58:50'),
('P0005', '75', 500000, 'BELUM LUNAS', '2021-07-15 05:02:30'),
('P0006', '81', 30000, 'BELUM LUNAS', '2021-07-15 11:09:23'),
('P0007', '81', 40000, 'BELUM LUNAS', '2021-07-15 11:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `tb_spp`
--

CREATE TABLE `tb_spp` (
  `kode_spp` varchar(50) NOT NULL,
  `kode_jenis_spp` varchar(50) NOT NULL,
  `kode_tahun_ajaran` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_spp`
--

INSERT INTO `tb_spp` (`kode_spp`, `kode_jenis_spp`, `kode_tahun_ajaran`, `status`, `tanggal`) VALUES
('T0002', 'S0004', 'T0002', 'aktif', '2020-02-06 07:37:59'),
('T0003', 'S0002', 'T0003', 'aktif', '2021-07-15 09:41:45'),
('T0004', 'S0003', 'T0003', 'aktif', '2021-07-15 09:48:09'),
('T0005', 'S0001', 'T0003', 'aktif', '2021-07-15 09:48:37');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tagihan_spp`
--

CREATE TABLE `tb_tagihan_spp` (
  `kode_tagihan` int(50) NOT NULL,
  `nim` varchar(50) NOT NULL,
  `kode_spp` varchar(50) NOT NULL,
  `total` double NOT NULL,
  `keterangan` varchar(50) NOT NULL,
  `status` varchar(50) NOT NULL,
  `tanggal` datetime NOT NULL,
  `tanggal_update` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tagihan_spp`
--

INSERT INTO `tb_tagihan_spp` (`kode_tagihan`, `nim`, `kode_spp`, `total`, `keterangan`, `status`, `tanggal`, `tanggal_update`) VALUES
(79, '3571012806950004', 'T0003', 0, '', 'aktif', '2021-07-15 09:41:45', '0000-00-00 00:00:00'),
(80, '3571012806950004', 'T0004', 0, '', 'aktif', '2021-07-15 09:48:09', '0000-00-00 00:00:00'),
(81, '3571012806950004', 'T0005', 70000, 'BELUM LUNAS', 'aktif', '2021-07-15 09:48:37', '2021-07-15 11:38:51');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tahun_ajaran`
--

CREATE TABLE `tb_tahun_ajaran` (
  `kode_tahun_ajaran` varchar(50) NOT NULL,
  `tahun_ajaran` varchar(50) NOT NULL,
  `semester` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_tahun_ajaran`
--

INSERT INTO `tb_tahun_ajaran` (`kode_tahun_ajaran`, `tahun_ajaran`, `semester`) VALUES
('T0002', '2018', 'awal'),
('T0003', '2018', 'akhir'),
('T0004', '2019', 'awal');

-- --------------------------------------------------------

--
-- Table structure for table `tb_tahun_masuk`
--

CREATE TABLE `tb_tahun_masuk` (
  `kode_tahun_masuk` varchar(100) NOT NULL,
  `tahun_masuk` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tb_tahun_masuk`
--

INSERT INTO `tb_tahun_masuk` (`kode_tahun_masuk`, `tahun_masuk`) VALUES
('T001', '2019');

-- --------------------------------------------------------

--
-- Table structure for table `tb_user`
--

CREATE TABLE `tb_user` (
  `kode_user` int(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `tempat_lahir` varchar(50) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `jenis_kelamin` varchar(50) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `level` varchar(20) NOT NULL,
  `tanggal_insert` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tb_user`
--

INSERT INTO `tb_user` (`kode_user`, `nama_user`, `tempat_lahir`, `tanggal_lahir`, `jenis_kelamin`, `no_hp`, `email`, `username`, `password`, `level`, `tanggal_insert`) VALUES
(1, 'renaldy julian dwi wardhana', 'Jombang', '1999-07-17', 'Laki-Laki', '081336031691', 'renaldyjulian17@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3', 'admin', '0000-00-00 00:00:00'),
(2, 'Rangga Bramantya', 'Kediri', '1995-06-28', 'Laki-Laki', '082297321345', 'ranggabramantya88@gmail.com', 'bendahara', 'c9ccd7f3c1145515a9d3f7415d5bcbea', 'bendahara', '0000-00-00 00:00:00'),
(7, 'Aulia Permata Sari', 'Malang', '1993-03-31', 'Perempuan', '08987654321', 'aulia@gmail.com', 'operator', '4b583376b2767b923c3e1da60d10de59', 'pimpinan', '0000-00-00 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tb_fakultas`
--
ALTER TABLE `tb_fakultas`
  ADD PRIMARY KEY (`kode_fakultas`);

--
-- Indexes for table `tb_identitas`
--
ALTER TABLE `tb_identitas`
  ADD PRIMARY KEY (`kode_universitas`);

--
-- Indexes for table `tb_jenis_spp`
--
ALTER TABLE `tb_jenis_spp`
  ADD PRIMARY KEY (`kode_jenis_spp`);

--
-- Indexes for table `tb_jurusan`
--
ALTER TABLE `tb_jurusan`
  ADD PRIMARY KEY (`kode_jurusan`);

--
-- Indexes for table `tb_keterangan`
--
ALTER TABLE `tb_keterangan`
  ADD PRIMARY KEY (`kode_keterangan`);

--
-- Indexes for table `tb_mahasiswa`
--
ALTER TABLE `tb_mahasiswa`
  ADD PRIMARY KEY (`nim`);

--
-- Indexes for table `tb_pembayaran`
--
ALTER TABLE `tb_pembayaran`
  ADD PRIMARY KEY (`kode_pembayaran`);

--
-- Indexes for table `tb_spp`
--
ALTER TABLE `tb_spp`
  ADD PRIMARY KEY (`kode_spp`);

--
-- Indexes for table `tb_tagihan_spp`
--
ALTER TABLE `tb_tagihan_spp`
  ADD PRIMARY KEY (`kode_tagihan`);

--
-- Indexes for table `tb_tahun_ajaran`
--
ALTER TABLE `tb_tahun_ajaran`
  ADD PRIMARY KEY (`kode_tahun_ajaran`);

--
-- Indexes for table `tb_tahun_masuk`
--
ALTER TABLE `tb_tahun_masuk`
  ADD PRIMARY KEY (`kode_tahun_masuk`);

--
-- Indexes for table `tb_user`
--
ALTER TABLE `tb_user`
  ADD PRIMARY KEY (`kode_user`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tb_tagihan_spp`
--
ALTER TABLE `tb_tagihan_spp`
  MODIFY `kode_tagihan` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `tb_user`
--
ALTER TABLE `tb_user`
  MODIFY `kode_user` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
