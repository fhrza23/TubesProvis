-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 12, 2024 at 01:50 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db_provis3`
--

-- --------------------------------------------------------

--
-- Table structure for table `antrian`
--

CREATE TABLE `antrian` (
  `id_antrian` int(11) DEFAULT NULL,
  `id_user` int(11) DEFAULT NULL,
  `id_keluarga` int(11) NOT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `nama_pasien` text DEFAULT NULL,
  `tanggal_janji` text DEFAULT NULL,
  `no_antrian` int(11) DEFAULT NULL,
  `kode_qr` text DEFAULT NULL,
  `create_at_antrian` text DEFAULT NULL,
  `update_at_antrian` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `antrian`
--

INSERT INTO `antrian` (`id_antrian`, `id_user`, `id_keluarga`, `id_dokter`, `nama_pasien`, `tanggal_janji`, `no_antrian`, `kode_qr`, `create_at_antrian`, `update_at_antrian`) VALUES
(NULL, 9, 6, 1, 'Sarah', '12-2-2002', NULL, '243955', '2024-06-12 09:28:06', '2024-06-12 09:28:06'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', 30, '224870', '2024-06-12 09:55:34', '2024-06-12 09:55:34'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', 30, '243191', '2024-06-12 10:02:09', '2024-06-12 10:02:09'),
(23, 9, 8, 2, 'kuku', '2024-06-12', 30, '665816', '2024-06-12 10:02:47', '2024-06-12 10:02:47'),
(23, 9, 2, 1, 'Budi Santoso', '2024-06-12', 30, '255138', '2024-06-12 10:10:50', '2024-06-12 10:10:50'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', 30, '404956', '2024-06-12 10:31:11', '2024-06-12 10:31:11'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '389800', '2024-06-12 10:35:04', '2024-06-12 10:35:04'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '829775', '2024-06-12 10:48:49', '2024-06-12 10:48:49'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '349718', '2024-06-12 10:49:50', '2024-06-12 10:49:50'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '536192', '2024-06-12 11:22:44', '2024-06-12 11:22:44'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '453538', '2024-06-12 11:32:58', '2024-06-12 11:32:58'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '445367', '2024-06-12 11:33:59', '2024-06-12 11:33:59'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '506021', '2024-06-12 11:35:04', '2024-06-12 11:35:04'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '364716', '2024-06-12 13:53:19', '2024-06-12 13:53:19'),
(23, 9, 1, 3, 'Sarah', '2024-06-12', NULL, '169383', '2024-06-12 13:53:27', '2024-06-12 13:53:27'),
(23, 9, 1, 3, 'Sarah', '2024-06-12', NULL, '510447', '2024-06-12 13:53:31', '2024-06-12 13:53:31'),
(23, 9, 1, 3, 'Sarah', '2024-06-12', NULL, '442590', '2024-06-12 13:55:00', '2024-06-12 13:55:00'),
(23, 9, 1, 1, 'Sarah', '2024-06-12', NULL, '120809', '2024-06-12 14:21:27', '2024-06-12 14:21:27'),
(23, 9, 9, 1, 'raffi', '2024-06-12', NULL, '927408', '2024-06-12 14:33:41', '2024-06-12 14:33:41');

--
-- Triggers `antrian`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_antrian` BEFORE INSERT ON `antrian` FOR EACH ROW BEGIN
    SET NEW.create_at_antrian = NOW();
    SET NEW.update_at_antrian = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_antrian` BEFORE UPDATE ON `antrian` FOR EACH ROW BEGIN
    SET NEW.update_at_antrian = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `artikel`
--

CREATE TABLE `artikel` (
  `id_artikel` int(11) NOT NULL,
  `judul` text DEFAULT NULL,
  `tanggal` text DEFAULT NULL,
  `isi` text DEFAULT NULL,
  `foto` text DEFAULT NULL,
  `create_at_artikel` text DEFAULT NULL,
  `update_at_artikel` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artikel`
--

