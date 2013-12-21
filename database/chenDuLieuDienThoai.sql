# Phien ban 0.4
# Ngày: 21/12/2013

use CellPhoneShop;

# Thông tin và hình ảnh lấy từ trang thegioididong.com

DELIMITER //
CREATE PROCEDURE chenDuLieuDienThoaiSony()
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
		WHERE NSX.tenNhaSX LIKE 'Sony';
		
		SELECT DISTINCT(HDH.maHDH)
		INTO maHDH
		FROM HeDieuHanh AS HDH
		WHERE HDH.tenHDH LIKE 'Android';
		
		SET ngayNhap = NOW();
		
		#===================================================================================================
		#==== Sony Xperia Z Ultra  =============================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Sony Xperia Z Ultra',
				NULL,
				13990000,
				24,
				'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-300-nowatermark-120x120.jpg',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Sony Xperia Z Ultra';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			212, 			# trongLuong
			179.4,			# chieuCao
			92.2, 			# chieuRong
			6.5,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			'16 triệu màu',				# soMauManHinh
			'1080 x 1920 pixels',					# doPhanGiaiManHinh
			'Full HD',				# chuanManHinh
			6.4,					# kichThuocManHinh float
			'Cảm ứng điện dung đa điểm',				# camUng
			NULL,				# matDoDiemAnh
			'8.0 MP',					# cameraSau
			'2.0 MP',				# cameraTruoc
			'Tự động lấy nét, chạm lấy nét. Nhận diện khuôn mặt, nụ cười.',	    # tinhNangCamera
			'Quay phim FullHD 1080p@30fps',					# quayPhim
			true,				# videoCall boolean
			2.2,				# tocDoCPU float
			4,				    # soNhanCPU int
			'Qualcomm MSM8974',				# chipset
			'2 GB',				# RAM
			'Adreno 330',				# GPU
			'16 GB',				# boNhoTrong
			'MicroSD (T-Flash)',				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			3050,				# dungLuongPin float
			NULL,				# congNghePin
			FALSE,				# pinCoTheThaoRoi boolean
			NULL,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			NULL,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'HSDPA, 42 Mbps; HSUPA, 5.76 Mbps',				# mang3G
			'Có',				# mang4G
			'Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot',		# wifi
			'V4.0 with A2DP',				# bluetooth
			NULL,				# GPRS
			'A-GPS và GLONASS',				# GPS
			NULL,				# boCamBien
			'Không',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-300-nowatermark-300x300.jpg', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Sony/XperiaZUltra/Sony-Xperia-Z-Ultra-1-2.jpg.png', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-2.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-3.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra-4.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/Sony/XperiaZUltra/sony-xperia-z-ultra_clip_image002.jpg.png', 6);
	END //
DELIMITER ;
CALL chenDuLieuDienThoaiSony();
DROP PROCEDURE IF EXISTS chenDuLieuDienThoaiSony;
	
