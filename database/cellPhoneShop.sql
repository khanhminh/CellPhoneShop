#
# Phien ban 0.2.2
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

create table LoaiSanPham (
	maLoaiSP int auto_increment primary key,
	tenLoaiSP varchar(30) character set utf8 not null
);

create table SanPham (
	maSP int auto_increment primary key,
	tenSP varchar(100) character set utf8 not null,
	gioiThieu varchar(800) character set utf8,
	gia int default 0,
	soThangBaoHanh int, # don vi: thang
	hinhDaiDien varchar(256),
	soLuongHienCo int default 0,
	tongSoLuong int default 0,
	ngayNhap date,
	maLoaiSP int not null,
	maNhaSX int,
	diemDanhGiaTB float default 0,
	
	constraint fk_SanPham_NhaSanXuat foreign key (maNhaSX) references NhaSanXuat(maNhaSX),
	constraint fk_SanPham_LoaiSanPham foreign key (maLoaiSP) references LoaiSanPham(maLoaiSP)
);

create table HeDieuHanh (
	maHDH int auto_increment primary key,
	tenHDH varchar(30) character set utf8 not null
);

create table CtSanPham (
	maCTSP int auto_increment primary key,
	maSP int not null,
	trongLuong float,
	chieuCao float, # mm
	chieuRong float, # mm
	doDay float, # mm
	ngaySX date,
	
	# Man hinh
	loaiManhinh varchar(20) character set utf8,
	soMauManHinh varchar(30) character set utf8,
	doPhanGiaiManHinh varchar(20) character set utf8, # 320x480 pixels
	chuanManHinh varchar(20) character set utf8,
	kichThuocManHinh float, # inch
	camUng varchar(30) character set utf8,
	matDoDiemAnh varchar(30) character set utf8,
	
	# Camera
	cameraSau varchar(100) character set utf8,
	cameraTruoc varchar(100) character set utf8,
	tinhNangCamera varchar(50) character set utf8,
	quayPhim varchar(100) character set utf8,
	videoCall bool,
	
	# Xu ly
	tocDoCPU float,   # GHz
	soNhanCPU int,
	chipset varchar(30) character set utf8,
	RAM varchar(30) character set utf8,
	GPU varchar(30) character set utf8,
	
	# Bo nho
	boNhoTrong varchar(30) character set utf8,
	theNhoNgoai varchar(30) character set utf8,
	dungLuongTheToiDa int, # GB
	
	# Pin
	dungLuongPin float, # mAh
	congNghePin varchar(20) character set utf8,
	pinCoTheThaoRoi bool,
	thoiGianChoToiDa float, # Gio
	thoiGianChoQuayPhim float, # Gio
	thoiGianChoGoiDien float,
	
	# HDH
	maHDH int,

	# Ban Phim
	loaiBanPhim varchar(20) character set utf8,
	
	
	# SIM
	soLuongSim int default 1,
	
	# CTKetNoi
	mang2G varchar(20) character set utf8,
	mang3G varchar(20) character set utf8,
	mang4G varchar(20) character set utf8,
	wifi varchar(30) character set utf8,
	bluetooth varchar(30) character set utf8,
	GPRS varchar(30) character set utf8,
	
	# Dinh vi
	GPS varchar(30) character set utf8,
	boCamBien varchar(50) character set utf8,
	
	# Den flash
	denFlash varchar(30) character set utf8,
	denPin varchar(30) character set utf8,

	constraint fk_CTSanPham_SanPham foreign key (maSP) references SanPham(maSP),
	constraint fk_CTSanPham_HeDieuHanh foreign key (maHDH) references HeDieuHanh(maHDH)
);

create table HinhAnhSP (
	maHinhAnh int auto_increment primary key,
	maCTSP int not null,
	duongDan varchar(256) not null,
	STT int not null,
	constraint fk_HinhAnhSP_CTSanPham foreign key (maCTSP) references CtSanPham(maCTSP)
);

create table LoaiNguoiDung (
	maLoaiND int auto_increment primary key,
	tenLoaiND varchar(30) character set utf8 not null
);

create table VaiTro (
	maVaiTro int auto_increment primary key,
	tenVaiTro varchar(30) character set utf8 not null
);

create table NguoiDung (
	maND int auto_increment primary key,
	ho varchar(30) character set utf8 not null,
	ten varchar(20) character set utf8 not null,
	email varchar(256) character set utf8 not null,
	matKhau varchar(32) character set utf8 not null,
	maLoaiND int,
	gioiTinh int, # 1 la nam
	ngaySinh date not null,
	hinhDaiDien varchar(256),
	soDienThoai varchar(15),
	diaChi varchar(100) character set utf8,
	nhanTinQuaEmail bool default false,
	
	constraint fk_NguoiDung_LoaiNguoiDung foreign key (maLoaiND) references LoaiNguoiDung(maLoaiND)
);

create table LienHe (
	maLienHe int primary key,
	email varchar(256) character set utf8 not null,
	hoTen varchar(50) character set utf8 not null,
	noiDung varchar (800) character set utf8 not null
);


