-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 23 Eki 2018, 18:19:47
-- Sunucu sürümü: 10.1.35-MariaDB
-- PHP Sürümü: 7.2.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `fakenex`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `atmler`
--

CREATE TABLE `atmler` (
  `atmid` int(3) NOT NULL,
  `atmPos` varchar(56) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `atmler`
--

INSERT INTO `atmler` (`atmid`, `atmPos`) VALUES
(0, '-1576.41|901.597|7.08847|0.0|0.0|178.8'),
(1, '-1781.34|965.963|24.3444|0.0|0.0|-179.1'),
(2, '-2650.73|-22.5331|5.68281|0.0|0.0|0.0'),
(3, '-2680.42|-281.475|6.76166|0.0|0.0|133.7'),
(4, '-2799.44|276.381|6.78212|0.0|0.0|-92.7'),
(5, '-2637.03|635.803|14.0231|0.0|0.0|-88.6'),
(6, '-2454.08|754.87|34.7419|0.0|0.0|0.0'),
(7, '-2353.46|1002.34|50.4185|0.0|0.0|-92.8'),
(8, '-2351.17|1217.96|34.1046|0.0|0.0|-89.5'),
(9, '-1870.74|1422.57|6.80301|0.0|0.0|45.1'),
(10, '-2658.75|1335.61|6.62809|0.0|0.0|88.1'),
(11, '-1991.71|1273.13|7.1075|0.0|0.0|178.0'),
(12, '-1723.14|1278.06|6.69273|0.0|0.0|-135.3'),
(13, '-2066.62|553.726|34.7719|0.0|0.0|179.5'),
(14, '-1571.32|670.188|6.74906|0.0|0.0|89.3'),
(15, '-1635.36|434.784|6.7675|0.0|0.0|44.4'),
(16, '-1902.13|504.633|34.7819|0.0|0.0|0.0'),
(17, '-1979.01|169.771|27.2575|0.0|0.0|179.8'),
(18, '-2431.37|-115.068|34.9425|0.0|0.0|90.0'),
(20, '-2102.24|-58.0678|34.9203|0.0|0.0|84.7'),
(21, '-2284.31|-116.287|34.9203|0.0|0.0|0.0'),
(22, '-2242.42|22.2118|34.8919|0.0|0.0|-89.9'),
(23, '-2649.72|373.637|5.60321|0.0|0.0|-91.9'),
(24, '-2571.75|477.911|14.1994|0.0|0.0|0.0'),
(25, '-2181.44|217.972|34.9019|0.0|0.0|0.0'),
(26, '-1931.4|883.742|35.0441|0.0|0.0|89.6999'),
(27, '-2036.01|-102.023|34.7641|0.0|0.0|179.0'),
(28, '-1911.4|748.693|45.0553|0.0|0.0|89.9999'),
(29, '-2107.04|721.669|69.1525|0.0|0.0|-179.6'),
(30, '-1947.98|1190.38|45.0653|0.0|0.0|0.0'),
(31, '-1714.59|1207.11|24.6892|0.0|0.0|44.7'),
(32, '1317.26|-648.84|108.765|0.0|0.0|164.3'),
(33, '-2546.55|2306.60|4.58|0.00|0.00|-82.10'),
(34, '-2455.64|2317.95|4.59|0.00|0.00|-95.49');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `banlistesi`
--

CREATE TABLE `banlistesi` (
  `banid` int(11) NOT NULL,
  `Banlayan` varchar(24) NOT NULL,
  `Banlanan` varchar(24) NOT NULL,
  `Sebep` varchar(100) NOT NULL,
  `YGA` int(11) NOT NULL,
  `IpAdres` varchar(17) NOT NULL,
  `BanSure` int(11) NOT NULL DEFAULT '0',
  `HWID` varchar(70) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `basarilar`
--

CREATE TABLE `basarilar` (
  `baid` int(11) NOT NULL,
  `bSahip` varchar(24) NOT NULL,
  `BasariSayisi` int(3) NOT NULL,
  `ilkGiris` int(3) NOT NULL,
  `ilkMesaj` int(3) NOT NULL,
  `ilkOldurme` int(3) NOT NULL,
  `ilkSoygun` int(3) NOT NULL,
  `ilkPolis` int(3) NOT NULL,
  `ilkCevikKuvvet` int(3) NOT NULL,
  `ilkOzelHarekat` int(3) NOT NULL,
  `ilkMit` int(3) NOT NULL,
  `ilksPolis` int(3) NOT NULL,
  `ilkozelK` int(3) NOT NULL,
  `ilkHavaKuvvet` int(3) NOT NULL,
  `ilkSucluYa` int(3) NOT NULL,
  `ilkEv` int(3) NOT NULL,
  `ilkSafir` int(3) NOT NULL,
  `ilkYakut` int(3) NOT NULL,
  `ilkZumrut` int(3) NOT NULL,
  `ilkElmas` int(3) NOT NULL,
  `ilkoYuz` int(3) NOT NULL,
  `ilkoBesyuz` int(3) NOT NULL,
  `ilkoBin` int(3) NOT NULL,
  `ilkoBesBin` int(3) NOT NULL,
  `ilkoOnBin` int(3) NOT NULL,
  `ilkYuzSoygun` int(3) NOT NULL,
  `ilkikiyuzElli` int(3) NOT NULL,
  `ilksBesyuz` int(3) NOT NULL,
  `ilksBesbin` int(3) NOT NULL,
  `ilksOnBin` int(3) NOT NULL,
  `ilkYirmiBinSkor` int(3) NOT NULL,
  `ilkOtuzBinSkor` int(3) NOT NULL,
  `ilkDortBinSkor` int(3) NOT NULL,
  `ilkElliBinSkor` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `bolgeler`
--

CREATE TABLE `bolgeler` (
  `bid` int(3) NOT NULL,
  `bIsim` varchar(25) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `bolgeSahip` varchar(24) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `bolgeGelir` int(11) NOT NULL,
  `bolgeSkor` int(11) NOT NULL,
  `fX` float NOT NULL,
  `fY` float NOT NULL,
  `fZ` float NOT NULL,
  `fA` float NOT NULL,
  `LposX` float NOT NULL,
  `LposY` float NOT NULL,
  `LposZ` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cetearaclari`
--

CREATE TABLE `cetearaclari` (
  `caid` int(11) NOT NULL,
  `CeteSahipID` int(3) NOT NULL,
  `CeteAModel` int(3) NOT NULL,
  `CeteaPosX` float NOT NULL,
  `CeteaPosY` float NOT NULL,
  `CeteaPosZ` float NOT NULL,
  `CeteaPosA` float NOT NULL,
  `CeteaR1` int(3) NOT NULL,
  `CeteaR2` int(3) NOT NULL,
  `PaintJob` int(3) NOT NULL,
  `aP1` int(7) NOT NULL,
  `aP2` int(7) NOT NULL,
  `aP3` int(7) NOT NULL,
  `aP4` int(7) NOT NULL,
  `aP5` int(7) NOT NULL,
  `aP6` int(7) NOT NULL,
  `aP7` int(7) NOT NULL,
  `aP8` int(7) NOT NULL,
  `aP9` int(7) NOT NULL,
  `aP10` int(7) NOT NULL,
  `aP11` int(7) NOT NULL,
  `aP12` int(7) NOT NULL,
  `aP13` int(7) NOT NULL,
  `aP14` int(7) NOT NULL,
  `aP15` int(7) NOT NULL,
  `aP16` int(7) NOT NULL,
  `aP17` int(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cetebagis`
--

CREATE TABLE `cetebagis` (
  `cbid` int(11) NOT NULL,
  `ceteid` int(3) NOT NULL,
  `Bagisim` varchar(24) NOT NULL,
  `Bagisi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ceteler`
--

CREATE TABLE `ceteler` (
  `cid` int(3) NOT NULL,
  `cIsim` varchar(25) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `cPosX` float NOT NULL,
  `cPosY` float NOT NULL,
  `cPosZ` float NOT NULL,
  `cPosA` int(11) NOT NULL,
  `cSposX` float NOT NULL,
  `cSposY` float NOT NULL,
  `cSposZ` float NOT NULL,
  `cSahip1` varchar(24) NOT NULL,
  `cSahip2` varchar(24) NOT NULL,
  `cSahip3` varchar(24) NOT NULL,
  `cSahip4` varchar(24) NOT NULL,
  `ceteKasasi` int(18) NOT NULL,
  `ceteRengi` varchar(7) NOT NULL,
  `ceteTagi` varchar(8) NOT NULL,
  `ceteSeviye` int(2) NOT NULL,
  `CeteOldurme` int(11) NOT NULL,
  `ceteOlum` int(11) NOT NULL,
  `ceteGod` int(2) NOT NULL,
  `ceteSkin` int(2) NOT NULL,
  `ceteAracKapasite` int(3) NOT NULL,
  `AR1` int(3) NOT NULL,
  `AR2` int(3) NOT NULL,
  `CeteDeger` int(2) NOT NULL DEFAULT '0',
  `CetePuan` int(11) NOT NULL,
  `Plaka` varchar(10) NOT NULL,
  `dostCete` varchar(120) NOT NULL,
  `dostgode` int(2) NOT NULL,
  `CeteSayi` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `cetemekan`
--

CREATE TABLE `cetemekan` (
  `ceteMekanid` int(3) NOT NULL,
  `ceteMekanIsmi` varchar(48) NOT NULL,
  `ceteMekanSahip` int(5) NOT NULL,
  `cmX` float NOT NULL,
  `cmY` float NOT NULL,
  `cmRX` float NOT NULL,
  `cmRY` float NOT NULL,
  `cmLX` float NOT NULL,
  `cmLY` float NOT NULL,
  `cmLZ` float NOT NULL,
  `ceteMekanRenk` varchar(7) NOT NULL,
  `ceteBolgeSure` int(11) NOT NULL,
  `ceteTip` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `cetemekan`
--

INSERT INTO `cetemekan` (`ceteMekanid`, `ceteMekanIsmi`, `ceteMekanSahip`, `cmX`, `cmY`, `cmRX`, `cmRY`, `cmLX`, `cmLY`, `cmLZ`, `ceteMekanRenk`, `ceteBolgeSure`, `ceteTip`) VALUES
(0, 'Depo', 3, -2199.69, -282.43, -2084.69, -78.4305, -2134.69, -182.43, 35.3203, 'FF3030', 43, 3),
(1, 'Terkedilmiþ Maden', 3, -1926.96, -1685.31, -1786.96, -1545.31, -1856.96, -1615.31, 21.7858, 'FF3030', 43, 3),
(2, 'Dað Evi', 3, -2885.67, -1591.07, -2745.67, -1451.07, -2815.67, -1521.07, 140.844, 'FF3030', 43, 3),
(3, 'Çiftlikbank', -1, -767.301, 870.505, -607.301, 1030.5, -687.301, 950.505, 12.1394, '000000', 0, 0),
(4, 'Tren Ýstasyonu', 6, -1959.89, 33.8123, -1911.89, 211.812, -1939.89, 163.812, 26.2812, '00FA9A', 43, 3),
(5, 'Park', 6, -1993.79, 857.835, -1908.79, 912.835, -1953.79, 882.835, 42.1097, '00FA9A', 43, 3),
(6, 'Insaat', 7, -2133.56, 119.182, -2013.56, 309.182, -2073.56, 219.182, 35.8871, '13FF00', 2015, 4),
(7, 'Deðirmen', 2, -1500.32, -1596.18, -1400.32, -1416.18, -1440.32, -1506.18, 101.744, 'FF0000', 43, 3),
(8, 'Ambar Deposu', -1, -625.786, -564.183, -455.786, -454.183, -545.786, -504.183, 25.5234, '000000', 0, 0),
(9, 'Liman', 6, -2515.86, 2183.61, -2415.86, 2283.61, -2465.86, 2233.61, 4.80592, '00FA9A', 51534, 4),
(10, 'Köy', 3, -1203, -1072.21, -990.002, -910.205, -1100, -1002.21, 129.219, 'FF3030', 169161, 4),
(11, 'Doðalgaz Ýstasyonu', 6, -1127.09, -762.864, -965.088, -582.864, -1035.09, -662.864, 32.0126, '00FA9A', 43, 3),
(12, 'Kasaba', 2, -908.338, 1377.66, -628.338, 1657.66, -808.338, 1557.66, 26.9609, 'FF0000', 43, 3),
(13, 'El Quebrados', 2, -1561.44, 2501.01, -1341.44, 2721.01, -1461.44, 2601.01, 55.6875, 'FF0000', 43, 3),
(14, 'Havaalaný', 2, 50.7907, 2403.49, 500.791, 2653.49, 400.791, 2503.49, 16.4844, 'FF0000', 169164, 4),
(15, 'Big Ear', 2, -432.859, 1515.03, -292.859, 1655.03, -362.859, 1585.03, 76.4913, 'FF0000', 43, 3),
(16, 'Benzin Ýstasyonu', 2, 97.6999, 1336.21, 302.7, 1486.21, 272.7, 1411.21, 10.4503, 'FF0000', 43, 3),
(17, 'Kesimhane', 2, -585.42, -199.922, -425.42, -39.9217, -505.42, -119.922, 65.6876, 'FF0000', 43, 3),
(18, 'Karaambar Kamyoncular Derneði', 2, 9.79637, -382.694, 169.796, -222.694, 89.7964, -302.694, 1.57812, 'FF0000', 43, 3),
(19, 'TERKEDÝLMÝÞ KASABA', 2, -455.802, 2147.5, -305.802, 2297.5, -380.802, 2222.5, 42.0938, 'FF0000', 43, 3),
(20, 'Laboratuvar', -1, -1996.42, 624.744, -1906.42, 724.744, -1951.42, 684.744, 46.5625, '000000', 0, 0);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `evler`
--

CREATE TABLE `evler` (
  `eid` int(3) NOT NULL,
  `EvIsmi` varchar(48) NOT NULL,
  `EvSahibi` varchar(24) NOT NULL,
  `EvX` float NOT NULL,
  `EvY` float NOT NULL,
  `EvZ` float NOT NULL,
  `EvFiyat` int(11) NOT NULL DEFAULT '0',
  `evOrjinalFiyat` int(11) NOT NULL DEFAULT '0',
  `evDurumu` int(1) NOT NULL DEFAULT '0',
  `evSeviyesi` int(2) NOT NULL DEFAULT '0',
  `evSifresi` varchar(24) NOT NULL,
  `evVirtual` int(11) NOT NULL DEFAULT '0',
  `evPara` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kiyafet`
--

CREATE TABLE `kiyafet` (
  `kid` int(11) NOT NULL,
  `KiyafetSahip` varchar(24) NOT NULL,
  `kModel` int(5) NOT NULL,
  `kBone` int(2) NOT NULL,
  `kX` float NOT NULL,
  `kY` float NOT NULL,
  `kZ` float NOT NULL,
  `kRX` float NOT NULL,
  `kRY` float NOT NULL,
  `kRZ` float NOT NULL,
  `kSX` float NOT NULL,
  `kSY` float NOT NULL,
  `kSZ` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `normalarac`
--

CREATE TABLE `normalarac` (
  `nid` int(11) NOT NULL,
  `aModel` int(3) NOT NULL,
  `aSahip` varchar(24) NOT NULL,
  `aX` float NOT NULL,
  `aY` float NOT NULL,
  `aZ` float NOT NULL,
  `aA` float NOT NULL,
  `aR1` int(3) NOT NULL,
  `aR2` int(3) NOT NULL,
  `PaintJob` int(2) NOT NULL,
  `aP1` int(3) NOT NULL,
  `aP2` int(3) NOT NULL,
  `aP3` int(3) NOT NULL,
  `aP4` int(3) NOT NULL,
  `aP5` int(3) NOT NULL,
  `aP6` int(3) NOT NULL,
  `aP7` int(3) NOT NULL,
  `aP8` int(3) NOT NULL,
  `aP9` int(3) NOT NULL,
  `aP10` int(3) NOT NULL,
  `aP11` int(3) NOT NULL,
  `aP12` int(3) NOT NULL,
  `aP13` int(3) NOT NULL,
  `aP14` int(3) NOT NULL,
  `aP15` int(3) NOT NULL,
  `aP16` int(3) NOT NULL,
  `aP17` int(3) NOT NULL,
  `Plaka` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oyuncuveri`
--

CREATE TABLE `oyuncuveri` (
  `id` int(11) NOT NULL,
  `isim` varchar(24) NOT NULL,
  `sifre` varchar(65) NOT NULL,
  `saltsifre` varchar(17) NOT NULL,
  `orjSifre` varchar(65) NOT NULL,
  `oldurme` int(11) NOT NULL DEFAULT '0',
  `olum` int(11) NOT NULL DEFAULT '0',
  `aLevel` int(2) NOT NULL DEFAULT '0',
  `AdminSure` int(11) NOT NULL DEFAULT '0',
  `BanDeger` int(1) NOT NULL DEFAULT '0',
  `IpKayit` varchar(16) NOT NULL,
  `rLevel` int(1) NOT NULL DEFAULT '0',
  `dLevel` int(1) NOT NULL DEFAULT '0',
  `Para` int(11) NOT NULL DEFAULT '0',
  `Skor` int(11) NOT NULL DEFAULT '0',
  `AranmaS` int(4) NOT NULL DEFAULT '0',
  `VipL` int(2) NOT NULL DEFAULT '0',
  `VipSure` int(11) NOT NULL DEFAULT '0',
  `BankaPara` int(11) NOT NULL DEFAULT '0',
  `HapisSure` int(11) NOT NULL DEFAULT '0',
  `HapisSureK` int(11) NOT NULL DEFAULT '0',
  `SonGiris` int(11) NOT NULL DEFAULT '0',
  `KayitTarih` int(11) NOT NULL,
  `SoygunS` int(11) NOT NULL,
  `OnlineSure` int(200) NOT NULL,
  `ExpLevel` int(3) NOT NULL DEFAULT '1',
  `ExpPuan` int(11) NOT NULL DEFAULT '0',
  `YetenekPuan` int(3) NOT NULL,
  `YetenekCan` int(3) NOT NULL,
  `YetenekZirh` int(3) NOT NULL,
  `YetenekSoygun` int(3) NOT NULL,
  `kiyafetDurum` int(1) NOT NULL,
  `ceteid` int(2) NOT NULL,
  `CeteRutbe` varchar(21) NOT NULL,
  `pmGorme` int(2) NOT NULL,
  `LocalGorme` int(2) NOT NULL,
  `ArGorme` int(2) NOT NULL,
  `GrupGorme` int(2) NOT NULL,
  `EkipGorme` int(2) NOT NULL,
  `ceteGorme` int(2) NOT NULL,
  `realSaat` int(2) NOT NULL,
  `duzenliOyuncu` int(2) NOT NULL,
  `evid` int(5) NOT NULL DEFAULT '-1',
  `KralTag` int(2) NOT NULL DEFAULT '0',
  `forumnick` varchar(24) NOT NULL,
  `KonusmaYasagi` int(6) NOT NULL DEFAULT '0',
  `textAyar` int(1) NOT NULL DEFAULT '0',
  `bonzai` int(3) NOT NULL,
  `eroin` int(3) NOT NULL,
  `ot` int(3) NOT NULL,
  `bomba` int(3) NOT NULL,
  `yakalama` int(11) NOT NULL,
  `yakalanma` int(11) NOT NULL,
  `kelepceleme` int(11) NOT NULL,
  `kelepcelenme` int(11) NOT NULL,
  `Bakiye` int(6) NOT NULL,
  `BakiyeS1` int(12) NOT NULL,
  `BakiyeS2` int(12) NOT NULL,
  `BakiyeS3` int(12) NOT NULL,
  `BakiyeS4` int(12) NOT NULL,
  `BakiyeS5` int(12) NOT NULL,
  `adonline` int(11) NOT NULL,
  `adafkonline` int(11) NOT NULL,
  `akomuts` int(6) NOT NULL,
  `yanits` int(6) NOT NULL,
  `dsarki` int(6) NOT NULL,
  `dmkapat` int(6) NOT NULL,
  `etkyetki` int(2) NOT NULL,
  `cskinlan` int(2) NOT NULL,
  `kefaletmod` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=COMPACT;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `ozelarac`
--

CREATE TABLE `ozelarac` (
  `id` int(11) NOT NULL,
  `Sahip` varchar(24) NOT NULL,
  `model` int(4) NOT NULL,
  `pos` varchar(48) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `siparis`
--

CREATE TABLE `siparis` (
  `id` int(11) NOT NULL,
  `Odeyen` varchar(24) NOT NULL,
  `NeAldi` varchar(100) NOT NULL,
  `tarih` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `soygunlar`
--

CREATE TABLE `soygunlar` (
  `sid` int(3) NOT NULL,
  `soygunIsim` varchar(50) CHARACTER SET utf8 COLLATE utf8_turkish_ci NOT NULL,
  `gCpX` float NOT NULL,
  `gCpY` float NOT NULL,
  `gCpZ` float NOT NULL,
  `GirisPosX` float NOT NULL,
  `GirisPosY` float NOT NULL,
  `GirisPosZ` float NOT NULL,
  `GirisPosA` float NOT NULL,
  `cCpX` float NOT NULL,
  `cCpY` float NOT NULL,
  `cCpZ` float NOT NULL,
  `CikisPosX` float NOT NULL,
  `CikisPosY` float NOT NULL,
  `CikisPosZ` float NOT NULL,
  `CikisPosA` float NOT NULL,
  `sCpX` float NOT NULL,
  `sCpY` float NOT NULL,
  `sCpZ` float NOT NULL,
  `sInterior` int(3) NOT NULL,
  `sVW` int(3) NOT NULL,
  `soygunSure` int(3) NOT NULL,
  `iDurum` int(2) NOT NULL,
  `sIcon` int(2) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Tablo döküm verisi `soygunlar`
--

INSERT INTO `soygunlar` (`sid`, `soygunIsim`, `gCpX`, `gCpY`, `gCpZ`, `GirisPosX`, `GirisPosY`, `GirisPosZ`, `GirisPosA`, `cCpX`, `cCpY`, `cCpZ`, `CikisPosX`, `CikisPosY`, `CikisPosZ`, `CikisPosA`, `sCpX`, `sCpY`, `sCpZ`, `sInterior`, `sVW`, `soygunSure`, `iDurum`, `sIcon`) VALUES
(0, 'Binco', -2374.5, 910.131, 45.4453, 207.592, -107.876, 1005.13, 359.04, 207.616, -110.711, 1005.13, -2377.97, 909.923, 45.4453, 87.9067, 207.762, -97.785, 1005.26, 15, 1, 0, 0, 45),
(1, 'Defacto', -1694.75, 950.727, 24.8906, 225.601, -8.45466, 1002.21, 93.7482, 226.914, -8.13387, 1002.21, -1697.77, 947.848, 24.8906, 138.777, 204.608, -8.32501, 1001.21, 5, 2, 0, 0, 45),
(2, 'Audi Bayii', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1657.87, 1207.38, 7.24944, 0, 0, 0, 1, 55),
(3, 'Clucking Bell', -1816.62, 617.932, 35.1719, 364.924, -8.06466, 1001.85, 357.676, 364.892, -11.2187, 1001.85, -1816.87, 614.697, 35.1719, 180.502, 370.045, -6.67154, 1001.86, 9, 4, 0, 0, 14),
(4, 'Stacked PIZZA', -1721.61, 1359.86, 7.18532, 372.862, -130.879, 1001.49, 359.029, 372.433, -133.083, 1001.49, -1724.33, 1360.06, 7.1875, 85.5939, 375.798, -115.654, 1001.49, 5, 5, 0, 0, 29),
(5, 'Hotel', -2351.8, 493.086, 30.8251, 245.886, 305.241, 999.148, 274.668, 244.583, 305.029, 999.148, -2356.41, 495.509, 30.9102, 59.782, 248.36, 302.127, 999.148, 1, 6, 0, 0, 44),
(6, 'Jizzy', -2624.49, 1412.06, 7.09375, 1204.93, -9.50862, 1000.92, 357.836, 1204.69, -13.238, 1000.92, -2624.59, 1409.11, 7.10156, 190.048, 1210.84, -15.0791, 1000.92, 2, 7, 0, 0, 49),
(7, 'Burger King', -2335.47, -154.744, 35.3288, 366.998, -72.7854, 1001.51, 302.504, 363.327, -74.6997, 1001.51, -2339.81, -154.945, 35.3288, 90.5538, 372.786, -65.2902, 1001.51, 10, 8, 0, 0, 10),
(8, 'Restaurant', -2524.15, 1216.13, 37.5483, 455.323, -89.1323, 999.555, 90.4075, 459.806, -88.6691, 999.555, -2520.48, 1216.17, 37.4283, 269.682, 450.38, -81.0855, 999.555, 4, 9, 0, 0, 50),
(9, 'Koton', -1883.11, 865.6, 35.1869, 222.646, -8.1283, 1002.21, 86.0184, 226.592, -8.24687, 1002.21, -1887.19, 861.765, 35.1719, 134.949, 204.619, -8.04477, 1001.21, 5, 10, 0, 0, 45),
(10, 'Opet FullMarket', -2032.52, 161.468, 29.0598, -27.5377, -54.1238, 1003.55, 6.19853, -27.4284, -57.3649, 1003.55, -2029.53, 161.722, 28.8496, 281.332, -23.7972, -57.6261, 1003.55, 6, 11, 0, 0, 63),
(11, 'Hamburgerci', -1911.8, 828.624, 35.1746, 364.372, -74.0368, 1001.51, 314.844, 363.34, -74.679, 1001.51, -1909.8, 831.202, 35.1719, 327.846, 375.968, -65.2946, 1001.51, 10, 12, 0, 0, 10),
(12, 'Dominos Pizza', -1808.16, 945.343, 24.8906, 370.983, -128.33, 1001.49, 356.479, 372.385, -132.841, 1001.49, -1805.67, 942.604, 24.8906, 228.703, 377.081, -115.423, 1001.49, 5, 13, 0, 0, 29),
(13, 'Surucu kursu', -2026.64, -100.89, 35.1641, -2029.8, -106.928, 1035.17, 183.737, -2026.9, -104.165, 1035.17, -2027.48, -97.3646, 35.1641, 359.117, -2034.75, -114.926, 1035.17, 3, 14, 0, 0, 36),
(14, 'Hamburgerci', -2356.66, 1008.02, 50.8984, 364.367, -73.9411, 1001.51, 296.059, 363.249, -74.7198, 1001.51, -2362.66, 1010.03, 50.6953, 91.2505, 375.852, -65.0584, 1001.51, 10, 15, 0, 0, 10),
(15, 'BIM', -2442.54, 754.196, 35.1984, -25.7292, -185.404, 1003.55, 0.818288, -25.8676, -187.685, 1003.55, -2442.74, 750.33, 35.1786, 183.992, -29.0544, -187.051, 1003.55, 17, 16, 0, 0, 17),
(16, 'MIGROS', -2343.19, -95.9612, 35.6003, -34.503, -89.7381, 1003.55, 267.062, -30.9553, -91.5321, 1003.55, -2347.91, -95.8437, 35.6003, 90.8689, -24.9774, -91.0981, 1003.55, 18, 17, 0, 0, 50),
(17, 'Tren Istasyonu', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1972.55, 118.59, 27.6959, 0, 0, 0, 1, 42),
(18, 'Berber', -2570.71, 246.128, 10.1129, 412.008, -51.84, 1001.9, 1.96802, 411.838, -53.7378, 1001.9, -2569.07, 243.149, 10.1682, 221.765, 412.022, -48.9858, 1001.9, 12, 19, 0, 0, 7),
(19, 'Clucking Bell', -2672.29, 259.492, 4.63281, 364.825, -7.94611, 1001.85, 359.453, 364.922, -11.196, 1001.85, -2672.27, 263.143, 4.63281, 359.676, 369.546, -6.91868, 1001.86, 9, 20, 0, 0, 14),
(20, 'Donuts', -2766.94, 788.864, 52.7812, 378.277, -189.741, 1000.63, 1.26949, 377.124, -192.572, 1000.63, -2764.27, 791.149, 52.7812, 1.1491, 381.265, -187.957, 1000.63, 17, 21, 0, 0, 17),
(21, 'Kebapci Calal', -2685.76, 371.942, 4.38558, 372.052, -130.768, 1001.49, 359.786, 372.276, -132.798, 1001.49, -2685.46, 375.628, 4.37478, 1.87064, 376.955, -116.074, 1001.49, 5, 22, 0, 0, 10),
(22, 'Zero', -2242.98, 136.87, 35.3203, -2239.43, 131.851, 1035.41, 357.96, -2240.24, 128.366, 1035.42, -2246.03, 137.122, 35.3203, 90.6771, -2221.86, 134.54, 1035.63, 6, 23, 0, 0, 47),
(23, 'Fabrika', -1810.2, 902.483, 24.8906, 1075.82, 2080.44, 10.8203, 6.63646, 1075.68, 2077.75, 10.8203, -1807.42, 905.741, 24.8906, 324.9, 1092.71, 2094.83, 15.3504, 0, 24, 0, 0, 59),
(24, 'Sex Shop', -2278.55, 707.13, 49.4453, -100.147, -22.5921, 1000.72, 357.678, -100.335, -23.8417, 1000.72, -2275.13, 707.265, 49.4453, 263.069, -104.606, -8.36716, 1000.72, 3, 25, 0, 0, 21),
(25, 'Benzinci', -2419.57, 969.937, 45.2969, -25.883, -138.896, 1003.55, 359.116, -25.9864, -140.953, 1003.55, -2415.75, 969.209, 45.2969, 267.121, -20.9817, -140.335, 1003.55, 16, 26, 0, 0, 63),
(26, 'Silah Dukkani', -2625.8, 208.934, 4.61764, 301.771, -78.7701, 1001.52, 180.64, 301.791, -77.216, 1001.52, -2625.66, 212.395, 4.62391, 0.052339, 295.367, -83.9411, 1001.52, 4, 27, 0, 0, 6),
(27, 'ÝbretAlem', -1675.89, 431.799, 7.17969, 1292.86, 0.537169, 1001.02, 177.826, 1293.12, 6.52833, 1001.01, -1675.33, 431.454, 7.17969, 221.188, 1270.85, 5.31327, 1001.02, 18, 28, 0, 0, 23),
(28, 'Drug Dealer', -2027.75, -41.4711, 38.8047, 2543.12, -1309.35, 1027.37, 183.136, 2542.3, -1303.98, 1025.07, -2027.77, -44.5864, 38.4212, 183.632, 2567.44, -1294.18, 1037.77, 2, 29, 0, 0, 24),
(29, 'Ganyan Bayii', -1581.39, 947.961, 7.1875, 831.952, 8.14068, 1004.18, 89.4368, 834.119, 7.42284, 1004.19, -1579.08, 947.868, 7.1875, 270.94, 821.84, 10.3868, 1004.19, 3, 30, 0, 0, 60),
(30, 'Drug House', -2099.65, 898.381, 76.7109, 2324.65, -1145.56, 1050.71, 359.937, 2324.41, -1148.93, 1050.71, -2099.98, 900.61, 76.7109, 88.2371, 2324.28, -1135.75, 1051.3, 12, 31, 0, 0, 24),
(31, 'Doms', -2157.17, 151.351, 35.3203, 207.21, -136.309, 1002.87, 3.52009, 207.061, -139.851, 1003.51, -2155.29, 151.201, 35.3203, 260.687, 207.102, -127.161, 1003.51, 3, 32, 0, 0, 45),
(32, 'SubUrban', -2491.61, -29.0955, 25.7656, 203.844, -47.395, 1001.8, 3.14784, 203.847, -49.6543, 1001.8, -2493.78, -28.9973, 25.7656, 92.9416, 203.677, -40.4293, 1001.8, 1, 33, 0, 0, 45),
(33, 'Hemlock Tattoo', -2492.1, -38.8196, 25.7656, -204.155, -42.1882, 1002.27, 8.67761, -204.56, -43.9008, 1002.27, -2494.31, -38.599, 25.7656, 90.5683, -201.513, -40.3823, 1002.27, 3, 34, 0, 0, 39),
(34, 'Roodie Exchange', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -2514.36, -14.658, 25.6172, 0, 0, 0, 1, 17),
(35, 'Hippy Shopper', -2510.39, -49.837, 25.6841, -99.8171, -22.4128, 1000.72, 3.77413, -100.284, -24.695, 1000.72, -2507.86, -50.0199, 25.6827, 267.153, -105.139, -8.2626, 1000.72, 3, 36, 0, 0, 21),
(36, 'Mistys', -2242.91, -88.1433, 35.3203, 501.891, -70.7096, 998.758, 181.843, 501.967, -68.1202, 998.758, -2245.12, -87.955, 35.3203, 94.1237, 488.355, -79.8001, 998.758, 11, 37, 0, 0, 49),
(37, 'Spor Salonu', -2269.41, -155.875, 35.3203, 774.319, -47.8503, 1000.59, 2.04498, 774.198, -50.001, 1000.59, -2267.3, -155.918, 35.3203, 275.026, 754.579, -41.4063, 1000.59, 6, 38, 0, 0, 54),
(38, 'Kesimhane', -2730.55, 73.7949, 4.33594, 961.734, 2108.24, 1011.03, 89.0838, 964.943, 2107.81, 1011.03, -2730.61, 76.6306, 4.33594, 2.52352, 958.766, 2111.9, 1011.03, 1, 39, 0, 0, 23),
(39, 'Ammo Werehouse', -1976.43, 1273.21, 7.5461, 285.886, -83.5934, 1001.52, 357.213, 285.763, -86.0587, 1001.52, -1976.06, 1277.64, 7.1875, 1.69627, 295.203, -83.501, 1001.52, 4, 40, 0, 0, 18),
(40, 'ResurrectioN™', -2173.11, 679.941, 55.1631, 1292.24, 3.44652, 1001.01, 180.515, 1294.18, 7.04312, 1001.01, -2173.26, 683.337, 55.1635, 2.24603, 1281.17, 5.9641, 1001.01, 18, 41, 0, 0, 23),
(41, 'Museum', -1704.31, 785.71, 25.4743, 1706.73, -1667.65, 20.2259, 267.624, 1701.91, -1667.87, 20.2188, -1708.48, 785.496, 24.7344, 91.9253, 1719.12, -1655.64, 20.0625, 18, 42, 0, 0, 33),
(42, 'Volkswagen Bayii', 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, -1951.75, 296.16, 35.4883, 0, 0, 0, 1, 55),
(43, 'Didier Sachs', -2201.96, 329.658, 35.3203, 204.342, -165.417, 1000.52, 359.905, 204.439, -168.273, 1000.52, -2202.28, 327.496, 35.3203, 178.921, 204.338, -157.612, 1000.52, 14, 44, 0, 0, 45),
(44, 'Ganyan Bayii 2', -2217.14, 577.257, 35.1719, -2161.5, 641.483, 1052.38, 86.6664, -2158.52, 642.676, 1052.38, -2216.8, 575.009, 35.1719, 183.797, -2160.27, 639.301, 1057.59, 1, 45, 0, 0, 43),
(45, 'GOD \'Mekan\'', -89.6192, 1378.28, 10.4698, -227.404, 1401.28, 27.7656, 262.984, -229.003, 1401.28, 27.7656, -86.6411, 1378.8, 10.2734, 280.089, -217.868, 1401.44, 27.7734, 18, 46, 0, 0, 23),
(46, 'Japon Restaurant', -1881.6, 823.199, 35.1766, -795.191, 492.388, 1376.2, 1.68598, -795.042, 490.194, 1376.2, -1885.77, 827.656, 35.1761, 48.669, -787.967, 497.707, 1371.74, 1, 47, 0, 0, 50),
(48, 'GaydarStation', -2552.09, 193.42, 6.15453, 493.55, -20.7221, 1000.68, 358.316, 493.231, -24.1885, 1000.68, -2554.76, 192.734, 6.14009, 102.014, 498.902, -20.7507, 1000.68, 17, 49, 0, 0, 49);

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `atmler`
--
ALTER TABLE `atmler`
  ADD PRIMARY KEY (`atmid`);

--
-- Tablo için indeksler `banlistesi`
--
ALTER TABLE `banlistesi`
  ADD PRIMARY KEY (`banid`);

--
-- Tablo için indeksler `basarilar`
--
ALTER TABLE `basarilar`
  ADD PRIMARY KEY (`baid`);

--
-- Tablo için indeksler `bolgeler`
--
ALTER TABLE `bolgeler`
  ADD PRIMARY KEY (`bid`);

--
-- Tablo için indeksler `cetearaclari`
--
ALTER TABLE `cetearaclari`
  ADD PRIMARY KEY (`caid`);

--
-- Tablo için indeksler `cetebagis`
--
ALTER TABLE `cetebagis`
  ADD PRIMARY KEY (`cbid`);

--
-- Tablo için indeksler `ceteler`
--
ALTER TABLE `ceteler`
  ADD PRIMARY KEY (`cid`);

--
-- Tablo için indeksler `cetemekan`
--
ALTER TABLE `cetemekan`
  ADD PRIMARY KEY (`ceteMekanid`);

--
-- Tablo için indeksler `evler`
--
ALTER TABLE `evler`
  ADD PRIMARY KEY (`eid`);

--
-- Tablo için indeksler `kiyafet`
--
ALTER TABLE `kiyafet`
  ADD PRIMARY KEY (`kid`);

--
-- Tablo için indeksler `normalarac`
--
ALTER TABLE `normalarac`
  ADD PRIMARY KEY (`nid`);

--
-- Tablo için indeksler `oyuncuveri`
--
ALTER TABLE `oyuncuveri`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `ozelarac`
--
ALTER TABLE `ozelarac`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `siparis`
--
ALTER TABLE `siparis`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `soygunlar`
--
ALTER TABLE `soygunlar`
  ADD PRIMARY KEY (`sid`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `banlistesi`
--
ALTER TABLE `banlistesi`
  MODIFY `banid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `basarilar`
--
ALTER TABLE `basarilar`
  MODIFY `baid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `cetearaclari`
--
ALTER TABLE `cetearaclari`
  MODIFY `caid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `cetebagis`
--
ALTER TABLE `cetebagis`
  MODIFY `cbid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `kiyafet`
--
ALTER TABLE `kiyafet`
  MODIFY `kid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `normalarac`
--
ALTER TABLE `normalarac`
  MODIFY `nid` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `oyuncuveri`
--
ALTER TABLE `oyuncuveri`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `ozelarac`
--
ALTER TABLE `ozelarac`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `siparis`
--
ALTER TABLE `siparis`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
