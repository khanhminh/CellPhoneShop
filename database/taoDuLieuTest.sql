USE CellPhoneShop;

# Tạo một số dữ liệu trước

DELIMITER //
CREATE PROCEDURE taoDuLieuNhaSanXuat()
	BEGIN
		INSERT INTO NhaSanXuat (tenNhaSX) VALUES ('Samsung');
		INSERT INTO NhaSanXuat (tenNhaSX) VALUES ('Nokia');
		INSERT INTO NhaSanXuat (tenNhaSX) VALUES ('HTC');
		INSERT INTO NhaSanXuat (tenNhaSX) VALUES ('Apple');
	END //
DELIMITER ;
CALL taoDuLieuNhaSanXuat();
DROP PROCEDURE IF EXISTS taoDuLieuNhaSanXuat;


DELIMITER //
CREATE PROCEDURE taoDuLieuLoaiSanPham()
	BEGIN
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Điện thoại di động');
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Điện thoại thông minh');
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Tai nghe');
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Pin');
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Thẻ nhớ');
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Sạc điện thoại');
	END //
DELIMITER ;
CALL taoDuLieuLoaiSanPham();
DROP PROCEDURE IF EXISTS taoDuLieuLoaiSanPham;


DELIMITER //
CREATE PROCEDURE taoDuLieuHeDieuHanh()
	BEGIN
		INSERT INTO HeDieuHanh (tenHDH) VALUES ('Android');
		INSERT INTO HeDieuHanh (tenHDH) VALUES ('iOS');
		INSERT INTO HeDieuHanh (tenHDH) VALUES ('Windows Phone');
		INSERT INTO HeDieuHanh (tenHDH) VALUES ('Tizen');
		INSERT INTO HeDieuHanh (tenHDH) VALUES ('Symbian');
	END //
DELIMITER ;
CALL taoDuLieuHeDieuHanh();
DROP PROCEDURE IF EXISTS taoDuLieuHeDieuHanh;


DELIMITER //
CREATE PROCEDURE taoDuLieuLoaiBanPhim()
	BEGIN
		INSERT INTO LoaiBanPhim (tenLoaiBanPhim) VALUES (N'Thông thường');
		INSERT INTO LoaiBanPhim (tenLoaiBanPhim) VALUES ('Qwerty');
		INSERT INTO LoaiBanPhim (tenLoaiBanPhim) VALUES (N'Cảm ứng');
	END //
DELIMITER ;
CALL taoDuLieuLoaiBanPhim();
DROP PROCEDURE IF EXISTS taoDuLieuLoaiBanPhim;


DELIMITER //
CREATE PROCEDURE taoDuLieuLoaiNguoiDung()
	BEGIN
		INSERT INTO LoaiNguoiDung (tenLoaiND) VALUES (N'Khách hàng phổ thông');
	END //
DELIMITER ;
CALL taoDuLieuLoaiNguoiDung();
DROP PROCEDURE IF EXISTS taoDuLieuLoaiNguoiDung;

DELIMITER //
CREATE PROCEDURE taoDuLieuVaiTro()
	BEGIN
		INSERT INTO VaiTro (tenVaiTro) VALUES ('Admin');
		INSERT INTO VaiTro (tenVaiTro) VALUES (N'User');
	END //
DELIMITER ;
CALL taoDuLieuVaiTro();
DROP PROCEDURE IF EXISTS taoDuLieuVaiTro;


DELIMITER //
CREATE PROCEDURE taoDuLieuTrangThaiDonHang()
	BEGIN
		INSERT INTO TrangThaiDonHang (tenTrangThai) VALUES('Chưa giao');
		INSERT INTO TrangThaiDonHang (tenTrangThai) VALUES('Đã giao');
	END //
DELIMITER ;
CALL taoDuLieuTrangThaiDonHang();
DROP PROCEDURE IF EXISTS taoDuLieuTrangThaiDonHang;


DELIMITER //
CREATE PROCEDURE taoDuLieuPTGiaoHang()
	BEGIN
		INSERT INTO PTGiaoHang (tenPTGiaoHang) VALUES (N'Chuyển đến tận nơi');
		INSERT INTO PTGiaoHang (tenPTGiaoHang) VALUES (N'Chuyển qua bưu điện');
		INSERT INTO PTGiaoHang (tenPTGiaoHang) VALUES (N'Khách hàng đến lấy sản phẩm');
	END //
