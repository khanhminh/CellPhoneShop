<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý sản phẩm</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Thêm sản phẩm</a></li>
	</ul>
</div>

<div class="row-fluid sortable">
	<div class="box span12">
		<div class="box-header well" data-original-title>
			<h2>
				<i class="icon-user"></i>Thêm sản phẩm mới
			</h2>
			<div class="box-icon"></div>
		</div>
		<div class="box-content">
			<c:set var="insertProductResult" value="${insertSuccess}" />
			<c:if test="${insertProductResult == true}">
				<div>
					<img src="resources/images/success_tick.png"> <span>Thêm
						sản phẩm mới thành công</span> <img />
					<form action="insert_product" method="post"
						style='display: inline;'>
						<input type="hidden" value="true" name="themSanPhamFlag" />
						<button type="submit" class="btn btn-primary">Thêm sản
							phẩm mới</button>
					</form>
					<hr />
				</div>
			</c:if>

			<form class="form-horizontal" action="insert_product" method="post"
				enctype="multipart/form-data">
				<div class="validation-summary-errors">
					<ul>
						<!-- danh sách lỗi nếu có errors là List<String>-->
						<c:forEach var="e" items="${requestScope.errors}">
							<li>${e}</li>
						</c:forEach>
					</ul>
				</div>

				<h4>Tổng quan sản phẩm</h4>
				<p></p>

				<fieldset>
					<c:if test="${insertProductResult == true}">
						<div class="control-group">
							<label class="control-label">Mã sản phẩm</label>
							<div class="controls">
								<s:textfield class="text-box single-line input-xlarge focused"
									type="text" theme="simple" name="sanPham.maSp" data-val="false" />
								<span class="field-validation-valid"
									data-valmsg-for="sanPham.maSp" data-valmsg-replace="true">
								</span>
							</div>
						</div>
					</c:if>
					<div class="control-group">
						<label class="control-label" for="sanPham.tenSp"> Tên sản
							phẩm * </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="sanPham.tenSp" data-val="true"
								data-val-required="Vui lòng nhập tên sản phẩm" />

							<span class="field-validation-valid"
								data-valmsg-for="sanPham.tenSp" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="maNhaSanXuat">Nhà sản
							xuất *</label>
						<c:set var="maNSXCuaSP" value="${sanPham.nhaSanXuat.maNhaSx}" />
						<div class="controls">
							<select name="maNhaSanXuat">
								<c:forEach items="${danhSachNhaSanXuat}" var="nsx">
									<c:choose>
										<c:when test="${maNSXCuaSP == nsx.maNhaSx}">
											<option selected value="${nsx.maNhaSx}">${nsx.tenNhaSx}</option>
										</c:when>
										<c:otherwise>
											<option value="${nsx.maNhaSx}">${nsx.tenNhaSx}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="sanPham.gia">Giá*</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="sanPham.gia" data-val="true"
								data-val-required="Vui lòng nhập giá sản phẩm"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="sanPham.gia" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="sanPham.gioiThieu"> Giới
							thiệu sản phẩm </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="sanPham.gioiThieu"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="sanPham.gioiThieu" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="sanPham.soThangBaoHanh">
							Số tháng bảo hành * </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="sanPham.soThangBaoHanh"
								data-val="true"
								data-val-required="Vui lòng nhập số tháng bảo hành"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="sanPham.soThangBaoHanh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="sanPham.soLuongHienCo">
							Số lượng hiện có * </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="sanPham.soLuongHienCo"
								data-val="true"
								data-val-required="Vui lòng nhập số lượng hiện có"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="sanPham.soLuongHienCo"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="sanPham.tongSoLuong">
							Tổng số lượng * </label>
						<div class="controls">
							<s:textfield cssClass="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="sanPham.tongSoLuong"
								data-val="true"
								data-val-required="Vui lòng nhập tổng số lượng"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="sanPham.tongSoLuong" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="imagesFile">Hình đại
							diện</label>
						<div class="controls">
							<input class="input-file uniform_on" name="imagesFile"
								type="file">
						</div>
					</div>


					<!------ Chi tiết sản phẩm ----->
					<h4>Chi tiết sản phẩm</h4>
					<p></p>

					<div class="control-group">
						<label class="control-label" for="productDetail.trongLuong">
							Trọng lượng </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.trongLuong"
								data-val="false"
								data-val-required="Vui lòng nhập số tháng bảo hành"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.trongLuong"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.chieuCao">
							Chiều cao </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.chieuCao"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.chieuCao"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.chieuRong">
							Chiều rộng </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.chieuRong"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.chieuRong"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.doDay"> Độ
							dày </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.doDay"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.doDay" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.loaiManhinh">
							Loại màn hình </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.loaiManhinh"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.loaiManhinh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.soMauManHinh">
							Số màu màn hình </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.soMauManHinh"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.soMauManHinh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.doPhanGiaiManHinh">
							Độ phân giải màn hình </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple"
								name="productDetail.doPhanGiaiManHinh" data-val="false"
								data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.doPhanGiaiManHinh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.chuanManHinh">
							Chuẩn màn hình </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.chuanManHinh"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.chuanManHinh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.kichThuocManHinh">
							Kích thước màn hình </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.kichThuocManHinh"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.kichThuocManHinh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.camUng">
							Cảm ứng </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.camUng"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.camUng"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.matDoDiemAnh">
							Mật độ điểm ảnh </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.matDoDiemAnh"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.matDoDiemAnh"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.cameraSau">
							Thông tin camera sau (chính) </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.cameraSau"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.cameraSau"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.cameraTruoc">
							Thông tin camera trước (phụ) </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.cameraTruoc"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.cameraTruoc"
								data-valmsg-replace="true"> </span>
						</div>
					</div>


					<div class="control-group">
						<label class="control-label" for="productDetail.tinhNangCamera">
							Tính năng camera </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.tinhNangCamera"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.tinhNangCamera"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.quayPhim">
							Quay phim </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.quayPhim"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.quayPhim"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.tocDoCpu">
							Tốc độ CPU </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.tocDoCpu"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.tocDoCpu"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.soNhanCpu">
							Số nhân CPU </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.soNhanCpu"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.soNhanCpu"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.chipset">
							Chipset </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.chipset"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.chipset"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.ram"> Ram
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.ram"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.ram" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.gpu"> GPU
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.gpu"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.gpu" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.boNhoTrong">
							Bộ nhớ trong </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.boNhoTrong"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.boNhoTrong"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.theNhoNgoai">
							Thẻ nhớ ngoài </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.theNhoNgoai"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.theNhoNgoai"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.dungLuongTheToiDa">
							Dung lượng thẻ nhớ tối đa </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple"
								name="productDetail.dungLuongTheToiDa" data-val="false"
								data-val-required="" data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.dungLuongTheToiDa"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.dungLuongPin">
							Dung lượng pin </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.dungLuongPin"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.dungLuongPin"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.congNghePin">
							Công nghệ pin </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.congNghePin"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.congNghePin"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.thoiGianChoToiDa">
							Thời gian chờ tối đa </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.thoiGianChoToiDa"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.thoiGianChoToiDa"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label"
							for="productDetail.thoiGianChoQuayPhim"> Thời gian chờ
							quay phim </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple"
								name="productDetail.thoiGianChoQuayPhim" data-val="false"
								data-val-required="" data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.thoiGianChoQuayPhim"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label"
							for="productDetail.thoiGianChoGoiDien"> Thời gian chờ gọi
							điện </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple"
								name="productDetail.thoiGianChoGoiDien" data-val="false"
								data-val-required="" data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.thoiGianChoGoiDien"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.loaiBanPhim">
							Loại bàn phím </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.loaiBanPhim"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.loaiBanPhim"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.soLuongSim">
							Số lượng sim </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.soLuongSim"
								data-val="false" data-val-required=""
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.soLuongSim"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.mang2g">
							Mạng 2G </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.mang2g"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.mang2g"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.mang3g">
							Mạng 3G </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.mang3g"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.mang3g"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.mang4g">
							Mạng 4G </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.mang4g"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.mang4g"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.wifi">
							Wifi </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.wifi"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.wifi" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.bluetooth">
							Bluetooth </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.bluetooth"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.bluetooth"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.gprs">
							GPRS </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.gprs"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.gprs" data-valmsg-replace="true">
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.boCamBien">
							Bộ cảm biến </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.boCamBien"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.boCamBien"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.denFlash">
							Đèn flash </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.denFlash"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.denFlash"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="productDetail.denPin">
							Đèn pin </label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused"
								type="text" theme="simple" name="productDetail.denPin"
								data-val="false" data-val-required="" />

							<span class="field-validation-valid"
								data-valmsg-for="productDetail.denPin"
								data-valmsg-replace="true"> </span>
						</div>
					</div>

					<c:forEach var="i" begin="1" end="10">
						<div class="control-group">
							<label class="control-label" for="file">Hình đại diện
								${i}</label>
							<div class="controls">
								<input class="input-file uniform_on" name="file" type="file">
							</div>
						</div>
					</c:forEach>

					<div class="form-actions">
						<c:if test="${insertProductResult == false}">
							<button type="submit" class="btn btn-primary">Thêm sản
								phẩm</button>
						</c:if>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>