create table PhanQuyen (
	maND int not null,
	maVaiTro int not null,
	
	primary key (maND, maVaiTro),
	constraint fk_PhanQuyen_NguoiDung foreign key (maND) references NguoiDung(maND),
	constraint fk_PhanQuyen_VaiTro foreign key (maVaiTro) references VaiTro(maVaiTro)
);


create table DanhGia (
	maSP int not null,
	maND int not null,
	diem float not null,
	
	primary key (maSP, maND),
	constraint fk_DanhGia_SanPham foreign key (maSP) references SanPham(maSP),
	constraint fk_DanhGia_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table BinhLuan (
	maBinhLuan int auto_increment primary key,
	maSP int not null,
	maND int not null,
	loiBinh varchar (800) character set utf8 not null,
	ngayBinhLuan date not null,
	
	constraint fk_BinhLuan_SanPham foreign key (maSP) references SanPham(maSP),
	constraint fk_BinhLuan_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table PtGiaoHang (
	maPTGiaoHang int auto_increment primary key,
	tenPTGiaoHang varchar(50) character set utf8 not null
);

create table PtThanhToan (
	maPTThanhToan int auto_increment primary key,
	tenPTThanhToan varchar(50) character set utf8 not null,
	ghiChu varchar(800)
);

create table TrangThaiDonHang (
	maTrangThai int auto_increment primary key,
	tenTrangThai varchar(30) character set utf8 not null
);

create table NguoiNhan (
	maNguoiNhan int primary key,
	maND int not null,
	hoTen varchar(50) character set utf8,
	soDienThoai varchar(15),
	diaChi varchar(100) character set utf8 not null,
	
	constraint fk_NguoiNhan_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table DonHang (
	maDonHang int auto_increment primary key,
	maND int not null,
	maNguoiNhan int not null,
	ngayDatHang date not null,
	tongGiaTri int not null,
	giamGia int default 0,        #Giảm giá trên tổng giá trị của đơn hàng (vd: yêu cầu những đơn hàng trên x đồng được giảm 5%)
	maPtGiaoHang int not null,
	maTrangThai int not null,    # Trang thai don hang
	maPtThanhToan int not null,
	
	constraint fk_DonHang_NguoiDung foreign key (maND) references NguoiDung(maND),
	constraint fk_DonHang_NguoiNhan foreign key (maNguoiNhan) references NguoiNhan(maNguoiNhan),
	constraint fk_DonHang_PTGiaoHang foreign key (maPtGiaoHang) references PtGiaoHang(maPtGiaoHang),
	constraint fk_DonHang_PtThanhToan foreign key (maPtThanhToan) references PtThanhToan(maPtThanhToan),
	constraint fk_DonHang_TrangThaiDonHang foreign key (maTrangThai) references TrangThaiDonHang(maTrangThai)
);

create table CtDonHang (
	maCTDonHang int auto_increment primary key,
	maDonHang int not null,
	maSP int not null,
	giaTungSP int not null,
	giamGiaTungSP int not null default 0,       # Giảm giá trên từng sản phẩm (ví dụ: giảm giá khi khuyến mãi).
	soLuong int not null default 1,
	tongGiaTri int not null,
	
	constraint fk_CtDonHang_DonHang foreign key (maDonHang) references DonHang(maDonHang),
	constraint fk_CtDonHang_SanPham foreign key (maSP) references SanPham(maSP)
);

create table PhieuGiaoHang (
	maPhieuGiaoHang int auto_increment primary key,
	maDonHang int not null,
	ngayGiao date not null,
	
	constraint fk_PhieuGiaoHang_DonHang foreign key (maDonHang) references DonHang(maDonHang)
);

create table KhuyenMai (
	maKM int auto_increment primary key,
	tieuDe varchar(100) character set utf8,
	moTa varchar(400) character set utf8,
	phanTramGiamGia float,
	ngayBatDau date,
	ngayKetThuc date,
	quaTang varchar(200) character set utf8
);

create table CtKhuyenMai (
	maKM int not null,
	maSP int not null,
	
	primary key (maSP, maKM),
	constraint fk_CTKhuyenMai_KhuyenMai foreign key (maKM) references KhuyenMai(maKM),
	constraint fk_CTKhuyenMai_SanPham foreign key (maSP) references SanPham(maSP)
);

create table DanhSachMongMuon (
	maDSMongMuon int auto_increment primary key,
	maND int not null,
	ngayTao date,

	constraint fk_DanhSachMongMuon_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table CtDSMongMuon (
	maDSMongMuon int not null,
	maSP int not null,
	
	primary key (maDSMongMuon, maSP),
	constraint fk_CTDSMongMuon_DSMonMuon foreign key (maDSMongMuon) references DanhSachMongMuon(maDSMongMuon),
	constraint fk_CTDSMongMuon_SanPham foreign key (maSP) references SanPham(maSP)
);
