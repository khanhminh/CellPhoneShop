# Phien ban 0.3
# Ngày: 19/12/2013

use CellPhoneShop;


# Thông tin lấy từ nguồn: www.nokia.com

DELIMITER //
CREATE PROCEDURE chenDuLieuDienThoaiNokia()
	BEGIN
		DECLARE maSP INT;
		DECLARE maNhaSX INT;
		DECLARE maLoaiSP INT;
		DECLARE maHDH INT;
		DECLARE ngayNhap DATE;
		
		DECLARE maCTSP INT;
		
		SELECT DISTINCT(LSP.maLoaiSP)
		INTO maLoaiSP
		FROM LoaiSanPham AS LSP
		WHERE LSP.tenLoaiSP LIKE 'Điện thoại di động';
		
		SELECT DISTINCT(NSX.maNhaSX)
		INTO maNhaSX
		FROM NhaSanXuat AS NSX
		WHERE NSX.tenNhaSX LIKE 'Nokia';
		
		SELECT DISTINCT(HDH.maHDH)
		INTO maHDH
		FROM HeDieuHanh AS HDH
		WHERE HDH.tenHDH LIKE 'Windows Phone';
		
		SET ngayNhap = NOW();
		
		#======================================================================================================================================
		# Nokia Lumia 1520  ===================================================================================================================
		#======================================================================================================================================
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 1520',
				'<Chua chen mo ta>',
				15999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-0.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 1520';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tocDoCPU, soNhanCPU, chipset, RAM, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoGoiDien, maHDH, wifi, bluetooth, GPS, denFlash)
		VALUES (maSP, 209, 162.8, 85.4, 7.7, 'TrueColor (24-bit/16M)', 'Full HD (1920 x 1080)', 'Full HD', 6, N'Cảm ứng siêu nhạy', '368 ppi', '20MP, PureView. Tự động lấy nét với phím chụp hai nấc. Ống kính quang học ZEISS, Kích thước cảm biến: 1/6,35 cm. Tầm chiếu sáng của đèn flash: 3.0 m', '1280 x 960 pixels, Góc rộng HD 1.2 MP, Quay video, Chụp ảnh tĩnh, Video call', 2.2, 4, 'Tên chip xử lý: Qualcomm Snapdragon™ 800', '2 GB', '32 GB', 'Có', 32, '3400 mAh', 1, 32, 27.4, maHDH, 'WLAN IEEE 802.11 a/b/g/n/ac', 'Bluetooth 4.0', 'Từ kế,A-GPS,Định vị bằng mạng, Wi-Fi, A-GLONASS', 'Tầm chiếu sáng của đèn flash: 3.0 m');
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-0.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-1.jpg', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-2.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-3.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1520/Nokia-Lumia-1520-4.jpg', 5);
		
		
		#=====================================================================================================================================
		# Nokia Lumia 1020 ===================================================================================================================
		#=====================================================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 1020',
				'<Chua chen mo ta>',
				14999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia1020/Nokia-Lumia-1020-1.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
				
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 1020';
				
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tocDoCPU, soNhanCPU, chipset, RAM, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoGoiDien, maHDH, wifi, bluetooth, GPS, denFlash)
		VALUES (maSP, 158, 130.4, 71.4, 10.4, 'TrueColor (24-bit/16M)', 'WXGA (1280 x 768) ', 'WXGA ', 4.5, N'Cảm ứng siêu nhạy', '334 ppi', 'PureView, 41 megapixel. Ống kính quang học ZEISS, Kích thước cảm biến: 1/3,81 cm. Tầm chiếu sáng của đèn flash: 4.0 m', 'Độ phân giải: 1280 x 960 pixels. Góc rộng HD 1.2 MP, Quay video, Chụp ảnh tĩnh, Video call', 1.5, 2, 'Tên chip xử lý: Qualcomm Snapdragon™ S4 ', '2 GB', '32 GB', 'Có', 32, '2000 mAh', 1, 16, 19.1, maHDH, 'WLAN IEEE 802.11 a/b/g/n ', 'Bluetooth 3.0', 'Từ kế,A-GPS,A-GLONASS,Khí áp kế', 'Tầm chiếu sáng của đèn flash: 4.0 m');
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1020/Nokia-Lumia-1020-1.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia1020/Nokia-Lumia-1020-2.png', 2);
		
		
		
		#===================================================================================================
		#==== Nokia Lumia 625 =============================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 625',
				NULL,
				4999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia625/product-detail-625-front-png.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 625';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			159, 			# trongLuong
			133.2,			# chieuCao
			72.2, 			# chieuRong
			9.2,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			' WVGA (800 x 480) ',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.7,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'201 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			2,				    # soNhanCPU int
			NULL,				# chipset
			'512 MB',				# RAM
			NULL,				# GPU
			'8GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			23,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			23.9,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 b/g/n ',		# wifi
			'Bluetooth 4.0 + LE',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			NULL,				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia625/product-detail-625-front-png.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia625/Product-Spec-40x500-png.png', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia625/Lumia-Max-KSP-1500x1500-jpg.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia625/Lumia-Max-KSP-1500x1500-jpg-2.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia625/Nokia-Lumia-625-Windows-Phone.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia625/Lumia-Max-KSP-1500x1500-jpg-3.jpg', 6);
		
		
		#===================================================================================================
		#==== Nokia Lumia 925 ???===========================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 925',
				NULL,
				10999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-front.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 925';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			139, 			# trongLuong
			129,			# chieuCao
			70.6, 			# chieuRong
			8.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			'WXGA (1280 x 768)',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.5,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'234 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			1.5,				    # soNhanCPU int
			NULL,				# chipset
			'1 GB',				# RAM
			NULL,				# GPU
			'16 GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			18,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			18.3,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 a/b/g/n',		# wifi
			'Bluetooth 3.0',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			'Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế',				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-front.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-side.png', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-wireless-charging-stand-jpg.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925-smart-camera-jpg.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia925/Nokia-Lumia-925.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia925/Lumia-925-procam-ksp-1500x1500-jpg.jpg', 6);
		
		
		#===================================================================================================
		#==== Nokia Lumia 520 ???===========================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 520',
				NULL,
				2999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia520/nokia-lumia520-png.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 520';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			139, 			# trongLuong
			129,			# chieuCao
			70.6, 			# chieuRong
			8.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			'WXGA (1280 x 768)',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.5,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'234 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			1.5,				    # soNhanCPU int
			NULL,				# chipset
			'1 GB',				# RAM
			NULL,				# GPU
			'16 GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			18,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			18.3,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 a/b/g/n',		# wifi
			'Bluetooth 3.0',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			'Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế',				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/nokia-lumia520-png.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520-side.png', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Lumia-520-Live-Tiles---Line.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520---Line.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Lumia-520-HERE-Maps.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Lumia-520-digital-lens.jpg', 6);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520-2.jpg', 7);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia520/Nokia-Lumia-520-3-jpg.jpg', 8);
		
		
		#===================================================================================================
		#==== Nokia Lumia 820 ???===========================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 820',
				NULL,
				2999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-front.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 820';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			139, 			# trongLuong
			129,			# chieuCao
			70.6, 			# chieuRong
			8.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			'WXGA (1280 x 768)',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.5,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'234 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			1.5,				    # soNhanCPU int
			NULL,				# chipset
			'1 GB',				# RAM
			NULL,				# GPU
			'16 GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			18,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			18.3,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 a/b/g/n',		# wifi
			'Bluetooth 3.0',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			'Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế',				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-front.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-side.png', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-City-Lens.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-Office-App.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-wireless-charging.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-Glance-screen-jpg.jpg', 6);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-Smart-Camera-jpg.jpg', 8);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-hero-1-jpg.jpg', 9);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia820/Nokia-Lumia-820-jpg.png', 10);
		
		
		#===================================================================================================
		#==== Nokia Lumia 920 ???===========================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 920',
				NULL,
				2999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia920/Nokia-lumia-920-spec-front-png.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 920';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			139, 			# trongLuong
			129,			# chieuCao
			70.6, 			# chieuRong
			8.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			'WXGA (1280 x 768)',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.5,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'234 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			1.5,				    # soNhanCPU int
			NULL,				# chipset
			'1 GB',				# RAM
			NULL,				# GPU
			'16 GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			18,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			18.3,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 a/b/g/n',		# wifi
			'Bluetooth 3.0',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			'Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế',				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-lumia-920-spec-side-png.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-Smart-Camera-jpg.jpg', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-Glance-screen-jpg.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/lumia-920-procam-ksp-1500x1500-jpg.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-HERE-City-Lens.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-Wireless-charging.jpg', 6);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-engadget-awards-2012.jpg', 8);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/Nokia-Lumia-920-yellow-Engadget-Awards.jpg', 9);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia920/nokia-lumia-920-jbl-speaker-jpg.jpg', 10);
		
		
		#===================================================================================================
		#==== Nokia Lumia 800 ???===========================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 800',
				NULL,
				2999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-white-front.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 800';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			139, 			# trongLuong
			129,			# chieuCao
			70.6, 			# chieuRong
			8.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			'WXGA (1280 x 768)',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.5,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'234 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			1.5,				    # soNhanCPU int
			NULL,				# chipset
			'1 GB',				# RAM
			NULL,				# GPU
			'16 GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			18,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			18.3,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 a/b/g/n',		# wifi
			'Bluetooth 3.0',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			'Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế',				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-white-front.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-white-side.png', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-Microsoft-Office.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-apps.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-Marketplace.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia800/Nokia-Lumia-800-photoalbum.jpg', 6);
		
		
		#===================================================================================================
		#==== Nokia Lumia 900 ???===========================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Nokia Lumia 900',
				NULL,
				2999000,
				24,
				'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-cyan-front.png',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Nokia Lumia 900';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			139, 			# trongLuong
			129,			# chieuCao
			70.6, 			# chieuRong
			8.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'TrueColor (24-bit/16M)',				# soMauManHinh
			'WXGA (1280 x 768)',					# doPhanGiaiManHinh
			NULL,				# chuanManHinh
			4.5,					# kichThuocManHinh float
			'Cảm ứng siêu nhạy',				# camUng
			'234 ppi',				# matDoDiemAnh
			'5 MP',					# cameraSau
			'Độ phân giải: 640 x 480 pixels',				# cameraTruoc
			'Tự động lấy nét với phím chụp hai nấc',	    # tinhNangCamera
			'1080p (Full HD, 1920 x 1080)',					# quayPhim
			true,				# videoCall boolean
			1,				# tocDoCPU float
			1.5,				    # soNhanCPU int
			NULL,				# chipset
			'1 GB',				# RAM
			NULL,				# GPU
			'16 GB',				# boNhoTrong
			NULL,				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2000,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			18,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			18.3,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'Có',				# mang3G
			NULL,				# mang4G
			'WLAN IEEE 802.11 a/b/g/n',		# wifi
			'Bluetooth 3.0',				# bluetooth
			NULL,				# GPRS
			'A-GPS, Định vị bằng mạng di động và Wi-Fi, A-GLONASS',				# GPS
			'Ambient Light Sensor, Gia tốc kế, Con quay hồi chuyển (Gyroscope), Proximity Sensor, Từ kế',				# boCamBien
			'Đèn LED flash. Tâm chiếu sáng 1.0 m',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-cyan-side.png', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-with-angry-birds.jpg', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-Mix-Radio.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-screen.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-calendar.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Nokia/Lumia900/Nokia-Lumia-900-photoalbum.jpg', 6);
	END //
DELIMITER ;
CALL chenDuLieuDienThoaiNokia();
DROP PROCEDURE IF EXISTS chenDuLieuDienThoaiNokia;
 
