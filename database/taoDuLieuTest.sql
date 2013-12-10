use CellPhoneShop;

# Tạo một số dữ liệu trước

delimiter //
create procedure taoDuLieuNhaSanXuat()
	begin
		insert into NhaSanXuat (tenNhaSX) values ('Samsung');
		insert into NhaSanXuat (tenNhaSX) values ('Nokia');
		insert into NhaSanXuat (tenNhaSX) values ('HTC');
		insert into NhaSanXuat (tenNhaSX) values ('Apple');
	end //
delimiter ;
call taoDuLieuNhaSanXuat();
drop procedure if exists taoDuLieuNhaSanXuat;


delimiter //
create procedure taoDuLieuLoaiSanPham()
	begin
		insert into LoaiSanPham (tenLoaiSP) values (N'Điện thoại di động');
		insert into LoaiSanPham (tenLoaiSP) values (N'Điện thoại thông minh');
		insert into LoaiSanPham (tenLoaiSP) values (N'Tai nghe');
		insert into LoaiSanPham (tenLoaiSP) values (N'Pin');
		insert into LoaiSanPham (tenLoaiSP) values (N'Thẻ nhớ');
		insert into LoaiSanPham (tenLoaiSP) values (N'Sạc điện thoại');
	end //
delimiter ;
call taoDuLieuLoaiSanPham();
drop procedure if exists taoDuLieuLoaiSanPham;


delimiter //
create procedure taoDuLieuHeDieuHanh()
	begin
		insert into HeDieuHanh (tenHDH) values ('Android');
		insert into HeDieuHanh (tenHDH) values ('iOS');
		insert into HeDieuHanh (tenHDH) values ('Windows Phone');
		insert into HeDieuHanh (tenHDH) values ('Tizen');
		insert into HeDieuHanh (tenHDH) values ('Symbian');
	end //
delimiter ;
call taoDuLieuHeDieuHanh();
drop procedure if exists taoDuLieuHeDieuHanh;


delimiter //
create procedure taoDuLieuLoaiBanPhim()
	begin
		insert into LoaiBanPhim (tenLoaiBanPhim) values (N'Thông thường');
		insert into LoaiBanPhim (tenLoaiBanPhim) values ('Qwerty');
		insert into LoaiBanPhim (tenLoaiBanPhim) values (N'Cảm ứng');
	end //
delimiter ;
call taoDuLieuLoaiBanPhim();
drop procedure if exists taoDuLieuLoaiBanPhim;


delimiter //
create procedure taoDuLieuLoaiNguoiDung()
	begin
		insert into LoaiNguoiDung (tenLoaiND) values (N'Khách hàng phổ thông');
	end //
delimiter ;
call taoDuLieuLoaiNguoiDung();
drop procedure if exists taoDuLieuLoaiNguoiDung;

delimiter //
create procedure taoDuLieuVaiTro()
	begin
		insert into VaiTro (tenVaiTro) values ('Admin');
		insert into VaiTro (tenVaiTro) values (N'Người dùng');
	end //
delimiter ;
call taoDuLieuVaiTro();
drop procedure if exists taoDuLieuVaiTro;


delimiter //
create procedure taoDuLieuTrangThaiDonHang()
	begin
		insert into TrangThaiDonHang (tenTrangThai) values('Chưa giao');
		insert into TrangThaiDonHang (tenTrangThai) values('Đã giao');
	end //
delimiter ;
call taoDuLieuTrangThaiDonHang();
drop procedure if exists taoDuLieuTrangThaiDonHang;


delimiter //
create procedure taoDuLieuPTGiaoHang()
	begin
		insert into PTGiaoHang (tenPTGiaoHang) values (N'Chuyển đến tận nơi');
		insert into PTGiaoHang (tenPTGiaoHang) values (N'Chuyển qua bưu điện');
		insert into PTGiaoHang (tenPTGiaoHang) values (N'Khách hàng đến lấy sản phẩm');
	end //