INSERT INTO `artikel` (`id_artikel`, `judul`, `tanggal`, `isi`, `foto`, `create_at_artikel`, `update_at_artikel`) VALUES
(1, 'Rumah Sakit Sentra Medika Resmi Dibuka', '2024-12-12', 'Rumah Sakit Sentra Medika baru saja diresmikan sebagai fasilitas kesehatan terbaru di kota ini. Rumah sakit ini dirancang dengan standar internasional untuk memberikan pelayanan medis terbaik bagi masyarakat. Dalam upacara pembukaan yang dihadiri oleh berbagai pejabat daerah, tenaga medis, dan masyarakat umum, Direktur Rumah Sakit Sentra Medika mengungkapkan komitmennya untuk menyediakan layanan kesehatan berkualitas tinggi dan merata bagi semua lapisan masyarakat. Rumah Sakit Sentra Medika dilengkapi dengan teknologi medis terkini dan fasilitas yang modern. Dengan berbagai departemen spesialis seperti kardiologi, onkologi, pediatri, dan bedah, rumah sakit ini siap menangani berbagai jenis kasus medis dengan tenaga ahli yang berpengalaman. Selain itu, rumah sakit ini juga memiliki unit gawat darurat yang siap beroperasi 24 jam, laboratorium canggih, dan pusat diagnostik untuk memastikan setiap pasien mendapatkan diagnosis dan perawatan yang akurat dan cepat. Tidak hanya berfokus pada perawatan medis, Rumah Sakit Sentra Medika juga mengutamakan kenyamanan dan kesejahteraan pasien. Lingkungan rumah sakit dirancang untuk menciptakan suasana yang tenang dan nyaman, dengan ruang perawatan yang luas dan fasilitas pendukung seperti area rekreasi dan kafetaria. Dengan pembukaan resmi ini, Rumah Sakit Sentra Medika berharap dapat menjadi mitra kesehatan terpercaya bagi masyarakat, memastikan setiap individu mendapatkan perawatan terbaik yang mereka butuhkan.', 'images/rumahsakit.jpg', NULL, NULL),
(2, 'Pentingnya Pola Hidup Sehat untuk Mencegah Penyakit Kronis', '2024-08-24', 'Pola hidup sehat memainkan peran penting dalam mencegah berbagai penyakit kronis yang sering kali disebabkan oleh gaya hidup tidak sehat. Mengadopsi pola makan seimbang yang kaya akan buah-buahan, sayuran, biji-bijian, dan protein rendah lemak merupakan langkah awal yang krusial. Nutrisi yang baik tidak hanya membantu menjaga berat badan ideal tetapi juga mengurangi risiko penyakit seperti diabetes, hipertensi, dan penyakit jantung. Makanan bergizi menyediakan tubuh dengan vitamin dan mineral yang diperlukan untuk menjaga fungsi organ-organ vital dan memperkuat sistem kekebalan tubuh. Selain pola makan, rutin berolahraga setidaknya 30 menit setiap hari memiliki manfaat besar bagi kesehatan fisik dan mental. Aktivitas fisik membantu meningkatkan kebugaran, memperkuat otot dan tulang, serta mengurangi stres. Olahraga juga diketahui dapat meningkatkan kualitas tidur, yang penting untuk pemulihan tubuh dan pikiran. Menghindari kebiasaan buruk seperti merokok dan konsumsi alkohol berlebihan adalah langkah penting lainnya. Kebiasaan buruk ini dapat menyebabkan berbagai masalah kesehatan serius, termasuk kerusakan organ dan berbagai jenis kanker. Kesehatan mental juga tidak boleh diabaikan dalam pola hidup sehat. Tidur yang cukup dan berkualitas serta manajemen stres yang baik adalah bagian integral dari gaya hidup sehat. Stres yang tidak terkelola dapat menyebabkan berbagai gangguan kesehatan mental dan fisik. Oleh karena itu, penting untuk mengembangkan strategi manajemen stres, seperti meditasi, yoga, atau hobi yang menyenangkan. Dengan komitmen dan disiplin dalam menjalani pola hidup sehat, kita dapat menikmati hidup yang lebih produktif dan berkualitas, serta mengurangi risiko terkena penyakit kronis yang dapat mengganggu aktivitas sehari-hari.', 'images/polahidup.jpg', NULL, NULL),
(3, 'Peranan AI dalam Diagnostik Medis', '2024-09-15', 'Peranan AI dalam diagnostik medis semakin signifikan dalam beberapa tahun terakhir, dengan teknologi ini membuka jalan bagi inovasi dan efisiensi yang belum pernah terjadi sebelumnya di bidang kesehatan. Algoritma kecerdasan buatan (AI) kini mampu menganalisis data medis dengan kecepatan dan akurasi yang mengesankan, dari pencitraan medis seperti MRI dan CT scan hingga analisis data genomik. Kemampuan AI untuk mendeteksi pola dan anomali yang mungkin terlewatkan oleh pengamatan manusia telah membantu dalam diagnosis penyakit dengan lebih cepat dan tepat, yang sangat penting dalam menangani kondisi-kondisi yang memerlukan intervensi segera.\r\n\r\nSelain itu, AI juga memainkan peran penting dalam personalisasi perawatan pasien. Dengan menganalisis riwayat kesehatan, data genetik, dan data lain yang relevan, AI dapat membantu merumuskan rencana perawatan yang disesuaikan dengan kebutuhan unik setiap pasien. Teknologi ini tidak hanya meningkatkan efektivitas perawatan, tetapi juga mengurangi risiko kesalahan medis dan efek samping obat. Contohnya, AI dapat membantu dalam menentukan dosis obat yang optimal bagi pasien berdasarkan profil genetik mereka, yang mengurangi kemungkinan overdosis atau efek samping yang merugikan.\r\n\r\nNamun, integrasi AI dalam diagnostik medis juga menghadapi berbagai tantangan. Salah satu tantangan utama adalah memastikan bahwa data medis yang digunakan untuk melatih algoritma AI cukup representatif dan bebas dari bias. Selain itu, ada kekhawatiran mengenai privasi dan keamanan data pasien, yang memerlukan regulasi dan standar yang ketat. Meskipun demikian, dengan perkembangan teknologi dan kerjasama antara ilmuwan, profesional medis, dan regulator, AI memiliki potensi besar untuk merevolusi diagnostik medis dan meningkatkan kualitas perawatan kesehatan di seluruh dunia.', 'images/ai.jpg', NULL, NULL),
(4, 'Meningkatkan Kesehatan Mental di Era Digital', '2024-08-05', 'Di era digital saat ini, kesehatan mental menjadi isu yang semakin penting. Banyaknya informasi yang dapat diakses dengan mudah melalui internet dapat memberikan dampak positif maupun negatif terhadap kesehatan mental seseorang. Sisi positifnya, akses informasi yang luas memungkinkan individu untuk mencari bantuan dan informasi mengenai kesehatan mental dengan lebih mudah. Namun, di sisi lain, paparan terus-menerus terhadap berita negatif dan media sosial dapat memicu stres, kecemasan, dan depresi.\r\n\r\nStudi menunjukkan bahwa penggunaan media sosial yang berlebihan dapat menyebabkan perbandingan sosial yang tidak sehat, di mana individu merasa tidak puas dengan diri mereka sendiri setelah melihat kehidupan orang lain yang tampak lebih sempurna. Hal ini dapat memperburuk kondisi kesehatan mental, terutama bagi remaja dan anak muda yang cenderung lebih rentan terhadap tekanan sosial. Oleh karena itu, penting bagi setiap individu untuk mengelola waktu mereka secara bijak dalam menggunakan teknologi dan media sosial.\r\n\r\nUntuk meningkatkan kesehatan mental di era digital, ada beberapa langkah yang bisa diambil. Pertama, batasi waktu penggunaan media sosial dan pastikan untuk memiliki waktu yang cukup untuk beristirahat dan beraktivitas fisik. Kedua, gunakan teknologi dengan tujuan positif, seperti mengikuti akun-akun yang memberikan inspirasi dan motivasi. Ketiga, jangan ragu untuk mencari bantuan profesional jika merasa kesulitan mengatasi stres atau masalah mental lainnya. Dengan langkah-langkah ini, kita dapat menjaga keseimbangan antara kehidupan digital dan kesehatan mental yang baik.', 'images/mental.jpg', NULL, NULL),
(5, 'Pentingnya Deteksi Dini Kanker Payudara', '2024-07-25', 'Deteksi dini kanker payudara sangat penting untuk meningkatkan peluang kesembuhan. Kanker payudara adalah salah satu jenis kanker yang paling umum terjadi pada wanita di seluruh dunia. Dengan melakukan pemeriksaan rutin dan mengenali tanda-tanda awal, seseorang dapat mengidentifikasi keberadaan kanker payudara pada tahap yang lebih awal, sehingga pengobatan dapat dilakukan lebih cepat dan efektif. Pemeriksaan mammografi adalah salah satu metode yang sangat dianjurkan untuk deteksi dini kanker payudara.\r\n\r\nKesadaran tentang pentingnya deteksi dini harus ditingkatkan di kalangan wanita dari berbagai usia. Pemeriksaan sendiri payudara setiap bulan adalah langkah awal yang sangat sederhana namun efektif. Wanita harus mengenali perubahan-perubahan pada payudara mereka, seperti benjolan, perubahan ukuran atau bentuk, atau keluarnya cairan dari puting. Jika ditemukan adanya kelainan, segera konsultasikan dengan dokter untuk mendapatkan penanganan lebih lanjut. Pemeriksaan klinis oleh tenaga medis profesional juga sebaiknya dilakukan secara rutin, terutama bagi mereka yang memiliki riwayat keluarga dengan kanker payudara.\r\n\r\nSelain pemeriksaan rutin, menerapkan gaya hidup sehat juga dapat membantu mengurangi risiko terkena kanker payudara. Mengonsumsi makanan sehat, berolahraga secara teratur, dan menjaga berat badan ideal adalah beberapa langkah yang dapat diambil. Menghindari konsumsi alkohol berlebihan dan berhenti merokok juga sangat penting. Dengan kombinasi antara deteksi dini dan gaya hidup sehat, risiko kanker payudara dapat diminimalisir, dan jika terdeteksi, penanganannya dapat dilakukan dengan lebih efektif.', 'images/kanker.jpg', NULL, NULL),
(6, 'Manfaat Berjemur di Pagi Hari untuk Kesehatan', '2024-07-16', 'Berjemur di bawah sinar matahari pagi memiliki banyak manfaat untuk kesehatan. Paparan sinar matahari pagi membantu tubuh memproduksi vitamin D, yang sangat penting untuk kesehatan tulang dan sistem kekebalan tubuh. Vitamin D membantu penyerapan kalsium dalam tubuh, sehingga mencegah osteoporosis dan memperkuat tulang. Selain itu, sinar matahari juga membantu meningkatkan mood dan mengurangi risiko depresi.\r\n\r\nWaktu yang terbaik untuk berjemur adalah sebelum pukul 10 pagi, ketika sinar matahari tidak terlalu kuat. Berjemur selama 10-15 menit setiap hari sudah cukup untuk mendapatkan manfaat kesehatan tanpa risiko terkena sinar ultraviolet yang berlebihan. Selain meningkatkan produksi vitamin D, sinar matahari pagi juga membantu mengatur ritme sirkadian tubuh, yang berpengaruh pada pola tidur dan energi harian.\r\n\r\nMeskipun berjemur memiliki banyak manfaat, penting untuk melakukannya dengan bijak. Hindari paparan sinar matahari langsung pada waktu siang hari, ketika sinar UV berada pada puncaknya dan dapat menyebabkan kerusakan kulit. Menggunakan tabir surya dan melindungi kulit dengan pakaian saat berjemur di waktu-waktu tertentu juga penting untuk mencegah risiko kanker kulit. Dengan berjemur di waktu yang tepat dan dalam durasi yang sesuai, kita dapat memaksimalkan manfaat sinar matahari untuk kesehatan tubuh secara keseluruhan.', 'images/jemur.jpg', NULL, NULL);

