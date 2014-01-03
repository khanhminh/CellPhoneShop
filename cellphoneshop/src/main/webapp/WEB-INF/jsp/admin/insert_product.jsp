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
			<c:set var="insertProductResult" value="${insertSuccess}"/>
			<c:if test="${insertProductResult == true}">
				<div>
					<img src="resources/images/success_tick.png">
						<span>Thêm sản phẩm mới thành công</span>
					<img/>
					<form action="insert_product" method="post" style='display:inline;'>
						<input type="hidden" value="true" name="themSanPhamFlag"/>
						<button type="submit" class="btn btn-primary">Thêm sản phẩm mới</button>
					</form>
					<hr/>
				</div>
			</c:if>
				
			<form class="form-horizontal" action="insert_product" method="post" enctype="multipart/form-data">
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
									type="text"
									theme="simple"
									name="sanPham.maSp"
									data-val="false"/>
								<span class="field-validation-valid"
									data-valmsg-for="sanPham.maSp"
									data-valmsg-replace="true">
								</span>
							</div>						
						</div>
					</c:if>
					<div class="control-group">					
						<label class="control-label" for="sanPham.tenSp">
							Tên sản phẩm *
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused" 
								type="text"
								theme="simple"
								name="sanPham.tenSp"
								data-val="true" data-val-required="Vui lòng nhập tên sản phẩm" /> 
							
							<span class="field-validation-valid" 
								data-valmsg-for="sanPham.tenSp"
								data-valmsg-replace="true"> 
							</span>
						</div>
					</div>

					<div class="control-group">
						<label class="control-label" for="maNhaSanXuat">Nhà sản xuất *</label>
						<c:set var="maNSXCuaSP" value="${sanPham.nhaSanXuat.maNhaSx}"/>
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
								type="text"
								theme="simple"
								name="sanPham.gia"								
								data-val="true" data-val-required="Vui lòng nhập giá sản phẩm"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$"
								 /> 
							
							<span class="field-validation-valid" 
								data-valmsg-for="sanPham.gia"
								data-valmsg-replace="true"> 
							</span>
						</div>
					</div>
					
					<div class="control-group">					
						<label class="control-label" for="sanPham.gioiThieu">
							Giới thiệu sản phẩm
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused" 
								type="text"
								theme="simple"
								name="sanPham.gioiThieu"
								data-val="false" data-val-required="" /> 
							
							<span class="field-validation-valid" 
								data-valmsg-for="sanPham.gioiThieu"
								data-valmsg-replace="true"> 
							</span>
						</div>
					</div>
					
					<div class="control-group">				
						<label class="control-label" for="sanPham.soThangBaoHanh">
							Số tháng bảo hành *
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused" 
								type="text"
								theme="simple"
								name="sanPham.soThangBaoHanh"
								data-val="true" data-val-required="Vui lòng nhập số tháng bảo hành"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" /> 
							
							<span class="field-validation-valid" 
								data-valmsg-for="sanPham.soThangBaoHanh"
								data-valmsg-replace="true"> 
							</span>
						</div>
					</div>
					
					<div class="control-group">					
						<label class="control-label" for="sanPham.soLuongHienCo">
							Số lượng hiện có *
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused" 
								type="text"
								theme="simple"
								name="sanPham.soLuongHienCo"
								data-val="true" data-val-required="Vui lòng nhập số lượng hiện có"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" /> 
							
							<span class="field-validation-valid" 
								data-valmsg-for="sanPham.soLuongHienCo"
								data-valmsg-replace="true"> 
							</span>
						</div>
					</div>
					
					<div class="control-group">					
						<label class="control-label" for="sanPham.tongSoLuong">
							Tổng số lượng *
						</label>
						<div class="controls">
							<s:textfield cssClass="text-box single-line input-xlarge focused" 
								type="text"
								theme="simple"
								name="sanPham.tongSoLuong"
								data-val="true" data-val-required="Vui lòng tổng số lượng"
								data-val-regex="Giá trị không hợp lệ"
								data-val-regex-pattern="^\d{1,10}$" /> 
							
							<span class="field-validation-valid" 
								data-valmsg-for="sanPham.tongSoLuong"
								data-valmsg-replace="true"> 
							</span>
						</div>
					</div>
					
					<div class="control-group">
						<label class="control-label" for="imagesFile">Hình đại diện</label>
						<div class="controls">
							<input class="input-file uniform_on" name="imagesFile" type="file">
						</div>
					</div>
					
					<div class="form-actions">
						<c:if test="${insertProductResult == false}">
							<button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
						</c:if>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>