DELIMITER //
CREATE PROCEDURE chenDuLieuDienThoaiSamsung()
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
		WHERE NSX.tenNhaSX LIKE 'Samsung';
		
		SELECT DISTINCT(HDH.maHDH)
		INTO maHDH
		FROM HeDieuHanh AS HDH
		WHERE HDH.tenHDH LIKE 'Android';
		
		SET ngayNhap = NOW();
		
		#===================================================================================================
		#==== Samsung Galaxy Note 3 N9000 ==================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Samsung Galaxy Note 3 N9000',
				NULL,
				16990000,
				24,
				'resources/images/Smartphone/SamSung/GalaxyNote3/galaxy-note-3-300-nowatermark-120x120.jpg',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Samsung Galaxy Note 3 N9000';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			168, 			# trongLuong
			151.2,			# chieuCao
			79.2, 			# chieuRong
			8.3,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			' 16 triệu màu',				# soMauManHinh
			'1080 x 1920 pixels',					# doPhanGiaiManHinh
			'Full HD',				# chuanManHinh
			5.7,					# kichThuocManHinh float
			'Cảm ứng điện dung đa điểm',				# camUng
			NULL,				# matDoDiemAnh
			'13 MP',					# cameraSau
			'2.0 MP',				# cameraTruoc
			'Tự động lấy nét, chạm lấy nét. Nhận diện khuôn mặt, nụ cười',	    # tinhNangCamera
			'Quay phim FullHD 1080p@60fps',					# quayPhim
			true,				# videoCall boolean
			1.2,				# tocDoCPU float
			8,				    # soNhanCPU int
			'Exynos 5420',				# chipset
			'3 GB',				# RAM
			'Adreno 330',				# GPU
			'32 GB',				# boNhoTrong
			'MicroSD (T-Flash)',				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			3200,				# dungLuongPin float
			'Pin chuẩn Li-Ion',				# congNghePin
			TRUE,				# pinCoTheThaoRoi boolean
			NULL,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			NULL,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			1,				# soLuongSim int
			NULL,				# mang2G
			'HSDPA, 42 Mbps; HSUPA, 5.76 Mbps',				# mang3G
			'Không',				# mang4G
			'Wi-Fi 802.11 a/b/g/n/ac, dual-band, DLNA, Wi-Fi Direct, Wi-Fi hotspot',		# wifi
			'Có, V4.0 với A2DP, EDR',				# bluetooth
			'Có',				# GPRS
			'A-GPS và GLONASS',				# GPS
			NULL,				# boCamBien
			'Có',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyNote3/Ne--Easy-Clip-galaxy-note-3.jpg', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyNote3/camera-galaxy-note-3.jpg', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyNote3/s-new-note-galaxy-note-3.jpg', 3);
		
		
		
		#===================================================================================================
		#==== Samsung Galaxy Trend Plus ==================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Samsung Galaxy Trend Plus',
				NULL,
				3990000,
				24,
				'resources/images/Smartphone/SamSung/GalaxyTrendPlus/samsung-galaxy-trend-plus-s7580-300-nowatermark-120x120.jpg',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Samsung Galaxy Trend Plus';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			118, 			# trongLuong
			121.5,			# chieuCao
			63.1, 			# chieuRong
			10.57,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			' 16 triệu màu',				# soMauManHinh
			'480 x 800 pixels',					# doPhanGiaiManHinh
			'WVGA',				# chuanManHinh
			4.0,					# kichThuocManHinh float
			'Cảm ứng điện dung đa điểm',				# camUng
			NULL,				# matDoDiemAnh
			'5.0 MP',					# cameraSau
			'VGA (0.3 Mpx)',				# cameraTruoc
			'Tự động lấy nét',	    # tinhNangCamera
			'Quay phim HD 720p@30fps',					# quayPhim
			true,				# videoCall boolean
			1.2,				# tocDoCPU float
			2,				    # soNhanCPU int
			'Broadcom BCM21664',				# chipset
			'768 MB',				# RAM
			'Adreno 200',				# GPU
			'4 GB',				# boNhoTrong
			'MicroSD (T-Flash)',				# theNhoNgoai
			32,				    # dungLuongTheToiDa int
			1500,				# dungLuongPin float
			'Pin chuẩn Li-Ion',				# congNghePin
			TRUE,				# pinCoTheThaoRoi boolean
			NULL,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			NULL,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			1,				# soLuongSim int
			NULL,				# mang2G
			'HSDPA, 21 Mbps; HSUPA, 5.76 Mbps',				# mang3G
			'Không',				# mang4G
			'Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot',		# wifi
			'Có, V3.0 với A2DP',				# bluetooth
			'Có',				# GPRS
			'A-GPS',				# GPS
			NULL,				# boCamBien
			'Có',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyTrendPlus/Samsung-Galaxy-Trend-Plus-5.jpg', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyTrendPlus/Samsung-Galaxy-Trend-Plus-14.jpg', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyTrendPlus/Samsung-Galaxy-Trend-Plus-S7580-Trang-9.jpg', 3);
		
		
		#===================================================================================================
		#==== Samsung Galaxy Grand 2 ==================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Samsung Galaxy Grand 2',
				NULL,
				84990000,
				24,
				'resources/images/Smartphone/SamSung/GalaxyGrand2/samsung-galaxy-grand-2-g7102-300-nowatermark-120x120.jpg',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Samsung Galaxy Grand 2';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			163, 			# trongLuong
			146.8,			# chieuCao
			75.3, 			# chieuRong
			8.9,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			' 16 triệu màu',				# soMauManHinh
			'720x1280 pixels',					# doPhanGiaiManHinh
			'HD',				# chuanManHinh
			5.25,					# kichThuocManHinh float
			'Cảm ứng điện dung đa điểm',				# camUng
			NULL,				# matDoDiemAnh
			'8.0 MP',					# cameraSau
			'1.9 MP',				# cameraTruoc
			'Tự động lấy nét, chạm lấy nét. Nhận diện khuôn mặt, nụ cườiChống rung',	    # tinhNangCamera
			'Quay phim FullHD 1080p@30fps',					# quayPhim
			true,				# videoCall boolean
			1.2,				# tocDoCPU float
			4,				    # soNhanCPU int
			'Qualcomm',				# chipset
			'1.5 GB',				# RAM
			'Adreno 330',				# GPU
			'8 GB',				# boNhoTrong
			'MicroSD (T-Flash)',				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2600,				# dungLuongPin float
			'Pin chuẩn Li-Ion',				# congNghePin
			TRUE,				# pinCoTheThaoRoi boolean
			NULL,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			NULL,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			2,				# soLuongSim int
			NULL,				# mang2G
			'HSDPA, 21 Mbps; HSUPA, 5.76 Mbps',				# mang3G
			'Không',				# mang4G
			'Wi-Fi 802.11 a/b/g/n, dual-band, DLNA, Wi-Fi hotspot',		# wifi
			'V4.0 với A2DP, EDR',				# bluetooth
			'Có',				# GPRS
			'A-GPS và GLONASS',				# GPS
			NULL,				# boCamBien
			'Có',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyGrand2/ban-hang-galaxy-grand-355x220-2.jpg', 1);
		
		
		#===================================================================================================
		#==== Samsung Galaxy S4 i9500 ==================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('Samsung Galaxy S4 i9500',
				NULL,
				13990000,
				24,
				'resources/images/Smartphone/SamSung/GalaxyS4/Samsung-Galaxy-S4-I9500-m.jpg',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'Samsung Galaxy S4 i9500';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			235, 			# trongLuong
			136.6,			# chieuCao
			69.8, 			# chieuRong
			7.9,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			' 16 triệu màu',				# soMauManHinh
			'1080 x 1920 pixels',					# doPhanGiaiManHinh
			'Full HD',				# chuanManHinh
			5.0,					# kichThuocManHinh float
			'Cảm ứng điện dung đa điểm',				# camUng
			NULL,				# matDoDiemAnh
			'13.0 MP',					# cameraSau
			'2.1 MP',				# cameraTruoc
			'Chạm lấy nét. Nhận diện khuôn mặt, nụ cười. Chống rung',	    # tinhNangCamera
			'Quay phim FullHD 1080p@30fps',					# quayPhim
			true,				# videoCall boolean
			1.2,				# tocDoCPU float
			8,				    # soNhanCPU int
			'Exynos 5410',				# chipset
			'2 GB',				# RAM
			'PowerVR SGX544MP3',				# GPU
			'16 GB',				# boNhoTrong
			'MicroSD (T-Flash)',				# theNhoNgoai
			64,				    # dungLuongTheToiDa int
			2600,				# dungLuongPin float
			'Pin chuẩn Li-Ion',				# congNghePin
			TRUE,				# pinCoTheThaoRoi boolean
			NULL,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			NULL,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			2,				# soLuongSim int
			NULL,				# mang2G
			'HSDPA, 42 Mbps; HSUPA, 5.76 Mbps',				# mang3G
			'Có',				# mang4G
			'Wi-Fi 802.11 a/b/g/n, DLNA, Wi-Fi Direct, dual-band, Wi-Fi hotspot',		# wifi
			'V4.0 với A2DP, EDR',				# bluetooth
			'Có',				# GPRS
			'A-GPS và GLONASS',				# GPS
			NULL,				# boCamBien
			'Có',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyS4/SmartScreen-galaxy-S4.jpg', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/SamSung/GalaxyS4/camera-galaxy-s4.jpg', 2);
	END //