--
-- Triggers `artikel`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_artikel` BEFORE INSERT ON `artikel` FOR EACH ROW BEGIN
    SET NEW.create_at_artikel = NOW();
    SET NEW.update_at_artikel = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_artikel` BEFORE UPDATE ON `artikel` FOR EACH ROW BEGIN
    SET NEW.update_at_artikel = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `asuransi`
--

CREATE TABLE `asuransi` (
  `id_asuransi` int(11) NOT NULL,
  `nama_asuransi` text DEFAULT NULL,
  `id_keluarga` int(11) DEFAULT NULL,
  `no_asuransi` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `asuransi`
--

INSERT INTO `asuransi` (`id_asuransi`, `nama_asuransi`, `id_keluarga`, `no_asuransi`) VALUES
(1, 'Prodia', 1, '11111'),
(2, 'AXA', 2, '22222'),
(3, 'BPJS', 3, '33333');

-- --------------------------------------------------------

--
-- Table structure for table `dokter`
--

CREATE TABLE `dokter` (
  `id_dokter` int(11) NOT NULL,
  `nama_dokter` text NOT NULL,
  `rating` double NOT NULL,
  `alumni` text NOT NULL,
  `pengalaman` text NOT NULL,
  `nomor_str` int(11) NOT NULL,
  `foto_dokter` text NOT NULL,
  `created_at_dokter` text DEFAULT NULL,
  `updated_at_dokter` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `dokter`
--

INSERT INTO `dokter` (`id_dokter`, `nama_dokter`, `rating`, `alumni`, `pengalaman`, `nomor_str`, `foto_dokter`, `created_at_dokter`, `updated_at_dokter`) VALUES
(1, 'dr. Indra Cahya, Sp.THT', 5, 'Universitas Indonesia 2011', '12 Tahun', 2147483647, 'images/doctor1.jpg', '', ''),
(2, 'Dita Anggraini, A.Md.Fis', 4.5, 'Universitas Gajah Mada 2015', '9 Tahun', 2147483647, 'images/doctor2.jpg', '', ''),
(3, 'dr. Tri Handoyo, Sp.M', 4, 'Universitas Hasanuddin 2019', '5 Tahun', 2147483647, 'images/doctor3.jpg', '', ''),
(4, 'Syifa Azzahra', 4.5, 'Universitas Pendidikan Indonesia 2018', '2 Tahun', 1234567890, 'images/doctor2.jpg', '2024-06-09 17:09:16', '2024-06-09 17:21:42');

--
-- Triggers `dokter`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_dokter` BEFORE INSERT ON `dokter` FOR EACH ROW BEGIN
    SET NEW.created_at_dokter = NOW();
    SET NEW.updated_at_dokter = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_dokter` BEFORE UPDATE ON `dokter` FOR EACH ROW BEGIN
    SET NEW.updated_at_dokter = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `jadwal`
--

CREATE TABLE `jadwal` (
  `id_jadwal` int(11) NOT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `hari` text NOT NULL,
  `jam` text NOT NULL,
  `created_at_jadwal` text NOT NULL,
  `updated_at_jadwal` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `jadwal`
--

INSERT INTO `jadwal` (`id_jadwal`, `id_dokter`, `hari`, `jam`, `created_at_jadwal`, `updated_at_jadwal`) VALUES
(1, 1, 'Rabu', '12.00 WIB', '2024-06-05 15:40:49', '2024-06-05 15:41:09'),
(2, 1, 'Kamis', '12.00 WIB', '2024-06-05 15:41:09', '2024-06-05 15:41:20'),
(3, 2, 'Senin', '18.30 WIB', '2024-06-05 15:41:20', '2024-06-05 15:41:49'),
(4, 2, 'Selasa', '18.30 WIB', '2024-06-05 15:41:49', '2024-06-05 15:42:04'),
(5, 2, 'Rabu', '18.30 WIB', '2024-06-05 15:42:04', '2024-06-05 15:42:17'),
(6, 2, 'Kamis', '18.30 WIB', '2024-06-05 15:42:17', '2024-06-05 15:42:26'),
(7, 2, 'Jumat', '18.30 WIB', '2024-06-05 15:42:26', '2024-06-05 15:42:45'),
(8, 2, 'Sabtu', '18.30 WIB', '2024-06-05 15:42:45', '2024-06-05 15:42:58'),
(9, 3, 'Senin', '15.30 WIB', '2024-06-05 15:42:58', '2024-06-05 15:43:12'),
(10, 3, 'Selasa', '15.30 WIB', '2024-06-05 15:43:12', '2024-06-05 15:43:36'),
(11, 3, 'Rabu', '15.30 WIB', '2024-06-05 15:43:36', '2024-06-05 15:43:45'),
(12, 3, 'Kamis', '15.30 WIB', '2024-06-05 15:43:45', '2024-06-05 15:43:55'),
(13, 3, 'Jumat', '15.30 WIB', '2024-06-05 15:43:55', '2024-06-05 15:44:16'),
(14, 4, 'Senin', '15.30 WIB', '2024-06-09 17:18:33', '2024-06-09 17:18:47');

--
-- Triggers `jadwal`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_jadwal` BEFORE INSERT ON `jadwal` FOR EACH ROW BEGIN
    SET NEW.created_at_jadwal = NOW();
    SET NEW.updated_at_jadwal = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_jadwal` BEFORE UPDATE ON `jadwal` FOR EACH ROW BEGIN
    SET NEW.updated_at_jadwal = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `keluarga`
--

CREATE TABLE `keluarga` (
  `id_keluarga` int(11) NOT NULL,
  `id_user` int(11) DEFAULT NULL,
  `nik` varchar(50) NOT NULL,
  `nama_keluarga` text DEFAULT NULL,
  `tgl_lahir` text NOT NULL,
  `create_at_keluarga` text NOT NULL,
  `update_at_keluarga` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `keluarga`
--

INSERT INTO `keluarga` (`id_keluarga`, `id_user`, `nik`, `nama_keluarga`, `tgl_lahir`, `create_at_keluarga`, `update_at_keluarga`) VALUES
(1, 4, '32123456', 'Sarah', '2000-01-01', '', ''),
(2, 4, '3212347', 'Budi Santoso', '1999-01-01', '', ''),
(3, 4, '3212348', 'Maya', '2003-04-03', '', ''),
(4, 4, '3212349', 'Yanto', '2005-03-07', '2024-06-10 15:15:01', '2024-06-10 15:15:01'),
(6, 9, '321456789', 'Raden Bayu', '2024-06-10', '2024-06-10 19:50:50', '2024-06-10 19:50:50'),
(8, 11, '9999', 'kuku', '2024-06-12', '2024-06-12 10:01:28', '2024-06-12 10:01:28'),
(9, 12, '1300', 'raffi', '2024-06-12', '2024-06-12 14:29:31', '2024-06-12 14:29:31');

--
-- Triggers `keluarga`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_keluarga` BEFORE INSERT ON `keluarga` FOR EACH ROW BEGIN
    SET NEW.create_at_keluarga = NOW();
    SET NEW.update_at_keluarga = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_keluarga` BEFORE UPDATE ON `keluarga` FOR EACH ROW BEGIN
    SET NEW.update_at_keluarga = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `mitrapayment`
--

CREATE TABLE `mitrapayment` (
  `id_mitra` int(11) NOT NULL,
  `nama_mitra` text DEFAULT NULL,
  `no_akun` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `mitrapayment`
--

INSERT INTO `mitrapayment` (`id_mitra`, `nama_mitra`, `no_akun`) VALUES
(1, 'dana', '123456'),
(2, 'mandiri', '1234567');

-- --------------------------------------------------------

--
-- Table structure for table `notifikasi`
--

CREATE TABLE `notifikasi` (
  `id_notif` int(11) NOT NULL,
  `tipe_notif` int(11) NOT NULL,
  `title` text NOT NULL,
  `subtitle` text NOT NULL,
  `time` text NOT NULL,
  `id_news` int(11) NOT NULL,
  `content` text NOT NULL,
  `create_at_notif` text DEFAULT NULL,
  `update_at_notif` text DEFAULT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifikasi`
--

INSERT INTO `notifikasi` (`id_notif`, `tipe_notif`, `title`, `subtitle`, `time`, `id_news`, `content`, `create_at_notif`, `update_at_notif`, `id_user`) VALUES
(1, 1, 'Reminder!', 'Antrian anda akan segera tiba', '2024-05-19T17:35:55.274000+00:00', 0, 'string', '', '', 1),
(2, 1, 'Reminder!', 'Antrian anda akan segera tiba', '2024-05-19T17:35:55.274000+00:00', 0, 'string', '', '', 2),
(3, 2, 'Rumah Sakit Sentra Medika Resmi dibuka!', 'Baca Artikel Sekarang!', '2024-05-23T07:18:51.896000+00:00', 1, 'string', '', '', 1),
(4, 2, 'Peresmian IGD Rumah Sakit Sentra Medika', 'Baca Artikel Sekarang!', '2024-05-23T07:18:51.896000+00:00', 1, 'string', '', '', 1),
(5, 1, 'Reminder', 'Minum obat', '2024-05-23T07:18:51.896000+00:00', 0, 'string', '', '', 2),
(6, 1, 'Reminder', 'Minum obat', '2024-05-23T07:18:51.896000+00:00', 0, 'string', '', '', 1),
(10, 3, 'Selamat Datang!', 'Selamat Datang di RawatJalan.ID', '2024-06-10 19:50:50', 0, 'Kami senang Anda telah memilih kami sebagai mitra kesehatan Anda. Dengan aplikasi ini, kami berkomitmen untuk memberikan pelayanan kesehatan yang cepat, mudah, dan nyaman.\n\nFitur unggulan yang bisa Anda nikmati:\n\n- Penjadwalan Janji Temu: Atur jadwal kunjungan dengan dokter pilihan Anda dengan mudah.\n- Rekam Medis Digital: Akses riwayat kesehatan Anda kapan saja dan di mana saja.\n- Informasi Kesehatan Terbaru: Dapatkan tips dan artikel kesehatan yang bermanfaat.\n\nKami berkomitmen untuk memberikan pengalaman terbaik dalam menjaga kesehatan Anda!', '2024-06-10 19:50:50', '2024-06-10 19:50:50', 9),
(11, 3, 'Selamat Datang!', 'Selamat Datang di RawatJalan.ID', '2024-06-11 19:51:06', 0, 'Kami senang Anda telah memilih kami sebagai mitra kesehatan Anda. Dengan aplikasi ini, kami berkomitmen untuk memberikan pelayanan kesehatan yang cepat, mudah, dan nyaman.\n\nFitur unggulan yang bisa Anda nikmati:\n\n- Penjadwalan Janji Temu: Atur jadwal kunjungan dengan dokter pilihan Anda dengan mudah.\n- Rekam Medis Digital: Akses riwayat kesehatan Anda kapan saja dan di mana saja.\n- Informasi Kesehatan Terbaru: Dapatkan tips dan artikel kesehatan yang bermanfaat.\n\nKami berkomitmen untuk memberikan pengalaman terbaik dalam menjaga kesehatan Anda!', '2024-06-11 19:51:06', '2024-06-11 19:51:06', 10),
(12, 3, 'Selamat Datang!', 'Selamat Datang di RawatJalan.ID', '2024-06-12 10:01:28', 0, 'Kami senang Anda telah memilih kami sebagai mitra kesehatan Anda. Dengan aplikasi ini, kami berkomitmen untuk memberikan pelayanan kesehatan yang cepat, mudah, dan nyaman.\n\nFitur unggulan yang bisa Anda nikmati:\n\n- Penjadwalan Janji Temu: Atur jadwal kunjungan dengan dokter pilihan Anda dengan mudah.\n- Rekam Medis Digital: Akses riwayat kesehatan Anda kapan saja dan di mana saja.\n- Informasi Kesehatan Terbaru: Dapatkan tips dan artikel kesehatan yang bermanfaat.\n\nKami berkomitmen untuk memberikan pengalaman terbaik dalam menjaga kesehatan Anda!', '2024-06-12 10:01:28', '2024-06-12 10:01:28', 11),
(13, 3, 'Selamat Datang!', 'Selamat Datang di RawatJalan.ID', '2024-06-12 14:29:31', 0, 'Kami senang Anda telah memilih kami sebagai mitra kesehatan Anda. Dengan aplikasi ini, kami berkomitmen untuk memberikan pelayanan kesehatan yang cepat, mudah, dan nyaman.\n\nFitur unggulan yang bisa Anda nikmati:\n\n- Penjadwalan Janji Temu: Atur jadwal kunjungan dengan dokter pilihan Anda dengan mudah.\n- Rekam Medis Digital: Akses riwayat kesehatan Anda kapan saja dan di mana saja.\n- Informasi Kesehatan Terbaru: Dapatkan tips dan artikel kesehatan yang bermanfaat.\n\nKami berkomitmen untuk memberikan pengalaman terbaik dalam menjaga kesehatan Anda!', '2024-06-12 14:29:31', '2024-06-12 14:29:31', 12);

--
-- Triggers `notifikasi`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_notif` BEFORE INSERT ON `notifikasi` FOR EACH ROW BEGIN
    SET NEW.time = NOW();
    SET NEW.create_at_notif = NOW();
    SET NEW.update_at_notif = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_notif` BEFORE UPDATE ON `notifikasi` FOR EACH ROW BEGIN
    SET NEW.update_at_notif = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `obat`
--

CREATE TABLE `obat` (
  `id_obat` int(11) NOT NULL,
  `nama_obat` text DEFAULT NULL,
  `harga_obat` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `obat`
--

INSERT INTO `obat` (`id_obat`, `nama_obat`, `harga_obat`) VALUES
(1, 'mefinal', 12000),
(2, 'paracetamol', 5000),
(3, 'Cefixim', 25000),
(4, 'bodrex', 4000),
(5, 'mixagrip', 3500),
(6, 'Diapet', 3000);

-- --------------------------------------------------------

--
-- Table structure for table `otp_store`
--

CREATE TABLE `otp_store` (
  `id` int(11) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `otp` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `otp_store`
--

INSERT INTO `otp_store` (`id`, `no_hp`, `otp`) VALUES
(1, '', 980498),
(2, '', 641148),
(3, '', 732459),
(4, '', 384232),
(5, '0239', 388177),
(6, '1818', 552969),
(7, '1212', 580929),
(8, '13131', 233042),
(9, '33333', 597814),
(10, '22222', 302972),
(11, '9999', 774363),
(12, '11111', 656896),
(13, '1919', 379814),
(14, '1919', 939749),
(15, '1111', 112266),
(16, '1111', 890376),
(17, '1111', 517694),
(18, '1111', 169808),
(19, '1111', 964564),
(20, '1111', 761920),
(21, '1111', 148142),
(22, '19191', 661602),
(23, '1111', 532564),
(24, '1111', 832886),
(25, '1111', 879999),
(26, '1111', 316145),
(27, '111', 327204),
(28, '111', 798252),
(29, '1111', 660812),
(30, '1111', 147720),
(31, '1111', 453497),
(32, '1111', 795179),
(33, '1111', 210646),
(34, '0821567', 784708),
(35, '0821234567', 624057),
(36, '1111', 779790),
(37, '1111', 500568),
(38, '1212', 630596);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id_payment` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `ewallet` text NOT NULL,
  `create_at_payment` text DEFAULT NULL,
  `update_at_payment` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`id_payment`, `amount`, `ewallet`, `create_at_payment`, `update_at_payment`) VALUES
(0, 0, 'string', '', ''),
(1, 12200, 'dana', '', '');

--
-- Triggers `payment`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_payment` BEFORE INSERT ON `payment` FOR EACH ROW BEGIN
    SET NEW.create_at_payment = NOW();
    SET NEW.update_at_payment = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_payment` BEFORE UPDATE ON `payment` FOR EACH ROW BEGIN
    SET NEW.update_at_payment = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `rekam_medis`
--

CREATE TABLE `rekam_medis` (
  `id_rekam_medis` int(11) NOT NULL,
  `id_user` int(11) NOT NULL,
  `id_keluarga` int(11) NOT NULL,
  `id_dokter` int(11) NOT NULL,
  `tanggal` text NOT NULL,
  `diagnosis` text NOT NULL,
  `resep_obat` text NOT NULL,
  `create_at_rekam_medis` text NOT NULL,
  `update_at_rekam_medis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rekam_medis`
--

INSERT INTO `rekam_medis` (`id_rekam_medis`, `id_user`, `id_keluarga`, `id_dokter`, `tanggal`, `diagnosis`, `resep_obat`, `create_at_rekam_medis`, `update_at_rekam_medis`) VALUES
(1, 9, 6, 3, '2024-06-11', 'demam', 'paracetamol', '2024-06-12 11:48:50', '2024-06-12 11:48:50'),
(2, 9, 6, 1, '2024-06-12', 'kejang-kejang', 'sirup obat', '2024-06-12 11:48:50', '2024-06-12 11:48:50');

--
-- Triggers `rekam_medis`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_rekam_medis` BEFORE INSERT ON `rekam_medis` FOR EACH ROW BEGIN
    SET NEW.create_at_rekam_medis = NOW();
    SET NEW.update_at_rekam_medis = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_rekam_medis` BEFORE UPDATE ON `rekam_medis` FOR EACH ROW BEGIN
    SET NEW.update_at_rekam_medis = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `resetantri`
--

CREATE TABLE `resetantri` (
  `id_dokter` int(11) DEFAULT NULL,
  `last_date` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `spesialis`
--

CREATE TABLE `spesialis` (
  `id_spesialis` int(11) NOT NULL,
  `id_dokter` int(11) DEFAULT NULL,
  `jenis_spesialis` text NOT NULL,
  `create_at_spesialis` text NOT NULL,
  `update_at_spesialis` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `spesialis`
--

INSERT INTO `spesialis` (`id_spesialis`, `id_dokter`, `jenis_spesialis`, `create_at_spesialis`, `update_at_spesialis`) VALUES
(1, 1, 'THT', '2024-06-05 15:19:50', '2024-06-05 15:20:01'),
(2, 2, 'Fisioterapi', '2024-06-05 15:20:01', '2024-06-05 15:20:11'),
(3, 3, 'Mata', '2024-06-05 15:20:11', '2024-06-05 15:20:21'),
(4, 4, 'Mata', '2024-06-05 15:20:11', '2024-06-05 15:20:21');

--
-- Triggers `spesialis`
--
DELIMITER $$
CREATE TRIGGER `set_create_at_spesialis` BEFORE INSERT ON `spesialis` FOR EACH ROW BEGIN
    SET NEW.create_at_spesialis = NOW();
    SET NEW.update_at_spesialis = NOW();
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `set_update_at_spesialis` BEFORE UPDATE ON `spesialis` FOR EACH ROW BEGIN
    SET NEW.update_at_spesialis = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `nik` varchar(50) NOT NULL,
  `nama` varchar(100) NOT NULL,
  `password` varchar(100) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `tgl_lahir` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nik`, `nama`, `password`, `no_hp`, `tgl_lahir`) VALUES
(1, '1234', 'raffi', 'ardhi', '1111', '2000-01-01'),
(2, '1235', 'naufal', 'raff', '2222', '2000-02-02'),
(3, 'string', 'string', 'string', 'string', '2000-03-03'),
(4, '1236', 'rehan', 'rehan12T', '0239', '2000-04-04'),
(5, '1240', 'salma', 'salma99U', '1818', '2024-06-01'),
(6, '1241', 'reh', 'reh123E', '1212', '2017-06-01'),
(7, '1222', 'raff', 'wer41W', '11111', '2024-06-07'),
(8, '3210987', 'Yanto', 'Yanto1', '0821567', '2024-06-10'),
(9, '321456789', 'Raden Bayu', 'Raden1', '0821234567', '2024-06-10'),
(10, '', '', 'hmm12Y', '1111', '0000-00-00'),
(11, '9999', 'kuku', 'kuku123U', '1111', '2024-06-12'),
(12, '1300', 'raffi', 'raffi12I', '1212', '2024-06-12');

--
-- Triggers `users`
--
DELIMITER $$
CREATE TRIGGER `after_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO keluarga (id_user, nik, nama_keluarga, tgl_lahir, create_at_keluarga, update_at_keluarga)
    VALUES (NEW.id, NEW.nik, NEW.nama, NEW.tgl_lahir, NOW(), NOW());
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `after_user_insert_notif` AFTER INSERT ON `users` FOR EACH ROW BEGIN
    INSERT INTO notifikasi (
        tipe_notif,
        title,
        subtitle,
        id_news,
        content,
        id_user
    )
    VALUES (
        3,
        'Selamat Datang!',
        'Selamat Datang di RawatJalan.ID',
        0,
        'Kami senang Anda telah memilih kami sebagai mitra kesehatan Anda. Dengan aplikasi ini, kami berkomitmen untuk memberikan pelayanan kesehatan yang cepat, mudah, dan nyaman.\n\nFitur unggulan yang bisa Anda nikmati:\n\n- Penjadwalan Janji Temu: Atur jadwal kunjungan dengan dokter pilihan Anda dengan mudah.\n- Rekam Medis Digital: Akses riwayat kesehatan Anda kapan saja dan di mana saja.\n- Informasi Kesehatan Terbaru: Dapatkan tips dan artikel kesehatan yang bermanfaat.\n\nKami berkomitmen untuk memberikan pengalaman terbaik dalam menjaga kesehatan Anda!',
        NEW.id
    );
END
$$
DELIMITER ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `antrian`
--
ALTER TABLE `antrian`
  ADD KEY `fk_id_user` (`id_user`),
  ADD KEY `fk_id_keluarga` (`id_keluarga`),
  ADD KEY `fk_id_dokter` (`id_dokter`);

--
-- Indexes for table `artikel`
--
ALTER TABLE `artikel`
  ADD PRIMARY KEY (`id_artikel`);

--
-- Indexes for table `asuransi`
--
ALTER TABLE `asuransi`
  ADD PRIMARY KEY (`id_asuransi`),
  ADD KEY `asuransi_keluarga_FK` (`id_keluarga`);

--
-- Indexes for table `dokter`
--
ALTER TABLE `dokter`
  ADD PRIMARY KEY (`id_dokter`);

--
-- Indexes for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD PRIMARY KEY (`id_jadwal`),
  ADD KEY `id_dokter` (`id_dokter`);

--
-- Indexes for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD PRIMARY KEY (`id_keluarga`),
  ADD KEY `fk_id_user_keluarga` (`id_user`);

--
-- Indexes for table `mitrapayment`
--
ALTER TABLE `mitrapayment`
  ADD PRIMARY KEY (`id_mitra`);

--
-- Indexes for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD PRIMARY KEY (`id_notif`),
  ADD KEY `fk_id_user_rekam_medis` (`id_user`);

--
-- Indexes for table `obat`
--
ALTER TABLE `obat`
  ADD PRIMARY KEY (`id_obat`);

--
-- Indexes for table `otp_store`
--
ALTER TABLE `otp_store`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id_payment`);

--
-- Indexes for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD PRIMARY KEY (`id_rekam_medis`),
  ADD KEY `fk_id_user_remed` (`id_user`),
  ADD KEY `fk_id_keluarga_remed` (`id_keluarga`),
  ADD KEY `fk_id_dokter_remed` (`id_dokter`);

--
-- Indexes for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD PRIMARY KEY (`id_spesialis`),
  ADD KEY `fk_dokter` (`id_dokter`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artikel`
--
ALTER TABLE `artikel`
  MODIFY `id_artikel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `dokter`
--
ALTER TABLE `dokter`
  MODIFY `id_dokter` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `jadwal`
--
ALTER TABLE `jadwal`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `keluarga`
--
ALTER TABLE `keluarga`
  MODIFY `id_keluarga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `mitrapayment`
--
ALTER TABLE `mitrapayment`
  MODIFY `id_mitra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `notifikasi`
--
ALTER TABLE `notifikasi`
  MODIFY `id_notif` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `obat`
--
ALTER TABLE `obat`
  MODIFY `id_obat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `otp_store`
--
ALTER TABLE `otp_store`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  MODIFY `id_rekam_medis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `spesialis`
--
ALTER TABLE `spesialis`
  MODIFY `id_spesialis` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `antrian`
--
ALTER TABLE `antrian`
  ADD CONSTRAINT `fk_id_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `fk_id_keluarga` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga` (`id_keluarga`),
  ADD CONSTRAINT `fk_id_user` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `asuransi`
--
ALTER TABLE `asuransi`
  ADD CONSTRAINT `asuransi_keluarga_FK` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga` (`id_keluarga`);

--
-- Constraints for table `jadwal`
--
ALTER TABLE `jadwal`
  ADD CONSTRAINT `jadwal_ibfk_1` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);

--
-- Constraints for table `keluarga`
--
ALTER TABLE `keluarga`
  ADD CONSTRAINT `fk_id_user_keluarga` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `notifikasi`
--
ALTER TABLE `notifikasi`
  ADD CONSTRAINT `fk_id_user_rekam_medis` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `rekam_medis`
--
ALTER TABLE `rekam_medis`
  ADD CONSTRAINT `fk_id_dokter_remed` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`),
  ADD CONSTRAINT `fk_id_keluarga_remed` FOREIGN KEY (`id_keluarga`) REFERENCES `keluarga` (`id_keluarga`),
  ADD CONSTRAINT `fk_id_user_remed` FOREIGN KEY (`id_user`) REFERENCES `users` (`id`);

--
-- Constraints for table `spesialis`
--
ALTER TABLE `spesialis`
  ADD CONSTRAINT `fk_dokter` FOREIGN KEY (`id_dokter`) REFERENCES `dokter` (`id_dokter`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
