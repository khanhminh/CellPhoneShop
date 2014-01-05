<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div>
	<ul class="breadcrumb">
		<li><a href="#">Quản lý Khuyến Mãi</a> <span class="divider">/</span>
		</li>
		<li><a href="#">Tìm kiếm</a></li>
	</ul>
</div>

<div class="row-fluid sortable">
	<div class="box span6">
		<div class="box-header well">
			<h2>
				<i class="icon-edit"></i>Tìm kiếm
			</h2>
			<div class="box-icon">
				<a href="#" class="btn btn-minimize btn-round"><i
					class="icon-chevron-up"></i></a>
			</div>
		</div>
		<div class="box-content">
			<form class="form-horizontal" action="search_ctkm.action"
				method="get">
				<fieldset>
					<div class="control-group">
						<label class="control-label" id="label-search" for="query-search">Từ
							khóa</label>
						<div class="controls">
							<s:textfield cssClass="input-xlarge focused" id="query-search"
								type="text" name="query" theme="simple" data-val="true"
								data-val-required="Vui lòng nhập nhập từ khóa" />
							<span class="field-validation-valid" data-valmsg-for="query"
										data-valmsg-replace="true">
							</span>
						</div>
					</div>
					<div class="control-group">
						<label class="control-label">Tìm theo:</label>
						<div class="controls">
							<label class="radio"> <input type="radio" name="option"
								value="status" checked="checked" /> Trạng Thái KM
							</label>
							<div style="clear: both"></div>
							<label class="radio"> <input type="radio" name="option"
								value="id" /> Mã Khuyến Mãi
							</label>
							<div style="clear: both"></div>
							<label class="radio"> <input type="radio" name="option"
								value="name" /> Tên Khuyến Mãi
							</label>
							<div style="clear: both"></div>
							<label class="radio"> <input type="radio" name="option"
								value="idsp" /> Mã Sản Phẩm
							</label>
						</div>
					</div>
					<div class="form-actions">
						<button type="submit" class="btn btn-primary" id="btn-search">Tìm</button>
					</div>
				</fieldset>
			</form>
		</div>
	</div>
</div>

<c:choose>
	<c:when test="${isInput}">
	</c:when>
	<c:when test="${ctkmList == null || empty ctkmList}">
		<div class="alert alert-error">
			<strong> <c:forEach var="error" begin="0" items="${errors}">
						${error}<br>
				</c:forEach>
			</strong>
		</div>

	</c:when>
	<c:otherwise>
		<jsp:include page="list_ctkm.jsp" />
	</c:otherwise>
</c:choose>