DELIMITER ;
CALL taoDuLieuPTGiaoHang();
DROP PROCEDURE IF EXISTS taoDuLieuPTGiaoHang;


DELIMITER //
CREATE PROCEDURE TaoDuLieuSmartPhone()
	BEGIN
		DECLARE SO_SAN_PHAM INT;
		DECLARE idx INT;
		DECLARE tienToTen VARCHAR (50) CHARACTER SET utf8;
		
		# Khai báo cho SanPham
		DECLARE tenSPMoi VARCHAR(100) CHARACTER SET utf8;
		DECLARE gioiThieu VARCHAR(800) CHARACTER SET utf8;
		DECLARE gia INT;
		DECLARE soThangBaoHanh SMALLINT;
		DECLARE hinhDaiDien VARCHAR(256);
		DECLARE soLuongHienCo INT;
		DECLARE tongSoLuong INT;
		DECLARE ngayNhap DATE;
		DECLARE maLoaiSP SMALLINT;
		DECLARE maNhaSX SMALLINT;
		
		# Khai báo cho ThongSoDTDD
		
		
		# Khai báo cho CTSanPham
		DECLARE maSP BIGINT;
		DECLARE trongLuong FLOAT;
		DECLARE chieuCao FLOAT;
		DECLARE chieuRong FLOAT;
		DECLARE doDay FLOAT;
		DECLARE ngaySX DATE;



		# Đặt dữ liệu cho SanPham
		SET SO_SAN_PHAM = 50;
		SET tienToTen = N'N Mobile v';
		SET gioiThieu = N'Điện thoại mới với nhiều tính năng hấp dẫn';
		SET gia = 2000000;
		SET soThangBaoHanh = 12;
		SET hinhDaiDien = 'resources/images/Smartphone/test/np1.png';         ### Dat duong dan hinh dai dien vao day
		SET soLuongHienCo = 100;
		SET tongSoLuong = 100;
		SET ngayNhap = NOW();
		
		SELECT LSP.maLoaiSP
		INTO maLoaiSP
		FROM LoaiSanPham AS LSP
		WHERE LSP.tenLoaiSP LIKE 'Điện thoại di động';

		SELECT NSX.maNhaSX
		INTO maNhaSX
		FROM NhaSanXuat AS NSX
		WHERE NSX.tenNhaSX LIKE 'Samsung';
		
		
		# Đặt dữ liệu cho CTSanPham
		SET trongLuong = 0.1;
		SET chieuCao = 120;
		SET chieuRong = 60;
		SET doDay = 20;
		SET ngaySX = '2013/12/9';
		
		# Đặt dữ liệu cho ThongSoDTDD
		
		
		# Thêm dữ liệu vào CSDL
		SET idx = 0;
		WHILE (idx < SO_SAN_PHAM) DO
			# Chèn sản phẩm
			SET tenSPMoi = CONCAT(tienToTen, idx);
			
			INSERT INTO SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
			VALUES (tenSPMoi, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX);
			
			# Chèn chi tiết sản phẩm
			SELECT SP.maSP
			INTO maSP
			FROM SanPham AS SP
			WHERE SP.tenSP LIKE tenSPMoi;
			
			INSERT INTO CTSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX)
			VALUES (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX);
			
			# Chèn thông số sản phẩm
			
			
			SET idx = idx + 1;
		END WHILE;
		
	END //
DELIMITER ;
CALL taoDuLieuSmartPhone();
DROP PROCEDURE IF EXISTS taoDuLieuSmartPhone;


DELIMITER //
CREATE PROCEDURE taoDuLieuNguoiDung()
	BEGIN
		DECLARE maLoaiND SMALLINT;
		
		SELECT LND.maLoaiND
		INTO maLoaiND
		FROM LoaiNguoiDung AS LND
		WHERE LND.tenLoaiND LIKE N'Khách hàng phổ thông';
		
		INSERT INTO NguoiDung(ho, ten, tenDangNhap, email, matKhau, maLoaiND, ngaySinh, hinhDaiDien, soDienThoai, diaChi, gioiTinh, nhanTinQuaEmail)
		VALUES (N'Nguyễn Văn', N'A', 'nva', 'nva@example.com', '12345', maLoaiND, '1990/10/10', NULL, '0909190234', 'Quận 5 TP HCM', 1, FALSE);
	END //
DELIMITER ;
CALL taoDuLieuNguoiDung();
DROP PROCEDURE IF EXISTS taoDuLieuNguoiDung;
