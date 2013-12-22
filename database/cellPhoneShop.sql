#
# Phien ban 0.2.3
# Sinh viên thực hiện:
# 	. 1012190
#	. 1012355
#	. 1012356
#
# Các từ viết tắt:
#	CT - Chi tiết
#   DS - Danh sách
#	KM - Khuyến mãi
#	ND - Người dùng
#	Pt - Phương thức
#	SP - Sản phẩm
#	SX - Sản xuất
#	TB - Trung bình
#	HDH - Hệ điều hành
#

CREATE DATABASE CellPhoneShop;
USE CellPhoneShop;

GRANT ALL PRIVILEGES ON CellPhoneShop.* TO 'admin'@'localhost' IDENTIFIED BY '12345';

CREATE TABLE NhaSanXuat (
	maNhaSX INT AUTO_INCREMENT PRIMARY KEY,
	tenNhaSX VARCHAR(30) CHARACTER SET utf8 NOT NULL,
	logo VARCHAR(256)
);

CREATE TABLE LoaiSanPham (
	maLoaiSP INT AUTO_INCREMENT PRIMARY KEY,
	tenLoaiSP VARCHAR(30) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE SanPham (
	maSP INT AUTO_INCREMENT PRIMARY KEY,
	tenSP VARCHAR(100) CHARACTER SET utf8 NOT NULL,
	gioiThieu VARCHAR(800) CHARACTER SET utf8,
	gia INT DEFAULT 0,
	soThangBaoHanh INT, # don vi: thang
	hinhDaiDien VARCHAR(256),
	soLuongHienCo INT DEFAULT 0,
	tongSoLuong INT DEFAULT 0,
	ngayNhap DATE,
	maLoaiSP INT NOT NULL,
	maNhaSX INT,
	diemDanhGiaTB FLOAT DEFAULT 0,
	
	CONSTRAINT fk_SanPham_NhaSanXuat FOREIGN KEY (maNhaSX) REFERENCES NhaSanXuat(maNhaSX),
	CONSTRAINT fk_SanPham_LoaiSanPham FOREIGN KEY (maLoaiSP) REFERENCES LoaiSanPham(maLoaiSP)
);

CREATE TABLE HeDieuHanh (
	maHDH INT AUTO_INCREMENT PRIMARY KEY,
	tenHDH VARCHAR(30) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE CtSanPham (
	maCTSP INT AUTO_INCREMENT PRIMARY KEY,
	maSP INT NOT NULL,
	trongLuong FLOAT,
	chieuCao FLOAT, # mm
	chieuRong FLOAT, # mm
	doDay FLOAT, # mm
	ngaySX DATE,
	
	# Man hinh
	loaiManhinh VARCHAR(200) CHARACTER SET utf8,
	soMauManHinh VARCHAR(200) CHARACTER SET utf8,
	doPhanGiaiManHinh VARCHAR(200) CHARACTER SET utf8, # 320x480 pixels
	chuanManHinh VARCHAR(200) CHARACTER SET utf8,
	kichThuocManHinh FLOAT, # inch
	camUng VARCHAR(200) CHARACTER SET utf8,
	matDoDiemAnh VARCHAR(200) CHARACTER SET utf8,
	
	# Camera
	cameraSau VARCHAR(200) CHARACTER SET utf8,
	cameraTruoc VARCHAR(200) CHARACTER SET utf8,
	tinhNangCamera VARCHAR(200) CHARACTER SET utf8,
	quayPhim VARCHAR(200) CHARACTER SET utf8,
	videoCall BOOL,
	
	# Xu ly
	tocDoCPU FLOAT,   # GHz
	soNhanCPU INT,
	chipset VARCHAR(200) CHARACTER SET utf8,
	RAM VARCHAR(200) CHARACTER SET utf8,
	GPU VARCHAR(200) CHARACTER SET utf8,
	
	# Bo nho
	boNhoTrong VARCHAR(200) CHARACTER SET utf8,
	theNhoNgoai VARCHAR(200) CHARACTER SET utf8,
	dungLuongTheToiDa INT, # GB
	
	# Pin
	dungLuongPin FLOAT, # mAh
	congNghePin VARCHAR(200) CHARACTER SET utf8,
	pinCoTheThaoRoi BOOL,
	thoiGianChoToiDa FLOAT, # Gio
	thoiGianChoQuayPhim FLOAT, # Gio
	thoiGianChoGoiDien FLOAT,
	
	# HDH
	maHDH INT,

	# Ban Phim
	loaiBanPhim VARCHAR(200) CHARACTER SET utf8,
	
	
	# SIM
	soLuongSim INT DEFAULT 1,
	
	# CTKetNoi
	mang2G VARCHAR(200) CHARACTER SET utf8,
	mang3G VARCHAR(200) CHARACTER SET utf8,
	mang4G VARCHAR(200) CHARACTER SET utf8,
	wifi VARCHAR(200) CHARACTER SET utf8,
	bluetooth VARCHAR(200) CHARACTER SET utf8,
	GPRS VARCHAR(200) CHARACTER SET utf8,
	
	# Dinh vi
	GPS VARCHAR(200) CHARACTER SET utf8,
	boCamBien VARCHAR(200) CHARACTER SET utf8,
	
	# Den flash
	denFlash VARCHAR(200) CHARACTER SET utf8,
	denPin VARCHAR(200) CHARACTER SET utf8,

	CONSTRAINT fk_CTSanPham_SanPham FOREIGN KEY (maSP) REFERENCES SanPham(maSP),
	CONSTRAINT fk_CTSanPham_HeDieuHanh FOREIGN KEY (maHDH) REFERENCES HeDieuHanh(maHDH)
);

CREATE TABLE HinhAnhSP (
	maHinhAnh INT AUTO_INCREMENT PRIMARY KEY,
	maCTSP INT NOT NULL,
	duongDan VARCHAR(256) NOT NULL,
	STT INT NOT NULL,
	CONSTRAINT fk_HinhAnhSP_CTSanPham FOREIGN KEY (maCTSP) REFERENCES CtSanPham(maCTSP)
);

CREATE TABLE LoaiNguoiDung (
	maLoaiND INT AUTO_INCREMENT PRIMARY KEY,
	tenLoaiND VARCHAR(30) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE VaiTro (
	maVaiTro INT AUTO_INCREMENT PRIMARY KEY,
	tenVaiTro VARCHAR(30) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE NguoiDung (
	maND INT AUTO_INCREMENT PRIMARY KEY,
	ho VARCHAR(30) CHARACTER SET utf8 NOT NULL,
	ten VARCHAR(20) CHARACTER SET utf8 NOT NULL,
	email VARCHAR(256) CHARACTER SET utf8 NOT NULL,
	matKhau VARCHAR(32) CHARACTER SET utf8 NOT NULL,
	maLoaiND INT,
	gioiTinh INT, # 1 la nam
	ngaySinh DATE NOT NULL,
	hinhDaiDien VARCHAR(256),
	soDienThoai VARCHAR(15),
	diaChi VARCHAR(100) CHARACTER SET utf8,
	nhanTinQuaEmail BOOL DEFAULT FALSE,
	ENABLE BOOLEAN DEFAULT TRUE,
	
	CONSTRAINT fk_NguoiDung_LoaiNguoiDung FOREIGN KEY (maLoaiND) REFERENCES LoaiNguoiDung(maLoaiND)
);

CREATE TABLE LienHe (
	maLienHe INT PRIMARY KEY,
	email VARCHAR(256) CHARACTER SET utf8 NOT NULL,
	hoTen VARCHAR(50) CHARACTER SET utf8 NOT NULL,
	noiDung VARCHAR (800) CHARACTER SET utf8 NOT NULL
);


CREATE TABLE PhanQuyen (
	maND INT NOT NULL,
	maVaiTro INT NOT NULL,
	
	PRIMARY KEY (maND, maVaiTro),
	CONSTRAINT fk_PhanQuyen_NguoiDung FOREIGN KEY (maND) REFERENCES NguoiDung(maND),
	CONSTRAINT fk_PhanQuyen_VaiTro FOREIGN KEY (maVaiTro) REFERENCES VaiTro(maVaiTro)
);


CREATE TABLE DanhGia (
	maSP INT NOT NULL,
	maND INT NOT NULL,
	diem FLOAT NOT NULL,
	
	PRIMARY KEY (maSP, maND),
	CONSTRAINT fk_DanhGia_SanPham FOREIGN KEY (maSP) REFERENCES SanPham(maSP),
	CONSTRAINT fk_DanhGia_NguoiDung FOREIGN KEY (maND) REFERENCES NguoiDung(maND)
);

CREATE TABLE BinhLuan (
	maBinhLuan INT AUTO_INCREMENT PRIMARY KEY,
	maSP INT NOT NULL,
	maND INT NOT NULL,
	loiBinh VARCHAR (800) CHARACTER SET utf8 NOT NULL,
	ngayBinhLuan DATE NOT NULL,
	
	CONSTRAINT fk_BinhLuan_SanPham FOREIGN KEY (maSP) REFERENCES SanPham(maSP),
	CONSTRAINT fk_BinhLuan_NguoiDung FOREIGN KEY (maND) REFERENCES NguoiDung(maND)
);

CREATE TABLE PtGiaoHang (
	maPTGiaoHang INT AUTO_INCREMENT PRIMARY KEY,
	tenPTGiaoHang VARCHAR(50) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE PtThanhToan (
	maPTThanhToan INT AUTO_INCREMENT PRIMARY KEY,
	tenPTThanhToan VARCHAR(50) CHARACTER SET utf8 NOT NULL,
	ghiChu VARCHAR(800)
);

CREATE TABLE TrangThaiDonHang (
	maTrangThai INT AUTO_INCREMENT PRIMARY KEY,
	tenTrangThai VARCHAR(30) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE NguoiNhan (
	maNguoiNhan INT PRIMARY KEY,
	maND INT NOT NULL,
	hoTen VARCHAR(50) CHARACTER SET utf8,
	soDienThoai VARCHAR(15),
	diaChi VARCHAR(100) CHARACTER SET utf8 NOT NULL,
	
	CONSTRAINT fk_NguoiNhan_NguoiDung FOREIGN KEY (maND) REFERENCES NguoiDung(maND)
);

CREATE TABLE DonHang (
	maDonHang INT AUTO_INCREMENT PRIMARY KEY,
	maND INT NOT NULL,
	maNguoiNhan INT NOT NULL,
	ngayDatHang DATE NOT NULL,
	tongGiaTri INT NOT NULL,
	giamGia INT DEFAULT 0,        #Giảm giá trên tổng giá trị của đơn hàng (vd: yêu cầu những đơn hàng trên x đồng được giảm 5%)
	maPtGiaoHang INT NOT NULL,
	maTrangThai INT NOT NULL,    # Trang thai don hang
	maPtThanhToan INT NOT NULL,
	
	CONSTRAINT fk_DonHang_NguoiDung FOREIGN KEY (maND) REFERENCES NguoiDung(maND),
	CONSTRAINT fk_DonHang_NguoiNhan FOREIGN KEY (maNguoiNhan) REFERENCES NguoiNhan(maNguoiNhan),
	CONSTRAINT fk_DonHang_PTGiaoHang FOREIGN KEY (maPtGiaoHang) REFERENCES PtGiaoHang(maPtGiaoHang),
	CONSTRAINT fk_DonHang_PtThanhToan FOREIGN KEY (maPtThanhToan) REFERENCES PtThanhToan(maPtThanhToan),
	CONSTRAINT fk_DonHang_TrangThaiDonHang FOREIGN KEY (maTrangThai) REFERENCES TrangThaiDonHang(maTrangThai)
);

CREATE TABLE CtDonHang (
	maCTDonHang INT AUTO_INCREMENT PRIMARY KEY,
	maDonHang INT NOT NULL,
	maSP INT NOT NULL,
	giaTungSP INT NOT NULL,
	giamGiaTungSP INT NOT NULL DEFAULT 0,       # Giảm giá trên từng sản phẩm (ví dụ: giảm giá khi khuyến mãi).
	soLuong INT NOT NULL DEFAULT 1,
	tongGiaTri INT NOT NULL,
	
	CONSTRAINT fk_CtDonHang_DonHang FOREIGN KEY (maDonHang) REFERENCES DonHang(maDonHang),
	CONSTRAINT fk_CtDonHang_SanPham FOREIGN KEY (maSP) REFERENCES SanPham(maSP)
);

CREATE TABLE PhieuGiaoHang (
	maPhieuGiaoHang INT AUTO_INCREMENT PRIMARY KEY,
	maDonHang INT NOT NULL,
	ngayGiao DATE NOT NULL,
	
	CONSTRAINT fk_PhieuGiaoHang_DonHang FOREIGN KEY (maDonHang) REFERENCES DonHang(maDonHang)
);

CREATE TABLE TrangThaiKhuyenMai (
	maTrangThai INT AUTO_INCREMENT PRIMARY KEY,
	tenTrangThai VARCHAR(30) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE KhuyenMai (
	maKM INT AUTO_INCREMENT PRIMARY KEY,
	tieuDe VARCHAR(100) CHARACTER SET utf8,
	moTa VARCHAR(400) CHARACTER SET utf8,
	phanTramGiamGia FLOAT,
	ngayBatDau DATE,
	ngayKetThuc DATE,
	quaTang VARCHAR(200) CHARACTER SET utf8,
	maTrangThaiKM INT NOT NULL,
	hinhAnh VARCHAR(256),
	
	CONSTRAINT fk_KhuyenMai_TrangThaiKhuyenMai FOREIGN KEY (maTrangThaiKM) REFERENCES TrangThaiKhuyenMai(maTrangThai)
);

CREATE TABLE CtKhuyenMai (
	maKM INT NOT NULL,
	maSP INT NOT NULL,
	
	PRIMARY KEY (maSP, maKM),
	CONSTRAINT fk_CTKhuyenMai_KhuyenMai FOREIGN KEY (maKM) REFERENCES KhuyenMai(maKM),
	CONSTRAINT fk_CTKhuyenMai_SanPham FOREIGN KEY (maSP) REFERENCES SanPham(maSP)
);

CREATE TABLE DanhSachMongMuon (
	maDSMongMuon INT AUTO_INCREMENT PRIMARY KEY,
	maND INT NOT NULL,
	ngayTao DATE,

	CONSTRAINT fk_DanhSachMongMuon_NguoiDung FOREIGN KEY (maND) REFERENCES NguoiDung(maND)
);

CREATE TABLE CtDSMongMuon (
	maDSMongMuon INT NOT NULL,
	maSP INT NOT NULL,
	
	PRIMARY KEY (maDSMongMuon, maSP),
	CONSTRAINT fk_CTDSMongMuon_DSMonMuon FOREIGN KEY (maDSMongMuon) REFERENCES DanhSachMongMuon(maDSMongMuon),
	CONSTRAINT fk_CTDSMongMuon_SanPham FOREIGN KEY (maSP) REFERENCES SanPham(maSP)
);




#=======================================================================
# Chen du lieu

DELIMITER //
CREATE PROCEDURE taoDuLieuNhaSanXuat()
	BEGIN
		INSERT INTO NhaSanXuat (tenNhaSX,logo) VALUES ('Apple','resources/images/logo/fb_apple.gif');
		INSERT INTO NhaSanXuat (tenNhaSX,logo) VALUES ('HTC','resources/images/logo/fb_htc.gif');
		INSERT INTO NhaSanXuat (tenNhaSX,logo) VALUES ('LG','resources/images/logo/fb_lg.gif');
		INSERT INTO NhaSanXuat (tenNhaSX,logo) VALUES ('Nokia','resources/images/logo/fb_nokia.jpg');
		INSERT INTO NhaSanXuat (tenNhaSX,logo) VALUES ('Samsung','resources/images/logo/fb_samsung.gif');
		INSERT INTO NhaSanXuat (tenNhaSX,logo) VALUES ('Sony','resources/images/logo/fb_sony.gif');
	END //
DELIMITER ;
CALL taoDuLieuNhaSanXuat();
DROP PROCEDURE IF EXISTS taoDuLieuNhaSanXuat;


DELIMITER //
CREATE PROCEDURE taoDuLieuLoaiSanPham()
	BEGIN
		INSERT INTO LoaiSanPham (tenLoaiSP) VALUES (N'Điện thoại di động');
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
		INSERT INTO TrangThaiDonHang (tenTrangThai) VALUES('Đang giao');
	END //
DELIMITER ;
CALL taoDuLieuTrangThaiDonHang();
DROP PROCEDURE IF EXISTS taoDuLieuTrangThaiDonHang;


DELIMITER //
CREATE PROCEDURE taoDuLieuPTGiaoHang()
	BEGIN
		INSERT INTO PtGiaoHang (tenPTGiaoHang) VALUES (N'Chuyển đến tận nơi');
		INSERT INTO PtGiaoHang (tenPTGiaoHang) VALUES (N'Chuyển qua bưu điện');
		INSERT INTO PtGiaoHang (tenPTGiaoHang) VALUES (N'Khách hàng đến lấy sản phẩm');
	END //
DELIMITER ;
CALL taoDuLieuPTGiaoHang();
DROP PROCEDURE IF EXISTS taoDuLieuPTGiaoHang;

DELIMITER //
CREATE PROCEDURE taoDuLieuPTThanhToan()
	BEGIN
		INSERT INTO PtThanhToan (tenPTThanhToan) VALUES (N'Chuyển khoản ngân hàng');
		INSERT INTO PtThanhToan (tenPTThanhToan) VALUES (N'Trả tiển khi nhận hàng');
		INSERT INTO PtThanhToan (tenPTThanhToan) VALUES (N'Trả tiền tại siêu thị');
	END //
DELIMITER ;
CALL taoDuLieuPTThanhToan();
DROP PROCEDURE IF EXISTS taoDuLieuPTThanhToan;

DELIMITER //
CREATE PROCEDURE taoDuLieuTrangThaiKhuyenMai()
	BEGIN
		INSERT INTO TrangThaiKhuyenMai (tenTrangThai) VALUES('Đang mở');
		INSERT INTO TrangThaiKhuyenMai (tenTrangThai) VALUES('Đã đóng');
	END //
DELIMITER ;
CALL taoDuLieuTrangThaiKhuyenMai();
DROP PROCEDURE IF EXISTS taoDuLieuTrangThaiKhuyenMai;

DELIMITER //
CREATE PROCEDURE taoDuLieuKhuyenMai()
	BEGIN
		INSERT INTO KhuyenMai (tieuDe,hinhAnh,maTrangThaiKM) VALUES('Năm mới giảm giá smartphone', 'resources/images/km/km1.png', 1);
		INSERT INTO KhuyenMai (tieuDe,hinhAnh,maTrangThaiKM) VALUES('Khuyến mãi cuối năm cho IPhone', 'resources/images/km/km2.png', 1);
		INSERT INTO KhuyenMai (tieuDe,hinhAnh,maTrangThaiKM) VALUES('Mua sắm cuối tuần nhận khuyến mãi khủng', 'resources/images/km/km3.png', 2);
	END //
DELIMITER ;
CALL taoDuLieuKhuyenMai();
DROP PROCEDURE IF EXISTS taoDuLieuKhuyenMai;