DELIMITER ;
CALL chenDuLieuDienThoaiSamsung();
DROP PROCEDURE IF EXISTS chenDuLieuDienThoaiSamsung;


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
				10999000,
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
				9999000,
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
				8999000,
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
				10999000,
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


DELIMITER //
CREATE PROCEDURE chenDuLieuDienThoaiLG()
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
		WHERE NSX.tenNhaSX LIKE 'LG';
		
		SELECT DISTINCT(HDH.maHDH)
		INTO maHDH
		FROM HeDieuHanh AS HDH
		WHERE HDH.tenHDH LIKE 'Android';
		
		SET ngayNhap = NOW();
		
		#===================================================================================================
		#==== LG Optimus L9 =============================================================================
		#===================================================================================================
		
		INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
		VALUES ('LG Optimus L9',
				NULL,
				6050000,
				24,
				'resources/images/Smartphone/LG/OptimusL9/LG-Optimus-L9-P760-m.jpg',
				50,
				50,
				ngayNhap, maLoaiSP, maNhaSX);
		
		SELECT DISTINCT (S.maSP)
		INTO maSP
		FROM SanPham as S
		WHERE S.tenSP like 'LG Optimus L9';
		
		INSERT INTO CtSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX, loaiManHinh, soMauManHinh, doPhanGiaiManHinh, chuanManHinh, kichThuocManHinh, camUng, matDoDiemAnh, cameraSau, cameraTruoc, tinhNangCamera, quayPhim, videoCall, tocDoCPU, soNhanCPU, chipset, RAM, GPU, boNhoTrong, theNhoNgoai, dungLuongTheToiDa, dungLuongPin, congNghePin, pinCoTheThaoRoi, thoiGianChoToiDa, thoiGianChoQuayPhim, thoiGianChoGoiDien, maHDH, loaiBanPhim, soLuongSim, mang2G, mang3G, mang4G, wifi, bluetooth, GPRS, GPS, boCamBien, denFlash, denPin)
		VALUES (
			maSP,
			125, 			# trongLuong
			131.9,			# chieuCao
			62.8, 			# chieuRong
			8.8,			# doDay
			NULL,				# ngaySX date
			NULL,				# loaiManHinh
			' 16 triệu màu',				# soMauManHinh
			'540 x 960 pixels',					# doPhanGiaiManHinh
			'qHD',				# chuanManHinh
			4.7,					# kichThuocManHinh float
			'Cảm ứng điện dung đa điểm',				# camUng
			NULL,				# matDoDiemAnh
			'8.0 MP',					# cameraSau
			'VGA (0.3 Mpx)',				# cameraTruoc
			'Tự động lấy nét.',	    # tinhNangCamera
			'Quay phim FullHD 1080p@30fps',					# quayPhim
			false,				# videoCall boolean
			1,				# tocDoCPU float
			2,				    # soNhanCPU int
			'TI OMAP 4430',				# chipset
			'1 GB',				# RAM
			'PowerVR SGX540',				# GPU
			'4 GB',				# boNhoTrong
			'MicroSD (T-Flash)',				# theNhoNgoai
			32,				    # dungLuongTheToiDa int
			'Pin chuẩn Li-Ion',				# dungLuongPin float
			NULL,				# congNghePin
			TRUE,				# pinCoTheThaoRoi boolean
			NULL,				    # thoiGianChoToiDa float
			NULL,				# thoiGianChoQuayPhim float
			NULL,				    # thoiGianChoGoiDien float
			maHDH,				# maHDH
			NULL,				# loaiBanPhim
			NULL,				# soLuongSim int
			NULL,				# mang2G
			'HSDPA, 21 Mbps; HSUPA, 5.76 Mbps',				# mang3G
			'Không',				# mang4G
			'Wi-Fi 802.11 b/g/n, Wi-Fi Direct, DLNA, Wi-Fi hotspot',		# wifi
			'V2.1 với A2DP',				# bluetooth
			'Class 12 (4+1/3+2/2+3/1+4 slots), 32 - 48 kbps',				# GPRS
			'A-GPS',				# GPS
			NULL,				# boCamBien
			'Có',				# denFlash
			'Không'				# denPin
			);
		
		SELECT DISTINCT (C.maCTSP)
		INTO maCTSP
		FROM SanPham as S, CtSanPham as C
		WHERE S.maSP = maSP and C.maSP = S.maSP;
		
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/LG/OptimusL9/LG-Optimus-L9-P760-l.jpg', 1);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-2.jpg', 2);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-3.jpg', 3);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-4.jpg', 4);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-5.jpg', 5);
		INSERT INTO HinhAnhSP (maCTSP, duongDan, STT) values (maCTSP, 'resources/images/Smartphone/LG/OptimusL9/dien-thoai-di-dong-lg-optimus-l9-6.jpg', 6);
	END //
DELIMITER ;
CALL chenDuLieuDienThoaiLG();
DROP PROCEDURE IF EXISTS chenDuLieuDienThoaiLG;
