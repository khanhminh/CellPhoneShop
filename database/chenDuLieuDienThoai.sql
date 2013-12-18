use CellPhoneShop;

# Phien ban 0.2 (18/12)
# Hinh anh tu nguon: www.nokia.com

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
		
		
		# Nokia Lumia 1520
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
		
		
		
		# Nokia Lumia 1020
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
	END //
DELIMITER ;
CALL chenDuLieuDienThoaiNokia();
DROP PROCEDURE IF EXISTS chenDuLieuDienThoaiNokia;
 
