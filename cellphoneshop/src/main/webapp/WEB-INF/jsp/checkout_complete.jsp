<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div class="wrapper row3">
	<div id="container">
		<h2 class="title-content push50">HOÀN TẤT</h2>
		<div id="order-info">
			<p>
				Bạn đã đặt hàng thành công. Mã đơn đặt hàng của bạn: <span>${requestScope.orderId}</span>
			</p>
			<a href="home.action">Trang chủ</a>
		</div>
		<div class="clear"></div>
	</div>
</div>