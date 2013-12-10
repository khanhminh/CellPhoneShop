#
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
#	PT - Phương thức
#	SP - Sản phẩm
#	SX - Sản xuất
#	TB - Trung bình
#	HDH - Hệ điều hành
#

create database CellPhoneShop;
use CellPhoneShop;

grant all privileges on CellPhoneShop.* to 'admin'@'localhost' identified by '12345';

create table NhaSanXuat (
	maNhaSX smallint auto_increment primary key,
	tenNhaSX varchar(30) character set utf8 not null,
	logo varchar(256)
);

create table LoaiSanPham (
	maLoaiSP smallint auto_increment primary key,
	tenLoaiSP varchar(30) character set utf8 not null
);

create table SanPham (
	maSP bigint auto_increment primary key,
	tenSP varchar(100) character set utf8 not null,
	gioiThieu varchar(800) character set utf8,
	gia int default 0,
	soThangBaoHanh smallint, # don vi: thang
	hinhDaiDien varchar(256),
	soLuongHienCo int default 0,
	tongSoLuong int default 0,
	ngayNhap date,
	maLoaiSP smallint not null,
	maNhaSX smallint,
	diemDanhGiaTB float default 0,
	
	constraint fk_SanPham_NhaSanXuat foreign key (maNhaSX) references NhaSanXuat(maNhaSX),
	constraint fk_SanPham_LoaiSanPham foreign key (maLoaiSP) references LoaiSanPham(maLoaiSP)
);

create table CTSanPham (
	maCTSP bigint auto_increment primary key,
	maSP bigint not null,
	trongLuong float,
	chieuCao float, # mm
	chieuRong float, # mm
	doDay float, # mm
	ngaySX date,
	
	# danh sach thuoc tinh
	maThongSoDTDD bigint,
	maThongSoSmartPhone bigint,
	maThongSoTaiNghe bigint,
	maThongSoPin bigint,
	maThongSoAdapter bigint,
	maThongSoTheNho bigint,

	constraint fk_CTSanPham_SanPham foreign key (maSP) references SanPham(maSP)
);

create table HinhAnhSP (
	maHinhAnh bigint auto_increment primary key,
	maCTSP bigint not null,
	duongDan varchar(256) not null,
	
	constraint fk_HinhAnhSP_CTSanPham foreign key (maCTSP) references CTSanPham(maCTSP)
);

create table LoaiBanPhim (
	maLoaiBanPhim smallint auto_increment primary key,
	tenLoaiBanPhim varchar(12)
);

create table ThongSoDTDD (
	maThongSoDTDD bigint auto_increment primary key,
	
	# Man hinh
	loaiManhinh varchar(20) character set utf8,
	soMauManHinh varchar(30) character set utf8,
	doPhanGiaiManHinh varchar(20), # 320x480 pixels
	chuanManHinh varchar(20) character set utf8,
	kichThuocManHinh float, # inch
	camUng varchar(30) character set utf8,
	matDoDiemAnh varchar(30) character set utf8,
	
	# Camera
	cameraSau varchar(100) character set utf8,
	cameraTruoc varchar(100) character set utf8,
	tinhNangCamera varchar(50) character set utf8,
	quayPhim varchar(100) character set utf8,
	
	# Bo nho
	boNhoTrong varchar(30) character set utf8,
	theNhoNgoai varchar(30) character set utf8,
	dungLuongTheToiDa smallint, # GB
	
	# Pin
	dungLuongPin float, # mAh
	congNghePin varchar(20) character set utf8,
	pinCoTheThaoRoi bool,
	thoiGianChoToiDa float, # Gio
	thoiGianChoQuayPhim float, # Gio
	thoiGianChoGoiDien float,

	# Ban Phim
	maLoaiBanPhim smallint,
	
	# Mang
	mang2G varchar(20) character set utf8,
	mang3G varchar(20) character set utf8,
	mang4G varchar(20) character set utf8,
	wifi varchar(30) character set utf8,
	bluetooth varchar(30) character set utf8,
	GPRS varchar(30) character set utf8,
	
	# SIM
	soLuongSim smallint default 1,
	
	# Dinh vi
	GPS varchar(30) character set utf8,
	boCamBien varchar(50) character set utf8,
	
	# Den pin
	denPin varchar(30) character set utf8,
	
	constraint fk_ThongSoDTDD_LoaiBanPhim foreign key (maLoaiBanPhim) references LoaiBanPhim(maLoaiBanPhim)
);

create table HeDieuHanh (
	maHDH smallint auto_increment primary key,
	tenHDH varchar(30) character set utf8 not null
);