delimiter ;
call taoDuLieuPTGiaoHang();
drop procedure if exists taoDuLieuPTGiaoHang;


delimiter //
create procedure TaoDuLieuDTDD()
	begin
		declare SO_SAN_PHAM int;
		declare idx int;
		declare tienToTen varchar (50) character set utf8;
		
		# Khai báo cho SanPham
		declare tenSPMoi varchar(100) character set utf8;
		declare gioiThieu varchar(800) character set utf8;
		declare gia int;
		declare soThangBaoHanh smallint;
		declare hinhDaiDien varchar(256);
		declare soLuongHienCo int;
		declare tongSoLuong int;
		declare ngayNhap date;
		declare maLoaiSP smallint;
		declare maNhaSX smallint;
		
		# Khai báo cho CTSanPham
		declare maSP bigint;
		declare trongLuong float;
		declare chieuCao float;
		declare chieuRong float;
		declare doDay float;
		declare ngaySX date;
		
		# Khai báo cho ThongSoDTDD



		# Đặt dữ liệu cho SanPham
		set SO_SAN_PHAM = 50;
		set tienToTen = N'N Mobile v';
		set gioiThieu = N'Điện thoại mới với nhiều tính năng hấp dẫn';
		set gia = 2000000;
		set soThangBaoHanh = 12;
		set hinhDaiDien = null;         ### Dat duong dan hinh dai dien vao day
		set soLuongHienCo = 100;
		set tongSoLuong = 100;
		set ngayNhap = '2013/12/10';
		
		select LSP.maLoaiSP
		into maLoaiSP
		from LoaiSanPham as LSP
		where LSP.tenLoaiSP like 'Điện thoại di động';

		select NSX.maNhaSX
		into maNhaSX
		from NhaSanXuat as NSX
		where NSX.tenNhaSX like 'Samsung';
		
		
		# Đặt dữ liệu cho CTSanPham
		set trongLuong = 0.1;
		set chieuCao = 120;
		set chieuRong = 60;
		set doDay = 20;
		set ngaySX = '2013/12/9';
		
		# Đặt dữ liệu cho ThongSoDTDD
		
		
		# Thêm dữ liệu vào CSDL
		set idx = 0;
		while (idx < SO_SAN_PHAM) do
			set tenSPMoi = concat(tienToTen, idx);
			
			insert into SanPham (tenSP, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX)
			values (tenSPMoi, gioiThieu, gia, soThangBaoHanh, hinhDaiDien, soLuongHienCo, tongSoLuong, ngayNhap, maLoaiSP, maNhaSX);
			
			
			select SP.maSP
			into maSP
			from SanPham as SP
			where SP.tenSP like tenSPMoi;
			
			insert into CTSanPham (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX)
			values (maSP, trongLuong, chieuCao, chieuRong, doDay, ngaySX);
			
			set idx = idx + 1;
		end while;
		
	end //
delimiter ;
call taoDuLieuDTDD();
drop procedure if exists taoDuLieuDTDD;


delimiter //
create procedure taoDuLieuNguoiDung()
	begin
		declare maLoaiND smallint;
		
		select LND.maLoaiND
		into maLoaiND
		from LoaiNguoiDung as LND
		where LND.tenLoaiND like N'Khách hàng phổ thông';
		
		insert into NguoiDung(ho, ten, tenDangNhap, email, matKhau, maLoaiND, ngaySinh, hinhDaiDien, soDienThoai, diaChi, gioiTinh, nhanTinQuaEmail)
		values (N'Nguyễn Văn', N'A', 'nva', 'nva@example.com', '12345', maLoaiND, '1990/10/10', null, '0909190234', 'Quận 5 TP HCM', 1, false);
	end //
delimiter ;
call taoDuLieuNguoiDung();
drop procedure if exists taoDuLieuNguoiDung;
