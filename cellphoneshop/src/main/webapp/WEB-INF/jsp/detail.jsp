<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">THÔNG TIN SẢN PHẨM</h2>
		<div class="clear push20"></div>
		<div id="left-info" class="two_quarter">
			<div id="amazingslider-2" style="margin: auto">
				<ul class="amazingslider-slides" style="display: none;">
					<c:forEach var="img" items="${images}">
						<li><img src="${img.duongDan}" class="img-details" /></li>
					</c:forEach>
				</ul>
				<ul class="amazingslider-thumbnails" style="display: none;">
					<c:forEach var="img" items="${images}">
						<li><img src="${img.duongDan}" /></li>
					</c:forEach>
				</ul>
			</div>
		</div>
		<div id="right-info" class="two_quarter">
			<h2 id="name">${sp.tenSp}</h2>
			<div class="rating">
				<img src="resources/images/star-on.png" /> <img
					src="resources/images/star-on.png" /> <img
					src="resources/images/star-on.png" /> <img
					src="resources/images/star-on.png" /> <img
					src="resources/images/star-off.png" />
			</div>
			<h3 id="status">
				<c:choose>
					<c:when test="${sp.soLuongHienCo > 0}">
						<c:out value="Còn hàng"></c:out>
					</c:when>
					<c:otherwise>
						<c:out value="Hết hàng"></c:out>
					</c:otherwise>
				</c:choose>
			</h3>
			<h2 id="cost">
				<fmt:formatNumber value="${sp.gia}" type="number" />
				VNĐ
			</h2>
			<table>
				<tr>
					<td class="sub-info">Hãng sản xuất:</td>
					<td>${sp.nhaSanXuat.tenNhaSx}</td>
				</tr>
				<tr>
					<td class="sub-info">Bảo hành:</td>
					<td>${sp.soThangBaoHanh}Tháng</td>
				</tr>
				<tr>
					<td class="sub-info">Ngày cập nhật:</td>
					<td>${sp.ngayNhap}</td>
				</tr>
			</table>
			<div>
				<a href="editcart?action=add&product=${sp.maSp}"> <img
					src="resources/images/btn_addcart_vn.gif" />
				</a>
			</div>
		</div>
		<div class="clear"></div>
		<div id="bottom-info">
			<jsp:include page="smartphone_detail.jsp" />
		</div>
		<div class="clear push50"></div>
		<div id="relate-product">
			<h3 class="title-info">Sản phẩm liên quan</h3>
			<ul id="mycarousel" class="jcarousel-skin-tango">
				
			</ul>
		</div>
		<div id="user-rating"></div>
		<div id="comment">
			<h3 class="title-info">Bình luận</h3>
			<form method="post" id="frm-comment">
				<label>Nhận xét:</label>
				<textarea id="txtComment" name="NoiDung"></textarea>
				<button id="btSend" type="submit">Gửi</button>
			</form>

			<h3 class="title-info">Danh sách bình luận:</h3>
			<div id="list-comment"></div>
			<nav class="pagination">
				<ul id="pages">
				</ul>
			</nav>
		</div>
	</div>
</div>