create table ThongSoSmartPhone (
	maThongSoSmartPhone bigint auto_increment primary key,
	
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
	soNhanCPU smallint,
	chipset varchar(30) character set utf8,
	RAM varchar(30) character set utf8,
	GPU varchar(30) character set utf8,
	
	# Bo nho
	boNhoTrong varchar(30) character set utf8,
	theNhoNgoai varchar(30) character set utf8,
	dungLuongTheToiDa smallint, # GB
	
	# Pin
	dungLuongPin float, # mAh
	congNghePin varchar(20) character set utf8,
	pinCoTheThaoRoi bool,
	thoiGianChoToiDa float, # Gio
	thoiGianChoQuayPhim float, # Gio
	thoiGianChoGoiDien float,
	
	# HDH
	maHDH smallint,

	# Ban Phim
	maLoaiBanPhim smallint,
	
	# Mang
	mang2G varchar(20) character set utf8,
	mang3G varchar(20) character set utf8,
	mang4G varchar(20) character set utf8,
	wifi varchar(30) character set utf8,
	bluetooth varchar(30) character set utf8,
	GPRS varchar(30) character set utf8,
	
	# SIM
	soLuongSim smallint default 1,
	
	# Dinh vi
	GPS varchar(30) character set utf8,
	boCamBien varchar(50) character set utf8,
	
	# Den flash
	denFlash varchar(30) character set utf8,
	denPin varchar(30) character set utf8,
	
	
	constraint fk_ThongSoSmartPhone_LoaiBanPhim foreign key (maLoaiBanPhim) references LoaiBanPhim(maLoaiBanPhim),
	constraint fk_ThongSoSmartPhone_HeDieuHanh foreign key (maHDH) references HeDieuHanh(maHDH)
);

create table ThongSoTaiNghe (
	maThongSoTaiNghe bigint auto_increment primary key,
	
	kichThuoc float, # speaker size: mm
	congSuat float,  # power: mW
	tanSo varchar(15) character set utf8, # frequency: Hz - KHz
	doNhay smallint, # sesitivity: dB
	troKhangDauVao smallint # Ohm impedance: Ohm
);

create table ThongSoPin (
	maThongSoPin bigint auto_increment primary key,
	
	dungLuongPin float, # mAh
	dienAp float, # V
	congNghe varchar(20) character set utf8 # NiCad, NiMH, Li-ion, Li-po
);

create table ThongSoAdapter (
	maThongSoAdapter bigint auto_increment primary key,
	
	inputAC varchar(28) character set utf8, # vd: 240 V ~ 50 - 60 Hz - 0.15 A
	outputDC varchar(28) character set utf8, # vd: 5V = 1 A
	kieuGiacCam varchar(30) character set utf8
);

create table ThongSoTheNho (
	maThongSoTheNho bigint auto_increment primary key,
	
	dungLuong smallint, # GB
	tocDoDoc float, # MB/s
	tocDoGhi float, # MB/s
	class smallint, # 1-6
	serial varchar(12) # vd: 0x04ceb573
);

alter table CTSanPham
add constraint fk_CTSanPham_ThongSoDTDD foreign key (maThongSoDTDD) references ThongSoDTDD(maThongSoDTDD);

alter table CTSanPham
add constraint fk_CTSanPham_ThongSoSmartPhone foreign key (maThongSoSmartPhone) references ThongSoSmartPhone(maThongSoSmartPhone);

alter table CTSanPham
add constraint fk_CTSanPham_ThongSoTaiNghe foreign key (maThongSoTaiNghe) references ThongSoTaiNghe(maThongSoTaiNghe);

alter table CTSanPham
add constraint fk_CTSanPham_ThongSoPin foreign key (maThongSoPin) references ThongSoPin(maThongSoPin);

alter table CTSanPham
add constraint fk_CTSanPham_ThongSoAdapter foreign key (maThongSoAdapter) references ThongSoAdapter(maThongSoAdapter);

alter table CTSanPham
add constraint fk_CTSanPham_ThongSoTheNho foreign key (maThongSoTheNho) references ThongSoTheNho(maThongSoTheNho);




create table LoaiNguoiDung (
	maLoaiND smallint auto_increment primary key,
	tenLoaiND varchar(30) character set utf8 not null
);

create table VaiTro (
	maVaiTro smallint auto_increment primary key,
	tenVaiTro varchar(30) character set utf8 not null
);

create table NguoiDung (
	maND int auto_increment primary key,
	ho varchar(30) character set utf8 not null,
	ten varchar(20) character set utf8 not null,
	tenDangNhap varchar(35) character set utf8,
	email varchar(256) character set utf8 not null,
	matKhau varchar(32) character set utf8 not null,
	maLoaiND smallint,
	gioiTinh smallint, # 0 hoac 1
	ngaySinh date not null,
	hinhDaiDien varchar(256),
	soDienThoai varchar(15),
	diaChi varchar(100) character set utf8,
	nhanTinQuaEmail bool default false,
	
	constraint fk_NguoiDung_LoaiNguoiDung foreign key (maLoaiND) references LoaiNguoiDung(maLoaiND)
);


