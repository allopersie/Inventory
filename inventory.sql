-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Waktu pembuatan: 07 Jul 2024 pada 14.25
-- Versi server: 10.4.32-MariaDB
-- Versi PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inventory`
--

-- --------------------------------------------------------

--
-- Struktur dari tabel `jenis_bahan`
--

CREATE TABLE `jenis_bahan` (
  `ID` int(11) NOT NULL,
  `Nama_Bahan` varchar(100) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `jenis_bahan`
--

INSERT INTO `jenis_bahan` (`ID`, `Nama_Bahan`, `Keterangan`) VALUES
(5, '20s', 'string'),
(6, '24s', 'string'),
(7, '30s', 'string');

-- --------------------------------------------------------

--
-- Struktur dari tabel `menu`
--

CREATE TABLE `menu` (
  `ID` int(11) NOT NULL,
  `Module` varchar(200) DEFAULT NULL,
  `PageName` varchar(200) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `menu`
--

INSERT INTO `menu` (`ID`, `Module`, `PageName`) VALUES
(1, 'Menu A', 'Menu A'),
(2, 'Menu B', 'Menu B'),
(3, 'Menu C', 'Menu C');

-- --------------------------------------------------------

--
-- Struktur dari tabel `pesanan`
--

CREATE TABLE `pesanan` (
  `ID` int(11) NOT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `Warna` varchar(100) DEFAULT NULL,
  `Jenis_Bahan_ID` int(11) DEFAULT NULL,
  `Ukuran_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Created` varchar(30) DEFAULT NULL,
  `createdby` date DEFAULT NULL,
  `Id_Produk` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `pesanan`
--

INSERT INTO `pesanan` (`ID`, `Tanggal`, `Warna`, `Jenis_Bahan_ID`, `Ukuran_ID`, `Quantity`, `Created`, `createdby`, `Id_Produk`) VALUES
(52, '2024-07-04 00:00:00', 'Combed Hitam', 5, 2, 500, '2024-07-04 00:00:00.000000', '0000-00-00', 16);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `pesanan_produk_vw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pesanan_produk_vw` (
`ID` int(11)
,`Tanggal` datetime
,`Warna` varchar(100)
,`Jenis_Bahan_ID` int(11)
,`Ukuran_ID` int(11)
,`qtyStok` int(11)
,`Created` varchar(30)
,`createdby` date
,`Ukuran` varchar(100)
,`Nama_Bahan` varchar(100)
,`qtyPesan` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `pesanan_vw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `pesanan_vw` (
`ID` int(11)
,`Tanggal` datetime
,`Warna` varchar(100)
,`Jenis_Bahan_ID` int(11)
,`Ukuran_ID` int(11)
,`Quantity` int(11)
,`Created` varchar(30)
,`createdby` date
,`Id_Produk` int(11)
,`Ukuran` varchar(100)
,`Nama_Bahan` varchar(100)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `produk`
--

CREATE TABLE `produk` (
  `ID` int(11) NOT NULL,
  `Tanggal` datetime DEFAULT NULL,
  `Warna` varchar(100) DEFAULT NULL,
  `Jenis_Bahan_ID` int(11) DEFAULT NULL,
  `Ukuran_ID` int(11) DEFAULT NULL,
  `Quantity` int(11) DEFAULT NULL,
  `Created` varchar(30) DEFAULT NULL,
  `createdby` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `produk`
--

INSERT INTO `produk` (`ID`, `Tanggal`, `Warna`, `Jenis_Bahan_ID`, `Ukuran_ID`, `Quantity`, `Created`, `createdby`) VALUES
(16, '2024-07-03 00:00:00', 'Combed Hitam', 5, 2, 1000, '2024-07-03 00:00:00.000000', '0000-00-00');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `produk_vw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `produk_vw` (
`ID` int(11)
,`Tanggal` datetime
,`Warna` varchar(100)
,`Jenis_Bahan_ID` int(11)
,`Ukuran_ID` int(11)
,`Quantity` int(11)
,`Created` varchar(30)
,`createdby` date
,`Ukuran` varchar(100)
,`Nama_Bahan` varchar(100)
);

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `rolemenu_vw`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `rolemenu_vw` (
`ID` int(11)
,`ID_Menu` int(11)
,`Module` varchar(200)
,`PageName` varchar(200)
,`ID_Role` int(11)
,`RoleName` varchar(30)
,`IsCanView` bit(1)
,`IsCanAdd` bit(1)
,`IsCanEdit` bit(1)
,`IsCanDelete` bit(1)
,`IsCanApprove` bit(1)
,`IsCanTerminate` bit(1)
,`IsCanVerify` bit(1)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `rolesmenu`
--

CREATE TABLE `rolesmenu` (
  `ID` int(11) NOT NULL,
  `ID_Menu` int(11) NOT NULL,
  `ID_Role` int(11) NOT NULL,
  `IsCanView` bit(1) NOT NULL,
  `IsCanAdd` bit(1) NOT NULL,
  `IsCanEdit` bit(1) NOT NULL,
  `IsCanDelete` bit(1) NOT NULL,
  `IsCanApprove` bit(1) NOT NULL,
  `IsCanTerminate` bit(1) NOT NULL,
  `IsCanVerify` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `rolesmenu`
--

INSERT INTO `rolesmenu` (`ID`, `ID_Menu`, `ID_Role`, `IsCanView`, `IsCanAdd`, `IsCanEdit`, `IsCanDelete`, `IsCanApprove`, `IsCanTerminate`, `IsCanVerify`) VALUES
(1, 1, 1, b'1', b'1', b'1', b'1', b'1', b'1', b'1'),
(2, 2, 1, b'1', b'1', b'1', b'1', b'1', b'1', b'1'),
(3, 3, 1, b'1', b'1', b'1', b'1', b'1', b'1', b'1'),
(4, 1, 2, b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(5, 2, 2, b'1', b'1', b'1', b'0', b'0', b'0', b'0'),
(6, 3, 2, b'1', b'1', b'1', b'0', b'0', b'0', b'0'),
(7, 1, 3, b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(8, 2, 3, b'0', b'0', b'0', b'0', b'0', b'0', b'0'),
(9, 3, 3, b'1', b'1', b'0', b'0', b'0', b'0', b'0');

-- --------------------------------------------------------

--
-- Struktur dari tabel `ukuran`
--

CREATE TABLE `ukuran` (
  `ID` int(11) NOT NULL,
  `Ukuran` varchar(100) DEFAULT NULL,
  `Keterangan` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `ukuran`
--

INSERT INTO `ukuran` (`ID`, `Ukuran`, `Keterangan`) VALUES
(1, 'S', 'Small'),
(2, 'M', 'Medium'),
(3, 'L', 'Large'),
(4, 'XL', 'Extra Large'),
(5, 'XXL', 'Extra Extra Large'),
(6, '3XL', 'Extra 3 Large');

-- --------------------------------------------------------

--
-- Stand-in struktur untuk tampilan `userrole`
-- (Lihat di bawah untuk tampilan aktual)
--
CREATE TABLE `userrole` (
`UserID` int(11)
,`UserName` varchar(30)
,`URoleID` int(11)
,`RoleName` varchar(30)
);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users`
--

CREATE TABLE `users` (
  `UserID` int(11) NOT NULL,
  `UserName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `URoleID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users`
--

INSERT INTO `users` (`UserID`, `UserName`, `URoleID`) VALUES
(1, 'rikkysaputra8@gmail.com', 1),
(2, 'rikkywahyu5@gmail.com', 2),
(3, 'rikky2@gmail.com', 3);

-- --------------------------------------------------------

--
-- Struktur dari tabel `users_role`
--

CREATE TABLE `users_role` (
  `RoleID` int(11) NOT NULL,
  `RoleName` varchar(30) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data untuk tabel `users_role`
--

INSERT INTO `users_role` (`RoleID`, `RoleName`) VALUES
(1, 'Admin'),
(2, 'Gudang'),
(3, 'Stoker');

-- --------------------------------------------------------

--
-- Struktur untuk view `pesanan_produk_vw`
--
DROP TABLE IF EXISTS `pesanan_produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan_produk_vw`  AS SELECT `prdk`.`ID` AS `ID`, `prdk`.`Tanggal` AS `Tanggal`, `prdk`.`Warna` AS `Warna`, `prdk`.`Jenis_Bahan_ID` AS `Jenis_Bahan_ID`, `prdk`.`Ukuran_ID` AS `Ukuran_ID`, `prdk`.`Quantity` AS `qtyStok`, `prdk`.`Created` AS `Created`, `prdk`.`createdby` AS `createdby`, `ukrn`.`Ukuran` AS `Ukuran`, `jnbn`.`Nama_Bahan` AS `Nama_Bahan`, `pesanan`.`Quantity` AS `qtyPesan` FROM (((`produk` `prdk` left join `ukuran` `ukrn` on(`prdk`.`Ukuran_ID` = `ukrn`.`ID`)) left join `jenis_bahan` `jnbn` on(`prdk`.`Jenis_Bahan_ID` = `jnbn`.`ID`)) left join `pesanan` on(`prdk`.`ID` = `pesanan`.`Id_Produk`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `pesanan_vw`
--
DROP TABLE IF EXISTS `pesanan_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `pesanan_vw`  AS SELECT `pesn`.`ID` AS `ID`, `pesn`.`Tanggal` AS `Tanggal`, `pesn`.`Warna` AS `Warna`, `pesn`.`Jenis_Bahan_ID` AS `Jenis_Bahan_ID`, `pesn`.`Ukuran_ID` AS `Ukuran_ID`, `pesn`.`Quantity` AS `Quantity`, `pesn`.`Created` AS `Created`, `pesn`.`createdby` AS `createdby`, `pesn`.`Id_Produk` AS `Id_Produk`, `ukrn`.`Ukuran` AS `Ukuran`, `jnbn`.`Nama_Bahan` AS `Nama_Bahan` FROM (((`pesanan` `pesn` left join `ukuran` `ukrn` on(`pesn`.`Ukuran_ID` = `ukrn`.`ID`)) left join `jenis_bahan` `jnbn` on(`pesn`.`Jenis_Bahan_ID` = `jnbn`.`ID`)) left join `produk` `prdk` on(`pesn`.`Id_Produk` = `prdk`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `produk_vw`
--
DROP TABLE IF EXISTS `produk_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `produk_vw`  AS SELECT `prdk`.`ID` AS `ID`, `prdk`.`Tanggal` AS `Tanggal`, `prdk`.`Warna` AS `Warna`, `prdk`.`Jenis_Bahan_ID` AS `Jenis_Bahan_ID`, `prdk`.`Ukuran_ID` AS `Ukuran_ID`, `prdk`.`Quantity` AS `Quantity`, `prdk`.`Created` AS `Created`, `prdk`.`createdby` AS `createdby`, `ukrn`.`Ukuran` AS `Ukuran`, `jnbn`.`Nama_Bahan` AS `Nama_Bahan` FROM ((`produk` `prdk` left join `ukuran` `ukrn` on(`prdk`.`Ukuran_ID` = `ukrn`.`ID`)) left join `jenis_bahan` `jnbn` on(`prdk`.`Jenis_Bahan_ID` = `jnbn`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `rolemenu_vw`
--
DROP TABLE IF EXISTS `rolemenu_vw`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `rolemenu_vw`  AS SELECT `rolesmenu`.`ID` AS `ID`, `rolesmenu`.`ID_Menu` AS `ID_Menu`, `menu`.`Module` AS `Module`, `menu`.`PageName` AS `PageName`, `rolesmenu`.`ID_Role` AS `ID_Role`, `users_role`.`RoleName` AS `RoleName`, `rolesmenu`.`IsCanView` AS `IsCanView`, `rolesmenu`.`IsCanAdd` AS `IsCanAdd`, `rolesmenu`.`IsCanEdit` AS `IsCanEdit`, `rolesmenu`.`IsCanDelete` AS `IsCanDelete`, `rolesmenu`.`IsCanApprove` AS `IsCanApprove`, `rolesmenu`.`IsCanTerminate` AS `IsCanTerminate`, `rolesmenu`.`IsCanVerify` AS `IsCanVerify` FROM ((`users_role` join `rolesmenu` on(`users_role`.`RoleID` = `rolesmenu`.`ID_Role`)) join `menu` on(`rolesmenu`.`ID_Menu` = `menu`.`ID`)) ;

-- --------------------------------------------------------

--
-- Struktur untuk view `userrole`
--
DROP TABLE IF EXISTS `userrole`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `userrole`  AS SELECT `usr`.`UserID` AS `UserID`, `usr`.`UserName` AS `UserName`, `usr`.`URoleID` AS `URoleID`, `usrrole`.`RoleName` AS `RoleName` FROM (`users` `usr` join `users_role` `usrrole` on(`usr`.`URoleID` = `usrrole`.`RoleID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indeks untuk tabel `jenis_bahan`
--
ALTER TABLE `jenis_bahan`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `produk`
--
ALTER TABLE `produk`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `rolesmenu`
--
ALTER TABLE `rolesmenu`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `ukuran`
--
ALTER TABLE `ukuran`
  ADD PRIMARY KEY (`ID`);

--
-- Indeks untuk tabel `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`UserID`);

--
-- Indeks untuk tabel `users_role`
--
ALTER TABLE `users_role`
  ADD PRIMARY KEY (`RoleID`);

--
-- AUTO_INCREMENT untuk tabel yang dibuang
--

--
-- AUTO_INCREMENT untuk tabel `jenis_bahan`
--
ALTER TABLE `jenis_bahan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT untuk tabel `menu`
--
ALTER TABLE `menu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `pesanan`
--
ALTER TABLE `pesanan`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT untuk tabel `produk`
--
ALTER TABLE `produk`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT untuk tabel `rolesmenu`
--
ALTER TABLE `rolesmenu`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT untuk tabel `ukuran`
--
ALTER TABLE `ukuran`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT untuk tabel `users`
--
ALTER TABLE `users`
  MODIFY `UserID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT untuk tabel `users_role`
--
ALTER TABLE `users_role`
  MODIFY `RoleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
