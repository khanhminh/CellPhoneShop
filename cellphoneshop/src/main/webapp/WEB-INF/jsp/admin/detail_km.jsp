<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý Khuyến Mãi</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Danh sách Khuyến Mãi</a> <span class="divider">/</span></li>
		<li><a href="#">Chi Tiết Khuyến Mãi</a></li>
	</ul>
</div>

<c:choose>
	<c:when test="${km != null}">
		<div class="row-fluid sortable ui-sortable">
			<div class="box span6">
				<div class="box-header well" data-original-title="">
					<h2>
						<i class="icon-edit"></i>Khuyến Mãi
					</h2>
					<div class="box-icon">
						<a href="#" class="btn btn-minimize btn-round"><i
							class="icon-chevron-up"></i></a>
					</div>
				</div>
				<div class="box-content">
					<form class="form-horizontal">
						<fieldset>
							<h3>Thông tin khuyến mãi</h3>
							<div class="control-group">
								<label class="control-label">Tên Khuyến Mãi</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${km.tieuDe} </span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Mô tả</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input"> ${km.moTa }
									</span>
								</div>
							</div>
							<h3>Chi tiết khuyến mãi</h3>
							<div class="control-group">
								<label class="control-label">Giảm giá(%)</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
									<c:choose>
										<c:when test="${km.phanTramGiamGia != null}">
											<fmt:formatNumber type="number" 
	                   							value="${km.phanTramGiamGia}"                                         
	                   							maxFractionDigits="2"                            
	                   							minFractionDigits="1"/>
												%
										</c:when>
										<c:otherwise>
											Không Giảm Giá
										</c:otherwise>
									</c:choose>
									
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Quà Tặng</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
									<c:choose>
										<c:when test="${km.quaTang != null}">
											${km.quaTang}                                       
										</c:when>
										<c:otherwise>
											Không Tặng Quà
										</c:otherwise>
									</c:choose>
									
									</span>
								</div>
							</div>
							<div class="control-group">
								<label class="control-label">Trạng Thái KM</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input">
										${km.trangThaiKhuyenMai.tenTrangThai}
									</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Ngày Bắt Đầu</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input"> 
									<fmt:formatDate pattern="dd/MM/yyyy" value="${km.ngayBatDau}" />
									</span>
								</div>
							</div>

							<div class="control-group">
								<label class="control-label">Ngày Kết Thúc</label>
								<div class="controls">
									<span class="input-xlarge uneditable-input"> 
										<fmt:formatDate pattern="dd/MM/yyyy" value="${km.ngayKetThuc}" />
									</span>
								</div>
							</div>
							<div class="center">
								<a class="btn btn-info" href="list_km.action"> <i
									class="icon-share-alt icon-white"></i> Trở lại danh sách
								</a>
							</div>
						</fieldset>
					</form>

				</div>
			</div>
		</div>
	</c:when>
	<c:otherwise>
		<div class="alert alert-error">
			<strong>Không tìm thông tin khuyến mãi!</strong>
		</div>
	</c:otherwise>
</c:choose>