create table PhanQuyen (
	maND int not null,
	maVaiTro smallint not null,
	
	primary key (maND, maVaiTro),
	constraint fk_PhanQuyen_NguoiDung foreign key (maND) references NguoiDung(maND),
	constraint fk_PhanQuyen_VaiTro foreign key (maVaiTro) references VaiTro(maVaiTro)
);


create table DanhGia (
	maSP bigint not null,
	maND int not null,
	diem float not null,
	
	primary key (maSP, maND),
	constraint fk_DanhGia_SanPham foreign key (maSP) references SanPham(maSP),
	constraint fk_DanhGia_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table BinhLuan (
	maBinhLuan bigint auto_increment primary key,
	maSP bigint not null,
	maND int not null,
	loiBinh varchar (800) character set utf8 not null,
	ngayBinhLuan date not null,
	
	constraint fk_BinhLuan_SanPham foreign key (maSP) references SanPham(maSP),
	constraint fk_BinhLuan_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table PTGiaoHang (
	maPTGiaoHang smallint auto_increment primary key,
	tenPTGiaoHang varchar(50) character set utf8 not null
);

create table TrangThaiDonHang (
	maTrangThai smallint auto_increment primary key,
	tenTrangThai varchar(30) character set utf8 not null
);

create table DonHang (
	maDonHang bigint auto_increment primary key,
	maND int not null,
	ngayDatHang date not null,
	tongGiaTri int not null,
	giamGia int default 0,        #Giảm giá trên tổng giá trị của đơn hàng (vd: yêu cầu những đơn hàng trên x đồng được giảm 5%)
	maPTGiaoHang smallint not null,
	maTrangThai smallint not null,    # Trang thai don hang
	diaChiGiaoHang varchar(100) character set utf8,
	
	constraint fk_DonHang_NguoiDung foreign key (maND) references NguoiDung(maND),
	constraint fk_DonHang_PTGiaoHang foreign key (maPTGiaoHang) references PTGiaoHang(maPTGiaoHang),
	constraint fk_DonHang_TrangThaiDonHang foreign key (maTrangThai) references TrangThaiDonHang(maTrangThai)
);

create table CTDonHang (
	maCTDonHang bigint auto_increment primary key,
	maDonHang bigint not null,
	maSP bigint not null,
	giaTungSP int not null,
	giamGiaTungSP int not null default 0,       # Giảm giá trên từng sản phẩm (ví dụ: giảm giá khi khuyến mãi).
	soLuong int not null default 1,
	tongGiaTri int not null,
	
	constraint fk_CTDonHang_DonHang foreign key (maDonHang) references DonHang(maDonHang),
	constraint fk_CTDonHang_SanPham foreign key (maSP) references SanPham(maSP)
);

create table PhieuGiaoHang (
	maPhieuGiaoHang bigint auto_increment primary key,
	maDonHang bigint not null,
	ngayGiao date not null,
	
	constraint fk_PhieuGiaoHang_DonHang foreign key (maDonHang) references DonHang(maDonHang)
);

create table KhuyenMai (
	maKM int auto_increment primary key,
	tieuDe varchar(100),
	moTa varchar(400),
	phanTramGiamGia float,
	ngayBatDau date,
	ngayKetThuc date
);

create table CTKhuyenMai (
	maKM int not null,
	maSP bigint not null,	
	
	primary key (maSP, maKM),
	constraint fk_CTKhuyenMai_KhuyenMai foreign key (maKM) references KhuyenMai(maKM),
	constraint fk_CTKhuyenMai_SanPham foreign key (maSP) references SanPham(maSP)
);

create table QuaTang (
	maKM int not null,
	maSPTang bigint not null, # Quà tặng đi kèm chương trình khuyến mãi
	
	primary key (maKM, maSPTang),
	constraint fk_QuaTang_KhuyenMai foreign key (maKm) references KhuyenMai(maKM),
	constraint fk_QuaTang_SanPham foreign key (maSPTang) references SanPham(maSP)  # Sản phẩm tặng được lưu trong bảng SanPham.
);

create table DanhSachMongMuon (
	maDSMongMuon int auto_increment primary key,
	maND int not null,
	ngayTao date,

	constraint fk_DanhSachMongMuon_NguoiDung foreign key (maND) references NguoiDung(maND)
);

create table CTDSMongMuon (
	maDSMongMuon int not null,
	maSP bigint not null,
	
	primary key (maDSMongMuon, maSP),
	constraint fk_CTDSMongMuon_DSMonMuon foreign key (maDSMongMuon) references DanhSachMongMuon(maDSMongMuon),
	constraint fk_CTDSMongMuon_SanPham foreign key (maSP) references SanPham(maSP)
);
