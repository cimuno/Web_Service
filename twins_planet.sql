-- phpMyAdmin SQL Dump
-- version 5.3.0-dev+20221227.666ba48dc9
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 08, 2023 at 10:02 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `twins_planet`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `username` varchar(12) NOT NULL,
  `email` varchar(64) NOT NULL,
  `password` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `username`, `email`, `password`) VALUES
(1, 'admin', 'admin@gmail.', 'admin'),
(2, 'admin2', 'admin2@gmail.com', 'admin2'),
(4, 'admin23', 'admin3@gmail.com', 'admin3');

-- --------------------------------------------------------

--
-- Table structure for table `kategori`
--

CREATE TABLE `kategori` (
  `id_kategori` int(5) NOT NULL,
  `nama_kategori` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kategori`
--

INSERT INTO `kategori` (`id_kategori`, `nama_kategori`) VALUES
(1, 'Elektronik'),
(2, 'Furniture'),
(3, 'Pakaian Pria'),
(4, 'Pakaian Wanita'),
(5, 'Pakaian Anak'),
(6, 'Jajanan');

-- --------------------------------------------------------

--
-- Table structure for table `ongkir`
--

CREATE TABLE `ongkir` (
  `id_ongkir` int(5) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `ongkir`
--

INSERT INTO `ongkir` (`id_ongkir`, `nama_kota`, `tarif`) VALUES
(1, 'Semarang', 10000),
(2, 'Kendal', 12500);

-- --------------------------------------------------------

--
-- Table structure for table `pelanggan`
--

CREATE TABLE `pelanggan` (
  `id_pelanggan` int(11) NOT NULL,
  `email_pelanggan` varchar(32) NOT NULL,
  `password_pelanggan` varchar(32) NOT NULL,
  `nama_pelanggan` varchar(32) NOT NULL,
  `telepon_pelanggan` varchar(12) NOT NULL,
  `alamat_pelanggan` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pelanggan`
--

INSERT INTO `pelanggan` (`id_pelanggan`, `email_pelanggan`, `password_pelanggan`, `nama_pelanggan`, `telepon_pelanggan`, `alamat_pelanggan`) VALUES
(1, 'pelanggan@gmail.com', '123qwe', 'Mail', '081234567890', 'Jl.Beringin'),
(2, 'ivan@gmail.com', '123qwe', 'ivan', '081548875458', 'Jl.Belajar membuat web');

-- --------------------------------------------------------

--
-- Table structure for table `pembayaran`
--

CREATE TABLE `pembayaran` (
  `id_pembayaran` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `nama` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `jumlah` int(11) NOT NULL,
  `tanggal` date NOT NULL,
  `bukti` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembayaran`
--

INSERT INTO `pembayaran` (`id_pembayaran`, `id_pembelian`, `nama`, `bank`, `jumlah`, `tanggal`, `bukti`) VALUES
(1, 7, 'ivan', 'BCA', 48500, '2022-06-23', '20220623125722Logo.jpg'),
(2, 6, 'pelanggan', 'BCA', 2710000, '2022-06-24', '20220624025330WhatsApp Image 2022-06-23 at 21.03.28.jpeg');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian`
--

CREATE TABLE `pembelian` (
  `id_pembelian` int(11) NOT NULL,
  `id_pelanggan` int(11) NOT NULL,
  `id_ongkir` int(11) NOT NULL,
  `tanggal_pembelian` date NOT NULL,
  `total_pembelian` int(11) NOT NULL,
  `nama_kota` varchar(100) NOT NULL,
  `tarif` int(11) NOT NULL,
  `alamat_pengiriman` text NOT NULL,
  `status_pembelian` varchar(100) NOT NULL DEFAULT 'Pending',
  `resi_pengiriman` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian`
--

INSERT INTO `pembelian` (`id_pembelian`, `id_pelanggan`, `id_ongkir`, `tanggal_pembelian`, `total_pembelian`, `nama_kota`, `tarif`, `alamat_pengiriman`, `status_pembelian`, `resi_pengiriman`) VALUES
(1, 1, 1, '2022-06-22', 336000, '', 0, '', 'Pending', ''),
(2, 1, 1, '2022-06-23', 546500, '', 0, '', 'Pending', ''),
(3, 1, 1, '2022-06-23', 5389000, '', 0, '', 'Pending', ''),
(4, 1, 1, '2022-06-23', 3080500, 'Semarang', 10000, '', 'Pending', ''),
(5, 1, 1, '2022-06-23', 6709000, 'Semarang', 10000, 'Jl.beringin', 'Pending', ''),
(6, 1, 1, '2022-06-23', 2710000, 'Semarang', 10000, 'Jl.belajar membuat website', 'Sudah melakukan pembayaran', ''),
(7, 2, 1, '2022-06-23', 48500, 'Semarang', 10000, 'Jl.Belajar membuat web', 'barang dikirim', 'A00001');

-- --------------------------------------------------------

--
-- Table structure for table `pembelian_produk`
--

CREATE TABLE `pembelian_produk` (
  `id_pembelian_produk` int(11) NOT NULL,
  `id_pembelian` int(11) NOT NULL,
  `id_produk` int(11) NOT NULL,
  `jumlah` int(12) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `harga` int(11) NOT NULL,
  `berat` int(11) NOT NULL,
  `subberat` int(11) NOT NULL,
  `subharga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembelian_produk`
--

INSERT INTO `pembelian_produk` (`id_pembelian_produk`, `id_pembelian`, `id_produk`, `jumlah`, `nama`, `harga`, `berat`, `subberat`, `subharga`) VALUES
(1, 1, 7, 2, '0', 0, 0, 0, 0),
(2, 1, 6, 1, '0', 0, 0, 0, 0),
(3, 2, 7, 1, '0', 38500, 700, 700, 38500),
(4, 2, 6, 2, '0', 249000, 16000, 32000, 498000),
(5, 3, 1, 2, 'SAMSUNG SMART TV 32 T4500-UA32T4500AKXXD', 2650000, 4100, 8200, 5300000),
(6, 3, 9, 1, 'Celana olahraga pria - Terbaru', 79000, 400, 400, 79000),
(7, 4, 1, 1, 'SAMSUNG SMART TV 32 T4500-UA32T4500AKXXD', 2700000, 4100, 4100, 2700000),
(8, 4, 10, 2, 'Anela Fashion Dress Bimi - dress wanita premium', 185250, 300, 600, 370500),
(9, 5, 2, 1, 'SAMSUNG 50\" Crystal UHD 4K Smart TV AU7000', 6699000, 5000, 5000, 6699000),
(10, 6, 1, 1, 'SAMSUNG SMART TV 32 T4500-UA32T4500AKXXD', 2700000, 4100, 4100, 2700000),
(11, 7, 7, 1, 'Penyangga Punggung Shoulder - Hitam XL', 38500, 700, 700, 38500);

-- --------------------------------------------------------

--
-- Table structure for table `produk`
--

CREATE TABLE `produk` (
  `id_produk` int(12) NOT NULL,
  `id_kategori` int(5) NOT NULL,
  `nama_produk` varchar(128) NOT NULL,
  `harga_produk` int(128) NOT NULL,
  `berat_produk` int(32) NOT NULL,
  `foto_produk` varchar(128) NOT NULL,
  `deskripsi` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `produk`
--

INSERT INTO `produk` (`id_produk`, `id_kategori`, `nama_produk`, `harga_produk`, `berat_produk`, `foto_produk`, `deskripsi`) VALUES
(1, 1, 'SAMSUNG SMART TV 32 T4500-UA32T4500AKXXD', 2700000, 4100, 'samsung32.jpg', ''),
(2, 1, 'SAMSUNG 50\" Crystal UHD 4K Smart TV AU7000', 6699000, 5000, 'samsung50.jpg', ''),
(3, 1, 'SAMSUNG 43\" Crystal UHD 4K Smart TV AU7000', 5499000, 4400, 'samsung42.jpg', ''),
(4, 2, 'LEMARI BAJU / PAKAIAN 3 PINTU ', 1235000, 21000, 'lemaribaju1.jpg', ''),
(5, 2, 'Dekoruma Kato Meja Kerja Minimalis | Meja Belajar ', 1199000, 33000, 'meja kerja minimalis.jpg\r\n', ''),
(6, 2, 'Offo Living Furniture - Rak Buku ', 249000, 16000, 'rak buku.jpg', ''),
(7, 3, 'Penyangga Punggung Shoulder - Hitam XL', 38500, 700, 'penyangga pungung.png', ''),
(8, 3, 'MATSUDA Kaos Polo Shirt Pria Kerah Aioi', 79000, 450, 'kaos polos.jpg', ''),
(9, 3, 'Celana olahraga pria - Terbaru', 79000, 400, 'celana olahrga.jpg', ''),
(10, 4, 'Anela Fashion Dress Bimi - dress wanita premium', 185250, 300, 'Fashion Dress Bimi.png', ''),
(11, 4, 'Cammomile Blouse fashion atasan Wanita', 89900, 300, 'Cammomile Blouse.png', ''),
(12, 4, 'Mikela Blouse | Terminal Grosir ', 50000, 3000, 'Mikela Blouse.jpg', ''),
(13, 5, 'Kaos Anak Baju Anak Transformers 3D ', 49000, 180, 'kaos anak.jpg', ''),
(14, 5, 'Two Mix Baju Anak Perempuan GRATIS Tas Lucu ', 93900, 200, 'Two Mix Baju.jpg', ''),
(15, 5, 'FASHION ANAK PEREMPUAN 1-6THN ', 33725, 200, 'FASHION ANAK PEREMPUAN.jpg', '');

-- --------------------------------------------------------

--
-- Table structure for table `vcr_pelanggan`
--

CREATE TABLE `vcr_pelanggan` (
  `id_pelanggan` int(5) NOT NULL,
  `nama_lengkap_pelanggan` varchar(255) NOT NULL,
  `kode_voucher` varchar(12) NOT NULL,
  `status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `id_voucher` int(255) NOT NULL,
  `kode_voucher` int(12) NOT NULL,
  `info_voucher` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`id_voucher`, `kode_voucher`, `info_voucher`) VALUES
(1, 9112022, 'VOUCHER HARI PAHLAWAN');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `kategori`
--
ALTER TABLE `kategori`
  ADD PRIMARY KEY (`id_kategori`);

--
-- Indexes for table `ongkir`
--
ALTER TABLE `ongkir`
  ADD PRIMARY KEY (`id_ongkir`);

--
-- Indexes for table `pelanggan`
--
ALTER TABLE `pelanggan`
  ADD PRIMARY KEY (`id_pelanggan`);

--
-- Indexes for table `pembayaran`
--
ALTER TABLE `pembayaran`
  ADD PRIMARY KEY (`id_pembayaran`);

--
-- Indexes for table `pembelian`
--
ALTER TABLE `pembelian`
  ADD PRIMARY KEY (`id_pembelian`);

--
-- Indexes for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  ADD PRIMARY KEY (`id_pembelian_produk`);

--
-- Indexes for table `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`id_produk`);

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`id_voucher`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `kategori`
--
ALTER TABLE `kategori`
  MODIFY `id_kategori` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `ongkir`
--
ALTER TABLE `ongkir`
  MODIFY `id_ongkir` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pelanggan`
--
ALTER TABLE `pelanggan`
  MODIFY `id_pelanggan` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembayaran`
--
ALTER TABLE `pembayaran`
  MODIFY `id_pembayaran` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pembelian`
--
ALTER TABLE `pembelian`
  MODIFY `id_pembelian` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `pembelian_produk`
--
ALTER TABLE `pembelian_produk`
  MODIFY `id_pembelian_produk` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `produk`
--
ALTER TABLE `produk`
  MODIFY `id_produk` int(12) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `id_voucher` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
