<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<c:forEach var="sp" items="${listProduct}">
	<li class="one_quarter">
		<a href="detail.action?product=${sp.maSp}">
			<div class="product">
				<img src="${sp.hinhDaiDien}" />
				<div class="info-product">
					<p class="name-product">${sp.tenSp}</p>
					<p class="cost">
						<fmt:formatNumber value="${sp.gia}" type="number" />
						VNĐ
					</p>
				</div>
			</div>
	 	</a>
	</li>
</c:forEach>