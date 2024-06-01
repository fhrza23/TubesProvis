BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "users" (
	"id"	INTEGER,
	"nik"	TEXT NOT NULL,
	"nama"	TEXT NOT NULL,
	"password"	TEXT NOT NULL,
	"no_hp"	TEXT NOT NULL,
	"tgl_lahir"	DATE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "otp_store" (
	"id"	INTEGER,
	"no_hp"	TEXT NOT NULL,
	"otp"	INTEGER NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "artikel" (
	"id_artikel"	INTEGER,
	"judul"	TEXT,
	"tanggal"	TEXT,
	"isi"	TEXT,
	"foto"	TEXT,
	PRIMARY KEY("id_artikel")
);
CREATE TABLE IF NOT EXISTS "notifikasi" (
	"id_notif"	INTEGER,
	"tipe_notif"	INTEGER NOT NULL,
	"title"	TEXT NOT NULL,
	"subtitle"	TEXT NOT NULL,
	"time"	TEXT NOT NULL,
	"id_news"	INTEGER NOT NULL,
	"content"	TEXT NOT NULL,
	PRIMARY KEY("id_notif" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "dokter" (
	"id_dokter"	INTEGER,
	"nama_dokter"	TEXT NOT NULL,
	"spesialis"	TEXT NOT NULL,
	"hari_praktek"	TEXT NOT NULL,
	"jam_praktek"	TEXT NOT NULL,
	"rating"	REAL NOT NULL,
	"alumni"	TEXT NOT NULL,
	"pengalaman"	TEXT NOT NULL,
	"nomor_str"	INTEGER NOT NULL,
	"foto_dokter"	TEXT NOT NULL,
	PRIMARY KEY("id_dokter" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "payment" (
	"id_payment"	INTEGER,
	"amount"	INTEGER NOT NULL,
	"ewallet"	TEXT NOT NULL,
	PRIMARY KEY("id_payment")
);
INSERT INTO "users" VALUES (1,'1234','raffi','ardhi','1111','asd');
INSERT INTO "users" VALUES (2,'1235','naufal','raff','2222','asd');
INSERT INTO "users" VALUES (3,'string','string','string','string','sad');
INSERT INTO "otp_store" VALUES (8,'',980498);
INSERT INTO "otp_store" VALUES (9,'',641148);
INSERT INTO "otp_store" VALUES (10,'',732459);
INSERT INTO "artikel" VALUES (1,'Rumah Sakit Sentra Medika Resmi Dibuka','12/12/2024','Rumah Sakit Sentra Medika baru saja diresmikan sebagai fasilitas kesehatan terbaru di kota ini. Rumah sakit ini dirancang dengan standar internasional untuk memberikan pelayanan medis terbaik bagi masyarakat. Dalam upacara pembukaan yang dihadiri oleh berbagai pejabat daerah, tenaga medis, dan masyarakat umum, Direktur Rumah Sakit Sentra Medika mengungkapkan komitmennya untuk menyediakan layanan kesehatan berkualitas tinggi dan merata bagi semua lapisan masyarakat.

Rumah Sakit Sentra Medika dilengkapi dengan teknologi medis terkini dan fasilitas yang modern. Dengan berbagai departemen spesialis seperti kardiologi, onkologi, pediatri, dan bedah, rumah sakit ini siap menangani berbagai jenis kasus medis dengan tenaga ahli yang berpengalaman. Selain itu, rumah sakit ini juga memiliki unit gawat darurat yang siap beroperasi 24 jam, laboratorium canggih, dan pusat diagnostik untuk memastikan setiap pasien mendapatkan diagnosis dan perawatan yang akurat dan cepat.

Tidak hanya berfokus pada perawatan medis, Rumah Sakit Sentra Medika juga mengutamakan kenyamanan dan kesejahteraan pasien. Lingkungan rumah sakit dirancang untuk menciptakan suasana yang tenang dan nyaman, dengan ruang perawatan yang luas dan fasilitas pendukung seperti area rekreasi dan kafetaria. Dengan pembukaan resmi ini, Rumah Sakit Sentra Medika berharap dapat menjadi mitra kesehatan terpercaya bagi masyarakat, memastikan setiap individu mendapatkan perawatan terbaik yang mereka butuhkan.','images/rumahsakit.jpg');
INSERT INTO "artikel" VALUES (2,'Pentingnya Pola Hidup Sehat untuk Mencegah Penyakit Kronis','24/08/2024','Pola hidup sehat memainkan peran penting dalam mencegah berbagai penyakit kronis yang sering kali disebabkan oleh gaya hidup tidak sehat. Mengadopsi pola makan seimbang yang kaya akan buah-buahan, sayuran, biji-bijian, dan protein rendah lemak merupakan langkah awal yang krusial. Nutrisi yang baik tidak hanya membantu menjaga berat badan ideal tetapi juga mengurangi risiko penyakit seperti diabetes, hipertensi, dan penyakit jantung. Makanan bergizi menyediakan tubuh dengan vitamin dan mineral yang diperlukan untuk menjaga fungsi organ-organ vital dan memperkuat sistem kekebalan tubuh.

Selain pola makan, rutin berolahraga setidaknya 30 menit setiap hari memiliki manfaat besar bagi kesehatan fisik dan mental. Aktivitas fisik membantu meningkatkan kebugaran, memperkuat otot dan tulang, serta mengurangi stres. Olahraga juga diketahui dapat meningkatkan kualitas tidur, yang penting untuk pemulihan tubuh dan pikiran. Menghindari kebiasaan buruk seperti merokok dan konsumsi alkohol berlebihan adalah langkah penting lainnya. Kebiasaan buruk ini dapat menyebabkan berbagai masalah kesehatan serius, termasuk kerusakan organ dan berbagai jenis kanker.

Kesehatan mental juga tidak boleh diabaikan dalam pola hidup sehat. Tidur yang cukup dan berkualitas serta manajemen stres yang baik adalah bagian integral dari gaya hidup sehat. Stres yang tidak terkelola dapat menyebabkan berbagai gangguan kesehatan mental dan fisik. Oleh karena itu, penting untuk mengembangkan strategi manajemen stres, seperti meditasi, yoga, atau hobi yang menyenangkan. Dengan komitmen dan disiplin dalam menjalani pola hidup sehat, kita dapat menikmati hidup yang lebih produktif dan berkualitas, serta mengurangi risiko terkena penyakit kronis yang dapat mengganggu aktivitas sehari-hari.','images/polahidup.jpg');
INSERT INTO "notifikasi" VALUES (1,1,'Reminder!','Antrian anda akan segera tiba','2024-05-19T17:35:55.274000+00:00',0,'string');
INSERT INTO "notifikasi" VALUES (2,1,'Reminder!','Antrian anda akan segera tiba','2024-05-19T17:35:55.274000+00:00',0,'string');
INSERT INTO "notifikasi" VALUES (3,2,'Rumah Sakit Sentra Medika Resmi dibuka!','Baca Artikel Sekarang!','2024-05-23T07:18:51.896000+00:00',1,'string');
INSERT INTO "notifikasi" VALUES (4,2,'Peresmian IGD Rumah Sakit Sentra Medika','Baca Artikel Sekarang!','2024-05-23T07:18:51.896000+00:00',1,'string');
INSERT INTO "notifikasi" VALUES (5,1,'Reminder','Minum obat','2024-05-23T07:18:51.896000+00:00',0,'string');
INSERT INTO "notifikasi" VALUES (6,1,'Reminder','Minum obat','2024-05-23T07:18:51.896000+00:00',0,'string');
INSERT INTO "dokter" VALUES (1,'dr. Indra Cahya, Sp.THT','THT','Rabu & Kamis','12.00 WIB',5.0,'Universitas Indonesia 2011','12 Tahun',3624612414124,'images/doctor1.jpg');
INSERT INTO "dokter" VALUES (2,'Dita Anggraini, A.Md.Fis','Fisioterapi','Senin s.d Sabtu','18.30 WIB',4.5,'Universitas Gajah Mada 2015','9 Tahun',6543210987654321,'images/doctor2.jpg');
INSERT INTO "dokter" VALUES (3,'dr. Tri Handoyo, Sp.M','Mata','Senin & Jumat','15.30 WIB',4.0,'Universitas Hasanuddin 2019','5 Tahun',9876543210987654,'images/doctor3.jpg');
INSERT INTO "payment" VALUES (0,0,'string');
INSERT INTO "payment" VALUES (1,12200,'dana');
COMMIT;
