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
				<i class="icon-user"></i>Thông tin sản phẩm
			</h2>
			<div class="box-icon"></div>
		</div>
		<div class="box-content">

			<form class="form-horizontal" action="insert_product" method="post">
				<div class="validation-summary-errors">
					<ul>
						<!-- danh sách lỗi nếu có errors là List<String>-->
						<c:forEach var="e" items="${requestScope.errors}">
							<li>${e}</li>
						</c:forEach>
					</ul>
				</div>
				<fieldset>
					<div class="control-group">					
						<label class="control-label" for="sanPham.tenSp">
							Tên sản phẩm
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
						<label class="control-label" for="maNhaSanXuat">Nhà sản xuất</label>
						<div class="controls">
							<select name="maNhaSanXuat">							
								<c:forEach items="${danhSachNhaSanXuat}" var="nsx">
									<option value="${nsx.maNhaSx}">${nsx.tenNhaSx}</option>
								</c:forEach>
							</select>
						</div>
					</div>
					
					<div class="control-group">					
						<label class="control-label" for="sanPham.gia">
							Giá
						</label>
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
						<label class="control-label" for="sanPham.soThangBaoHanh">
							Số tháng bảo hành
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
							Số lượng hiện có
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
							Tổng số lượng
						</label>
						<div class="controls">
							<s:textfield class="text-box single-line input-xlarge focused" 
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
						<label class="control-label" for="fileInput">Hình đại diện</label>
						<div class="controls">
							<input class="input-file uniform_on" id="fileInput" type="file">
						</div>
					</div>


					<div class="form-actions">
						<button type="submit" class="btn btn-primary">Thêm sản phẩm</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>