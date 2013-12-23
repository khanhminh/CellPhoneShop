/*
SQLyog Ultimate v10.00 Beta1
MySQL - 5.5.21 : Database - cellphoneshop
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`cellphoneshop` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cellphoneshop`;

/*Table structure for table `binhluan` */

DROP TABLE IF EXISTS `binhluan`;

CREATE TABLE `binhluan` (
  `maBinhLuan` int(11) NOT NULL AUTO_INCREMENT,
  `maSP` int(11) NOT NULL,
  `maND` int(11) NOT NULL,
  `loiBinh` varchar(800) CHARACTER SET utf8 NOT NULL,
  `ngayBinhLuan` date NOT NULL,
  PRIMARY KEY (`maBinhLuan`),
  KEY `fk_BinhLuan_SanPham` (`maSP`),
  KEY `fk_BinhLuan_NguoiDung` (`maND`),
  CONSTRAINT `fk_BinhLuan_NguoiDung` FOREIGN KEY (`maND`) REFERENCES `nguoidung` (`maND`),
  CONSTRAINT `fk_BinhLuan_SanPham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `binhluan` */

/*Table structure for table `ctdonhang` */

DROP TABLE IF EXISTS `ctdonhang`;

CREATE TABLE `ctdonhang` (
  `maCTDonHang` int(11) NOT NULL AUTO_INCREMENT,
  `maDonHang` int(11) NOT NULL,
  `maSP` int(11) NOT NULL,
  `giaTungSP` int(11) NOT NULL,
  `giamGiaTungSP` int(11) NOT NULL DEFAULT '0',
  `soLuong` int(11) NOT NULL DEFAULT '1',
  `tongGiaTri` int(11) NOT NULL,
  PRIMARY KEY (`maCTDonHang`),
  KEY `fk_CtDonHang_DonHang` (`maDonHang`),
  KEY `fk_CtDonHang_SanPham` (`maSP`),
  CONSTRAINT `fk_CtDonHang_DonHang` FOREIGN KEY (`maDonHang`) REFERENCES `donhang` (`maDonHang`),
  CONSTRAINT `fk_CtDonHang_SanPham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ctdonhang` */

insert  into `ctdonhang`(`maCTDonHang`,`maDonHang`,`maSP`,`giaTungSP`,`giamGiaTungSP`,`soLuong`,`tongGiaTri`) values (1,1,2,16990000,0,1,16990000),(2,2,11,10999000,0,4,43996000),(3,2,3,3990000,0,3,11970000);

/*Table structure for table `ctdsmongmuon` */

DROP TABLE IF EXISTS `ctdsmongmuon`;

CREATE TABLE `ctdsmongmuon` (
  `maDSMongMuon` int(11) NOT NULL,
  `maSP` int(11) NOT NULL,
  PRIMARY KEY (`maDSMongMuon`,`maSP`),
  KEY `fk_CTDSMongMuon_SanPham` (`maSP`),
  CONSTRAINT `fk_CTDSMongMuon_DSMonMuon` FOREIGN KEY (`maDSMongMuon`) REFERENCES `danhsachmongmuon` (`maDSMongMuon`),
  CONSTRAINT `fk_CTDSMongMuon_SanPham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ctdsmongmuon` */

/*Table structure for table `ctkhuyenmai` */

DROP TABLE IF EXISTS `ctkhuyenmai`;

CREATE TABLE `ctkhuyenmai` (
  `maKM` int(11) NOT NULL,
  `maSP` int(11) NOT NULL,
  PRIMARY KEY (`maSP`,`maKM`),
  KEY `fk_CTKhuyenMai_KhuyenMai` (`maKM`),
  CONSTRAINT `fk_CTKhuyenMai_KhuyenMai` FOREIGN KEY (`maKM`) REFERENCES `khuyenmai` (`maKM`),
  CONSTRAINT `fk_CTKhuyenMai_SanPham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `ctkhuyenmai` */

/*Table structure for table `ctsanpham` */

DROP TABLE IF EXISTS `ctsanpham`;

CREATE TABLE `ctsanpham` (
  `maCTSP` int(11) NOT NULL AUTO_INCREMENT,
  `maSP` int(11) NOT NULL,
  `trongLuong` float DEFAULT NULL,
  `chieuCao` float DEFAULT NULL,
  `chieuRong` float DEFAULT NULL,
  `doDay` float DEFAULT NULL,
  `ngaySX` date DEFAULT NULL,
  `loaiManhinh` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `soMauManHinh` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `doPhanGiaiManHinh` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `chuanManHinh` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `kichThuocManHinh` float DEFAULT NULL,
  `camUng` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `matDoDiemAnh` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `cameraSau` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `cameraTruoc` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `tinhNangCamera` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `quayPhim` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `videoCall` tinyint(1) DEFAULT NULL,
  `tocDoCPU` float DEFAULT NULL,
  `soNhanCPU` int(11) DEFAULT NULL,
  `chipset` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `RAM` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `GPU` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `boNhoTrong` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `theNhoNgoai` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `dungLuongTheToiDa` int(11) DEFAULT NULL,
  `dungLuongPin` float DEFAULT NULL,
  `congNghePin` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `pinCoTheThaoRoi` tinyint(1) DEFAULT NULL,
  `thoiGianChoToiDa` float DEFAULT NULL,
  `thoiGianChoQuayPhim` float DEFAULT NULL,
  `thoiGianChoGoiDien` float DEFAULT NULL,
  `maHDH` int(11) DEFAULT NULL,
  `loaiBanPhim` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `soLuongSim` int(11) DEFAULT '1',
  `mang2G` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `mang3G` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `mang4G` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `wifi` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `bluetooth` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `GPRS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `GPS` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `boCamBien` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `denFlash` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `denPin` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`maCTSP`),
  KEY `fk_CTSanPham_SanPham` (`maSP`),
  KEY `fk_CTSanPham_HeDieuHanh` (`maHDH`),
  CONSTRAINT `fk_CTSanPham_HeDieuHanh` FOREIGN KEY (`maHDH`) REFERENCES `hedieuhanh` (`maHDH`),
  CONSTRAINT `fk_CTSanPham_SanPham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `ctsanpham` */

insert  into `ctsanpham`(`maCTSP`,`maSP`,`trongLuong`,`chieuCao`,`chieuRong`,`doDay`,`ngaySX`,`loaiManhinh`,`soMauManHinh`,`doPhanGiaiManHinh`,`chuanManHinh`,`kichThuocManHinh`,`camUng`,`matDoDiemAnh`,`cameraSau`,`cameraTruoc`,`tinhNangCamera`,`quayPhim`,`videoCall`,`tocDoCPU`,`soNhanCPU`,`chipset`,`RAM`,`GPU`,`boNhoTrong`,`theNhoNgoai`,`dungLuongTheToiDa`,`dungLuongPin`,`congNghePin`,`pinCoTheThaoRoi`,`thoiGianChoToiDa`,`thoiGianChoQuayPhim`,`thoiGianChoGoiDien`,`maHDH`,`loaiBanPhim`,`soLuongSim`,`mang2G`,`mang3G`,`mang4G`,`wifi`,`bluetooth`,`GPRS`,`GPS`,`boCamBien`,`denFlash`,`denPin`) values (1,1,212,179.4,92.2,6.5,NULL,NULL,'16 triệu màu','1080 x 1920 pixels','Full HD',6.4,'Cảm ứng điện dung đa điểm',NULL,'8.0 MP','2.0 MP','Tự động lấy nét, chạm lấy nét. Nhận diện khuôn mặt, nụ cười.','Quay phim FullHD 1080p@30fps',1,2.2,4,'Qualcomm MSM8974','2 GB','Adreno 330','16 GB','MicroSD (T-Flash)',64,3050,NULL,0,NULL,NULL,NULL,1,NULL,NULL,NULL,'HSDPA, 42 Mbps; HSUPA, 5.76 Mbps','Có','Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot','V4.0 with A2DP',NULL,'A-GPS và GLONASS',NULL,'Không','Không'),(2,2,168,151.2,79.2,8.3,NULL,NULL,' 16 triệu màu','1080 x 1920 pixels','Full HD',5.7,'Cảm ứng điện dung đa điểm',NULL,'13 MP','2.0 MP','Tự động lấy nét, chạm lấy nét. Nhận diện khuôn mặt, nụ cười','Quay phim FullHD 1080p@60fps',1,1.2,8,'Exynos 5420','3 GB','Adreno 330','32 GB','MicroSD (T-Flash)',64,3200,'Pin chuẩn Li-Ion',1,NULL,NULL,NULL,1,NULL,1,NULL,'HSDPA, 42 Mbps; HSUPA, 5.76 Mbps','Không','Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot','Có, V4.0 với A2DP, EDR','Có','A-GPS và GLONASS',NULL,'Có','Không'),(3,3,118,121.5,63.1,10.57,NULL,NULL,' 16 triệu màu','480 x 800 pixels','WVGA',4,'Cảm ứng điện dung đa điểm',NULL,'5.0 MP','VGA (0.3 Mpx)','Tự động lấy nét','Quay phim HD 720p@30fps',1,1.2,2,'Broadcom BCM21664','768 MB','Adreno 200','4 GB','MicroSD (T-Flash)',32,1500,'Pin chuẩn Li-Ion',1,NULL,NULL,NULL,1,NULL,1,NULL,'HSDPA, 21 Mbps; HSUPA, 5.76 Mbps','Không','Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot','Có, V3.0 với A2DP','Có','A-GPS',NULL,'Có','Không'),(4,4,163,146.8,75.3,8.9,NULL,NULL,' 16 triệu màu','720x1280 pixels','HD',5.25,'Cảm ứng điện dung đa điểm',NULL,'8.0 MP','1.9 MP','Tự động lấy nét, chạm lấy nét. Nhận diện khuôn mặt, nụ cườiChống rung','Quay phim FullHD 1080p@30fps',1,1.2,4,'Qualcomm','1.5 GB','Adreno 330','8 GB','MicroSD (T-Flash)',64,2600,'Pin chuẩn Li-Ion',1,NULL,NULL,NULL,1,NULL,2,NULL,'HSDPA, 21 Mbps; HSUPA, 5.76 Mbps','Không','Wi-Fi 802.11 a/b/g/n, dual-band, DLNA, Wi-Fi hotspot','V4.0 với A2DP, EDR','Có','A-GPS và GLONASS',NULL,'Có','Không'),(5,5,235,136.6,69.8,7.9,NULL,NULL,' 16 triệu màu','1080 x 1920 pixels','Full HD',5,'Cảm ứng điện dung đa điểm',NULL,'13.0 MP','2.1 MP','Chạm lấy nét. Nhận diện khuôn mặt, nụ cười. Chống rung','Quay phim FullHD 1080p@30fps',1,1.2,8,'Exynos 5410','2 GB','PowerVR SGX544MP3','16 GB','MicroSD (T-Flash)',64,2600,'Pin chuẩn Li-Ion',1,NULL,NULL,NULL,1,NULL,2,NULL,'HSDPA, 42 Mbps; HSUPA, 5.76 Mbps','Có','Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot','V4.0 với A2DP, EDR','Có','A-GPS và GLONASS',NULL,'Có','Không'),(6,6,209,162.8,85.4,7.7,NULL,NULL,'TrueColor (24-bit/16M)','Full HD (1920 x 1080)','Full HD',6,'Cảm ứng siêu nhạy','368 ppi','20MP, PureView. Tự động lấy nét với phím chụp hai nấc. Ống kính quang học ZEISS, Kích thước cảm biến: 1/6,35 cm. Tầm chiếu sáng của đèn flash: 3.0 m','1280 x 960 pixels, Góc rộng HD 1.2 MP, Quay video, Chụp ảnh tĩnh, Video call',NULL,NULL,NULL,2.2,4,'Tên chip xử lý: Qualcomm Snapdragon™ 800','2 GB',NULL,'32 GB','Có',32,3400,NULL,1,32,NULL,27.4,3,NULL,1,NULL,NULL,NULL,'WLAN IEEE 802.11 a/b/g/n/ac','Bluetooth 4.0',NULL,'Từ kế,A-GPS,Định vị bằng mạng, Wi-Fi, A-GLONASS',NULL,'Tầm chiếu sáng của đèn flash: 3.0 m',NULL),(7,7,158,130.4,71.4,10.4,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768) ','WXGA ',4.5,'Cảm ứng siêu nhạy','334 ppi','PureView, 41 megapixel. Ống kính quang học ZEISS, Kích thước cảm biến: 1/3,81 cm. Tầm chiếu sáng của đèn flash: 4.0 m','Độ phân giải: 1280 x 960 pixels. Góc rộng HD 1.2 MP, Quay video, Chụp ảnh tĩnh, Video call',NULL,NULL,NULL,1.5,2,'Tên chip xử lý: Qualcomm Snapdragon™ S4 ','2 GB',NULL,'32 GB','Có',32,2000,NULL,1,16,NULL,19.1,3,NULL,1,NULL,NULL,NULL,'WLAN IEEE 802.11 a/b/g/n ','Bluetooth 3.0',NULL,'Từ kế,A-GPS,A-GLONASS,Khí áp kế',NULL,'Tầm chiếu sáng của đèn flash: 4.0 m',NULL),(8,8,159,133.2,72.2,9.2,NULL,NULL,'TrueColor (24-bit/16M)',' WVGA (800 x 480) ',NULL,4.7,'Cảm ứng siêu nhạy','201 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'512 MB',NULL,'8GB',NULL,64,2000,NULL,0,23,NULL,23.9,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 b/g/n ','Bluetooth 4.0 + LE',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',NULL,'Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(9,9,139,129,70.6,8.5,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768)',NULL,4.5,'Cảm ứng siêu nhạy','234 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'1 GB',NULL,'16 GB',NULL,64,2000,NULL,0,18,NULL,18.3,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 a/b/g/n','Bluetooth 3.0',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS','Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế','Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(10,10,139,129,70.6,8.5,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768)',NULL,4.5,'Cảm ứng siêu nhạy','234 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'1 GB',NULL,'16 GB',NULL,64,2000,NULL,0,18,NULL,18.3,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 a/b/g/n','Bluetooth 3.0',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS','Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế','Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(11,11,139,129,70.6,8.5,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768)',NULL,4.5,'Cảm ứng siêu nhạy','234 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'1 GB',NULL,'16 GB',NULL,64,2000,NULL,0,18,NULL,18.3,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 a/b/g/n','Bluetooth 3.0',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS','Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế','Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(12,12,139,129,70.6,8.5,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768)',NULL,4.5,'Cảm ứng siêu nhạy','234 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'1 GB',NULL,'16 GB',NULL,64,2000,NULL,0,18,NULL,18.3,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 a/b/g/n','Bluetooth 3.0',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS','Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế','Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(13,13,139,129,70.6,8.5,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768)',NULL,4.5,'Cảm ứng siêu nhạy','234 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'1 GB',NULL,'16 GB',NULL,64,2000,NULL,0,18,NULL,18.3,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 a/b/g/n','Bluetooth 3.0',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS','Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế','Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(14,14,139,129,70.6,8.5,NULL,NULL,'TrueColor (24-bit/16M)','WXGA (1280 x 768)',NULL,4.5,'Cảm ứng siêu nhạy','234 ppi','5 MP','Độ phân giải: 640 x 480 pixels','Tự động lấy nét với phím chụp hai nấc','1080p (Full HD, 1920 x 1080)',1,1,2,NULL,'1 GB',NULL,'16 GB',NULL,64,2000,NULL,0,18,NULL,18.3,3,NULL,NULL,NULL,'Có',NULL,'WLAN IEEE 802.11 a/b/g/n','Bluetooth 3.0',NULL,'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS','Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế','Đèn LED flash. Tâm chiếu sáng 1.0 m','Không'),(15,15,125,131.9,62.8,8.8,NULL,NULL,' 16 triệu màu','540 x 960 pixels','qHD',4.7,'Cảm ứng điện dung đa điểm',NULL,'8.0 MP','VGA (0.3 Mpx)','Tự động lấy nét.','Quay phim FullHD 1080p@30fps',0,1,2,'TI OMAP 4430','1 GB','PowerVR SGX540','4 GB','MicroSD (T-Flash)',32,0,NULL,1,NULL,NULL,NULL,1,NULL,NULL,NULL,'HSDPA, 21 Mbps; HSUPA, 5.76 Mbps','Không','Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot','V2.1 với A2DP','Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps','A-GPS',NULL,'Có','Không');

/*Table structure for table `danhgia` */

DROP TABLE IF EXISTS `danhgia`;

CREATE TABLE `danhgia` (
  `maSP` int(11) NOT NULL,
  `maND` int(11) NOT NULL,
  `diem` float NOT NULL,
  PRIMARY KEY (`maSP`,`maND`),
  KEY `fk_DanhGia_NguoiDung` (`maND`),
  CONSTRAINT `fk_DanhGia_NguoiDung` FOREIGN KEY (`maND`) REFERENCES `nguoidung` (`maND`),
  CONSTRAINT `fk_DanhGia_SanPham` FOREIGN KEY (`maSP`) REFERENCES `sanpham` (`maSP`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `danhgia` */

insert  into `danhgia`(`maSP`,`maND`,`diem`) values (10,1,3),(12,1,5);

/*Table structure for table `danhsachmongmuon` */

DROP TABLE IF EXISTS `danhsachmongmuon`;

CREATE TABLE `danhsachmongmuon` (
  `maDSMongMuon` int(11) NOT NULL AUTO_INCREMENT,
  `maND` int(11) NOT NULL,
  `ngayTao` date DEFAULT NULL,
  PRIMARY KEY (`maDSMongMuon`),
  KEY `fk_DanhSachMongMuon_NguoiDung` (`maND`),
  CONSTRAINT `fk_DanhSachMongMuon_NguoiDung` FOREIGN KEY (`maND`) REFERENCES `nguoidung` (`maND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `danhsachmongmuon` */

/*Table structure for table `donhang` */

DROP TABLE IF EXISTS `donhang`;

CREATE TABLE `donhang` (
  `maDonHang` int(11) NOT NULL AUTO_INCREMENT,
  `maND` int(11) NOT NULL,
  `maNguoiNhan` int(11) NOT NULL,
  `ngayDatHang` date NOT NULL,
  `tongGiaTri` int(11) NOT NULL,
  `giamGia` int(11) DEFAULT '0',
  `maPtGiaoHang` int(11) NOT NULL,
  `maTrangThai` int(11) NOT NULL,
  `maPtThanhToan` int(11) NOT NULL,
  PRIMARY KEY (`maDonHang`),
  KEY `fk_DonHang_NguoiDung` (`maND`),
  KEY `fk_DonHang_NguoiNhan` (`maNguoiNhan`),
  KEY `fk_DonHang_PTGiaoHang` (`maPtGiaoHang`),
  KEY `fk_DonHang_PtThanhToan` (`maPtThanhToan`),
  KEY `fk_DonHang_TrangThaiDonHang` (`maTrangThai`),
  CONSTRAINT `fk_DonHang_NguoiDung` FOREIGN KEY (`maND`) REFERENCES `nguoidung` (`maND`),
  CONSTRAINT `fk_DonHang_NguoiNhan` FOREIGN KEY (`maNguoiNhan`) REFERENCES `nguoinhan` (`maNguoiNhan`),
  CONSTRAINT `fk_DonHang_PTGiaoHang` FOREIGN KEY (`maPtGiaoHang`) REFERENCES `ptgiaohang` (`maPTGiaoHang`),
  CONSTRAINT `fk_DonHang_PtThanhToan` FOREIGN KEY (`maPtThanhToan`) REFERENCES `ptthanhtoan` (`maPTThanhToan`),
  CONSTRAINT `fk_DonHang_TrangThaiDonHang` FOREIGN KEY (`maTrangThai`) REFERENCES `trangthaidonhang` (`maTrangThai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `donhang` */

insert  into `donhang`(`maDonHang`,`maND`,`maNguoiNhan`,`ngayDatHang`,`tongGiaTri`,`giamGia`,`maPtGiaoHang`,`maTrangThai`,`maPtThanhToan`) values (1,1,0,'2013-12-22',16990000,NULL,1,1,1),(2,1,0,'2013-12-22',55966000,NULL,2,1,1);

/*Table structure for table `hedieuhanh` */

DROP TABLE IF EXISTS `hedieuhanh`;

CREATE TABLE `hedieuhanh` (
  `maHDH` int(11) NOT NULL AUTO_INCREMENT,
  `tenHDH` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maHDH`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

/*Data for the table `hedieuhanh` */

insert  into `hedieuhanh`(`maHDH`,`tenHDH`) values (1,'Android'),(2,'iOS'),(3,'Windows Phone'),(4,'Tizen'),(5,'Symbian');

/*Table structure for table `hinhanhsp` */

DROP TABLE IF EXISTS `hinhanhsp`;

CREATE TABLE `hinhanhsp` (
  `maHinhAnh` int(11) NOT NULL AUTO_INCREMENT,
  `maCTSP` int(11) NOT NULL,
  `duongDan` varchar(256) NOT NULL,
  `STT` int(11) NOT NULL,
  PRIMARY KEY (`maHinhAnh`),
  KEY `fk_HinhAnhSP_CTSanPham` (`maCTSP`),
  CONSTRAINT `fk_HinhAnhSP_CTSanPham` FOREIGN KEY (`maCTSP`) REFERENCES `ctsanpham` (`maCTSP`)
) ENGINE=InnoDB AUTO_INCREMENT=79 DEFAULT CHARSET=latin1;

/*Data for the table `hinhanhsp` */

insert  into `hinhanhsp`(`maHinhAnh`,`maCTSP`,`duongDan`,`STT`) values (1,1,'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-300-nowatermark-300x300.jpg',1),(2,1,'resources/images/Smartphone/Sony/XperiaZUltra/Sony-Xperia-Z-Ultra-1-2.jpg.png',2),(3,1,'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-2.jpg',3),(4,1,'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-3.jpg',4),(5,1,'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-4.jpg',5),(6,1,'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra_clip_image002.jpg.png',6),(7,2,'resources/images/Smartphone/SamSung/GalaxyNote3/Ne--Easy-Clip-galaxy-note-3.jpg',1),(8,2,'resources/images/Smartphone/SamSung/GalaxyNote3/camera-galaxy-note-3.jpg',2),(9,2,'resources/images/Smartphone/SamSung/GalaxyNote3/s-new-note-galaxy-note-3.jpg',3),(10,3,'resources/images/Smartphone/SamSung/GalaxyTrendPlus/Samsung-Galaxy-Trend-Plus-5.jpg',1),(11,3,'resources/images/Smartphone/SamSung/GalaxyTrendPlus/Samsung-Galaxy-Trend-Plus-14.jpg',2),(12,3,'resources/images/Smartphone/SamSung/GalaxyTrendPlus/Samsung-Galaxy-Trend-Plus-S7580-Trang-9.jpg',3),(13,4,'resources/images/Smartphone/SamSung/GalaxyGrand2/ban-hang-galaxy-grand-355x220-2.jpg',1),(14,5,'resources/images/Smartphone/SamSung/GalaxyS4/SmartScreen-galaxy-S4.jpg',1),(15,5,'resources/images/Smartphone/SamSung/GalaxyS4/camera-galaxy-s4.jpg',2),(16,6,'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-0.png',1),(17,6,'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-1.jpg',2),(18,6,'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-2.jpg',3),(19,6,'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-3.jpg',4),(20,6,'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-4.jpg',5),(21,7,'resources/images/Smartphone/Nokia/Lumia1020/Nokia-Lumia-1020-1.png',1),(22,7,'resources/images/Smartphone/Nokia/Lumia1020/Nokia-Lumia-1020-2.png',2),(23,8,'resources/images/Smartphone/Nokia/Lumia625/product-detail-625-front-png.png',1),(24,8,'resources/images/Smartphone/Nokia/Lumia625/Product-Spec-40x500-png.png',2),(25,8,'resources/images/Smartphone/Nokia/Lumia625/Lumia-Max-KSP-1500x1500-jpg.jpg',3),(26,8,'resources/images/Smartphone/Nokia/Lumia625/Lumia-Max-KSP-1500x1500-jpg-2.jpg',4),(27,8,'resources/images/Smartphone/Nokia/Lumia625/Nokia-Lumia-625-Windows-Phone.jpg',5),(28,8,'resources/images/Smartphone/Nokia/Lumia625/Lumia-Max-KSP-1500x1500-jpg-3.jpg',6),(29,9,'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-front.png',1),(30,9,'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-side.png',2),(31,9,'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-wireless-charging-stand-jpg.jpg',3),(32,9,'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-smart-camera-jpg.jpg',4),(33,9,'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925.jpg',5),(34,9,'resources/images/Smartphone/Nokia/Lumia925/Lumia-925-procam-ksp-1500x1500-jpg.jpg',6),(35,10,'resources/images/Smartphone/Nokia/Lumia520/nokia-lumia520-png.png',1),(36,10,'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520-side.png',2),(37,10,'resources/images/Smartphone/Nokia/Lumia520/Lumia-520-Live-Tiles---Line.jpg',3),(38,10,'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520---Line.jpg',4),(39,10,'resources/images/Smartphone/Nokia/Lumia520/Lumia-520-HERE-Maps.jpg',5),(40,10,'resources/images/Smartphone/Nokia/Lumia520/Lumia-520-digital-lens.jpg',6),(41,10,'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520-2.jpg',7),(42,10,'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520-3-jpg.jpg',8),(43,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-front.png',1),(44,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-side.png',2),(45,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-City-Lens.jpg',3),(46,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-Office-App.jpg',4),(47,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-wireless-charging.jpg',5),(48,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-Glance-screen-jpg.jpg',6),(49,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-Smart-Camera-jpg.jpg',8),(50,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-hero-1-jpg.jpg',9),(51,11,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-jpg.png',10),(52,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-lumia-920-spec-side-png.png',1),(53,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-Smart-Camera-jpg.jpg',2),(54,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-Glance-screen-jpg.jpg',3),(55,12,'resources/images/Smartphone/Nokia/Lumia920/lumia-920-procam-ksp-1500x1500-jpg.jpg',4),(56,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-HERE-City-Lens.jpg',5),(57,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-Wireless-charging.jpg',6),(58,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-engadget-awards-2012.jpg',8),(59,12,'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-yellow-Engadget-Awards.jpg',9),(60,12,'resources/images/Smartphone/Nokia/Lumia920/nokia-lumia-920-jbl-speaker-jpg.jpg',10),(61,13,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-white-front.png',1),(62,13,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-white-side.png',2),(63,13,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-Microsoft-Office.jpg',3),(64,13,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-apps.jpg',4),(65,13,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-Marketplace.jpg',5),(66,13,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-photoalbum.jpg',6),(67,14,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-cyan-side.png',1),(68,14,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-with-angry-birds.jpg',2),(69,14,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-Mix-Radio.jpg',3),(70,14,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-screen.jpg',4),(71,14,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-calendar.jpg',5),(72,14,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-photoalbum.jpg',6),(73,15,'resources/images/Smartphone/LG/OptimusL9/LG-Optimus-L9-P760-l.jpg',1),(74,15,'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-2.jpg',2),(75,15,'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-3.jpg',3),(76,15,'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-4.jpg',4),(77,15,'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-5.jpg',5),(78,15,'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-6.jpg',6);

/*Table structure for table `khuyenmai` */

DROP TABLE IF EXISTS `khuyenmai`;

CREATE TABLE `khuyenmai` (
  `maKM` int(11) NOT NULL AUTO_INCREMENT,
  `tieuDe` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `moTa` varchar(400) CHARACTER SET utf8 DEFAULT NULL,
  `phanTramGiamGia` float DEFAULT NULL,
  `ngayBatDau` date DEFAULT NULL,
  `ngayKetThuc` date DEFAULT NULL,
  `quaTang` varchar(200) CHARACTER SET utf8 DEFAULT NULL,
  `maTrangThaiKM` int(11) NOT NULL,
  PRIMARY KEY (`maKM`),
  KEY `fk_KhuyenMai_TrangThaiKhuyenMai` (`maTrangThaiKM`),
  CONSTRAINT `fk_KhuyenMai_TrangThaiKhuyenMai` FOREIGN KEY (`maTrangThaiKM`) REFERENCES `trangthaikhuyenmai` (`maTrangThai`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `khuyenmai` */

/*Table structure for table `lienhe` */

DROP TABLE IF EXISTS `lienhe`;

CREATE TABLE `lienhe` (
  `maLienHe` int(11) NOT NULL,
  `email` varchar(256) CHARACTER SET utf8 NOT NULL,
  `hoTen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `noiDung` varchar(800) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maLienHe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `lienhe` */

/*Table structure for table `loainguoidung` */

DROP TABLE IF EXISTS `loainguoidung`;

CREATE TABLE `loainguoidung` (
  `maLoaiND` int(11) NOT NULL AUTO_INCREMENT,
  `tenLoaiND` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maLoaiND`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `loainguoidung` */

insert  into `loainguoidung`(`maLoaiND`,`tenLoaiND`) values (1,'Khách hàng phổ thông');

/*Table structure for table `loaisanpham` */

DROP TABLE IF EXISTS `loaisanpham`;

CREATE TABLE `loaisanpham` (
  `maLoaiSP` int(11) NOT NULL AUTO_INCREMENT,
  `tenLoaiSP` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maLoaiSP`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `loaisanpham` */

insert  into `loaisanpham`(`maLoaiSP`,`tenLoaiSP`) values (1,'Điện thoại di động');

/*Table structure for table `nguoidung` */

DROP TABLE IF EXISTS `nguoidung`;

CREATE TABLE `nguoidung` (
  `maND` int(11) NOT NULL AUTO_INCREMENT,
  `ho` varchar(30) CHARACTER SET utf8 NOT NULL,
  `ten` varchar(20) CHARACTER SET utf8 NOT NULL,
  `email` varchar(256) CHARACTER SET utf8 NOT NULL,
  `matKhau` varchar(32) CHARACTER SET utf8 NOT NULL,
  `maLoaiND` int(11) DEFAULT NULL,
  `gioiTinh` int(11) DEFAULT NULL,
  `ngaySinh` date NOT NULL,
  `hinhDaiDien` varchar(256) DEFAULT NULL,
  `soDienThoai` varchar(15) DEFAULT NULL,
  `diaChi` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `nhanTinQuaEmail` tinyint(1) DEFAULT '0',
  `enable` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`maND`),
  KEY `fk_NguoiDung_LoaiNguoiDung` (`maLoaiND`),
  CONSTRAINT `fk_NguoiDung_LoaiNguoiDung` FOREIGN KEY (`maLoaiND`) REFERENCES `loainguoidung` (`maLoaiND`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `nguoidung` */

insert  into `nguoidung`(`maND`,`ho`,`ten`,`email`,`matKhau`,`maLoaiND`,`gioiTinh`,`ngaySinh`,`hinhDaiDien`,`soDienThoai`,`diaChi`,`nhanTinQuaEmail`,`enable`) values (1,'Nguy?n','Lâm','lamhaison@gmail.com','917cce88e0510b78bb2d11286af982b9',NULL,1,'2013-12-08',NULL,'01675489757','Tp HCM',NULL,1);

/*Table structure for table `nguoinhan` */

DROP TABLE IF EXISTS `nguoinhan`;

CREATE TABLE `nguoinhan` (
  `maNguoiNhan` int(11) NOT NULL,
  `maND` int(11) NOT NULL,
  `hoTen` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `soDienThoai` varchar(15) DEFAULT NULL,
  `diaChi` varchar(100) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maNguoiNhan`),
  KEY `fk_NguoiNhan_NguoiDung` (`maND`),
  CONSTRAINT `fk_NguoiNhan_NguoiDung` FOREIGN KEY (`maND`) REFERENCES `nguoidung` (`maND`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `nguoinhan` */

insert  into `nguoinhan`(`maNguoiNhan`,`maND`,`hoTen`,`soDienThoai`,`diaChi`) values (0,1,'lamhaison','01675489757','TP HCM');

/*Table structure for table `nhasanxuat` */

DROP TABLE IF EXISTS `nhasanxuat`;

CREATE TABLE `nhasanxuat` (
  `maNhaSX` int(11) NOT NULL AUTO_INCREMENT,
  `tenNhaSX` varchar(30) CHARACTER SET utf8 NOT NULL,
  `logo` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`maNhaSX`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `nhasanxuat` */

insert  into `nhasanxuat`(`maNhaSX`,`tenNhaSX`,`logo`) values (1,'Apple',NULL),(2,'HTC',NULL),(3,'LG',NULL),(4,'Nokia',NULL),(5,'Samsung',NULL),(6,'Sony',NULL);

/*Table structure for table `phanquyen` */

DROP TABLE IF EXISTS `phanquyen`;

CREATE TABLE `phanquyen` (
  `maND` int(11) NOT NULL,
  `maVaiTro` int(11) NOT NULL,
  PRIMARY KEY (`maND`,`maVaiTro`),
  KEY `fk_PhanQuyen_VaiTro` (`maVaiTro`),
  CONSTRAINT `fk_PhanQuyen_NguoiDung` FOREIGN KEY (`maND`) REFERENCES `nguoidung` (`maND`),
  CONSTRAINT `fk_PhanQuyen_VaiTro` FOREIGN KEY (`maVaiTro`) REFERENCES `vaitro` (`maVaiTro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `phanquyen` */

insert  into `phanquyen`(`maND`,`maVaiTro`) values (1,2);

/*Table structure for table `phieugiaohang` */

DROP TABLE IF EXISTS `phieugiaohang`;

CREATE TABLE `phieugiaohang` (
  `maPhieuGiaoHang` int(11) NOT NULL AUTO_INCREMENT,
  `maDonHang` int(11) NOT NULL,
  `ngayGiao` date NOT NULL,
  PRIMARY KEY (`maPhieuGiaoHang`),
  KEY `fk_PhieuGiaoHang_DonHang` (`maDonHang`),
  CONSTRAINT `fk_PhieuGiaoHang_DonHang` FOREIGN KEY (`maDonHang`) REFERENCES `donhang` (`maDonHang`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `phieugiaohang` */

/*Table structure for table `ptgiaohang` */

DROP TABLE IF EXISTS `ptgiaohang`;

CREATE TABLE `ptgiaohang` (
  `maPTGiaoHang` int(11) NOT NULL AUTO_INCREMENT,
  `tenPTGiaoHang` varchar(50) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maPTGiaoHang`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ptgiaohang` */

insert  into `ptgiaohang`(`maPTGiaoHang`,`tenPTGiaoHang`) values (1,'Chuyển đến tận nơi'),(2,'Chuyển qua bưu điện'),(3,'Khách hàng đến lấy sản phẩm');

/*Table structure for table `ptthanhtoan` */

DROP TABLE IF EXISTS `ptthanhtoan`;

CREATE TABLE `ptthanhtoan` (
  `maPTThanhToan` int(11) NOT NULL AUTO_INCREMENT,
  `tenPTThanhToan` varchar(50) CHARACTER SET utf8 NOT NULL,
  `ghiChu` varchar(800) DEFAULT NULL,
  PRIMARY KEY (`maPTThanhToan`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

/*Data for the table `ptthanhtoan` */

insert  into `ptthanhtoan`(`maPTThanhToan`,`tenPTThanhToan`,`ghiChu`) values (1,'Chuyển khoản ngân hàng',NULL),(2,'Trả tiển khi nhận hàng',NULL),(3,'Trả tiền tại siêu thị',NULL);

/*Table structure for table `sanpham` */

DROP TABLE IF EXISTS `sanpham`;

CREATE TABLE `sanpham` (
  `maSP` int(11) NOT NULL AUTO_INCREMENT,
  `tenSP` varchar(100) CHARACTER SET utf8 NOT NULL,
  `gioiThieu` varchar(800) CHARACTER SET utf8 DEFAULT NULL,
  `gia` int(11) DEFAULT '0',
  `soThangBaoHanh` int(11) DEFAULT NULL,
  `hinhDaiDien` varchar(256) DEFAULT NULL,
  `soLuongHienCo` int(11) DEFAULT '0',
  `tongSoLuong` int(11) DEFAULT '0',
  `ngayNhap` date DEFAULT NULL,
  `maLoaiSP` int(11) NOT NULL,
  `maNhaSX` int(11) DEFAULT NULL,
  `diemDanhGiaTB` float DEFAULT '0',
  PRIMARY KEY (`maSP`),
  KEY `fk_SanPham_NhaSanXuat` (`maNhaSX`),
  KEY `fk_SanPham_LoaiSanPham` (`maLoaiSP`),
  CONSTRAINT `fk_SanPham_LoaiSanPham` FOREIGN KEY (`maLoaiSP`) REFERENCES `loaisanpham` (`maLoaiSP`),
  CONSTRAINT `fk_SanPham_NhaSanXuat` FOREIGN KEY (`maNhaSX`) REFERENCES `nhasanxuat` (`maNhaSX`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=latin1;

/*Data for the table `sanpham` */

insert  into `sanpham`(`maSP`,`tenSP`,`gioiThieu`,`gia`,`soThangBaoHanh`,`hinhDaiDien`,`soLuongHienCo`,`tongSoLuong`,`ngayNhap`,`maLoaiSP`,`maNhaSX`,`diemDanhGiaTB`) values (1,'Sony Xperia Z Ultra',NULL,13990000,24,'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-300-nowatermark-120x120.jpg',50,50,'2013-12-22',1,6,0),(2,'Samsung Galaxy Note 3 N9000',NULL,16990000,24,'resources/images/Smartphone/SamSung/GalaxyNote3/galaxy-note-3-300-nowatermark-120x120.jpg',50,50,'2013-12-22',1,5,5),(3,'Samsung Galaxy Trend Plus',NULL,3990000,24,'resources/images/Smartphone/SamSung/GalaxyTrendPlus/samsung-galaxy-trend-plus-s7580-300-nowatermark-120x120.jpg',50,50,'2013-12-22',1,5,0),(4,'Samsung Galaxy Grand 2',NULL,84990000,24,'resources/images/Smartphone/SamSung/GalaxyGrand2/samsung-galaxy-grand-2-g7102-300-nowatermark-120x120.jpg',50,50,'2013-12-22',1,5,0),(5,'Samsung Galaxy S4 i9500',NULL,13990000,24,'resources/images/Smartphone/SamSung/GalaxyS4/Samsung-Galaxy-S4-I9500-m.jpg',50,50,'2013-12-22',1,5,0),(6,'Nokia Lumia 1520','<Chua chen mo ta>',15999000,24,'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-0.png',50,50,'2013-12-22',1,4,4),(7,'Nokia Lumia 1020','<Chua chen mo ta>',14999000,24,'resources/images/Smartphone/Nokia/Lumia1020/Nokia-Lumia-1020-1.png',50,50,'2013-12-22',1,4,0),(8,'Nokia Lumia 625',NULL,4999000,24,'resources/images/Smartphone/Nokia/Lumia625/product-detail-625-front-png.png',50,50,'2013-12-22',1,4,0),(9,'Nokia Lumia 925',NULL,10999000,24,'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-front.png',50,50,'2013-12-22',1,4,0),(10,'Nokia Lumia 520',NULL,2999000,24,'resources/images/Smartphone/Nokia/Lumia520/nokia-lumia520-png.png',50,50,'2013-12-22',1,4,3),(11,'Nokia Lumia 820',NULL,10999000,24,'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-front.png',50,50,'2013-12-22',1,4,0),(12,'Nokia Lumia 920',NULL,9999000,24,'resources/images/Smartphone/Nokia/Lumia920/Nokia-lumia-920-spec-front-png.png',50,50,'2013-12-22',1,4,5),(13,'Nokia Lumia 800',NULL,8999000,24,'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-white-front.png',50,50,'2013-12-22',1,4,0),(14,'Nokia Lumia 900',NULL,10999000,24,'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-cyan-front.png',50,50,'2013-12-22',1,4,0),(15,'LG Optimus L9',NULL,6050000,24,'resources/images/Smartphone/LG/OptimusL9/LG-Optimus-L9-P760-m.jpg',50,50,'2013-12-22',1,3,0);

/*Table structure for table `trangthaidonhang` */

DROP TABLE IF EXISTS `trangthaidonhang`;

CREATE TABLE `trangthaidonhang` (
  `maTrangThai` int(11) NOT NULL AUTO_INCREMENT,
  `tenTrangThai` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maTrangThai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `trangthaidonhang` */

insert  into `trangthaidonhang`(`maTrangThai`,`tenTrangThai`) values (1,'Chưa giao'),(2,'Đã giao');

/*Table structure for table `trangthaikhuyenmai` */

DROP TABLE IF EXISTS `trangthaikhuyenmai`;

CREATE TABLE `trangthaikhuyenmai` (
  `maTrangThai` int(11) NOT NULL AUTO_INCREMENT,
  `tenTrangThai` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maTrangThai`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `trangthaikhuyenmai` */

insert  into `trangthaikhuyenmai`(`maTrangThai`,`tenTrangThai`) values (1,'Đang mở'),(2,'Đã đóng');

/*Table structure for table `vaitro` */

DROP TABLE IF EXISTS `vaitro`;

CREATE TABLE `vaitro` (
  `maVaiTro` int(11) NOT NULL AUTO_INCREMENT,
  `tenVaiTro` varchar(30) CHARACTER SET utf8 NOT NULL,
  PRIMARY KEY (`maVaiTro`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `vaitro` */

insert  into `vaitro`(`maVaiTro`,`tenVaiTro`) values (1,'Admin'),(2,'User');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
