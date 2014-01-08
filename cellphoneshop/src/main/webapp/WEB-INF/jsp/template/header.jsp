<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div class="wrapper row1">
	<header id="header" class="full_width clear">
		<div id="logo" class="one_half">
			<a href="#" title="CellPhoneShop"><img
				src="resources/images/mylogo.png" /></a>
		</div>
		<div id="header-contact" class="one_half">
			<section id="login">
				<security:authorize access="isAuthenticated()"> 
					<c:url var="logoutUrl" value="/j_spring_security_logout" /> 
					<ul class="list none">
						<li>Chào, <a class="username" title="Tài khoản" href="update_account.action"><security:authentication property="principal.name" /></a></li>
						<li>
							<form action="${logoutUrl}" method="post" id="logoutForm">
								<a
									href="javascript:document.getElementById('logoutForm').submit()">Thoát</a>
							</form>
						</li>
					</ul>
				</security:authorize>
				<security:authorize access="isAnonymous()">
					<ul class="list none">
						<li><a href="login.action" id="loginLink">Đăng nhập</a></li>
						<li><a href="register.action" id="registerLink">Đăng ký</a></li>
					</ul>
				</security:authorize>
			</section>
		</div>
	</header>
</div>

<!-- Menu -->
<div class="wrapper row2">
	<nav id="topnav">
		<ul class="clear">
			<li><a href="home.action" class="active">Trang chủ</a></li>
			<li class="drop">
				<a href="product.action">Sản phẩm</a>
				<ul>
                  <c:forEach var="nsx" items="${requestScope.listNSX}">
                  	<li><a href="product.action?brand=${nsx.maNhaSx}">${nsx.tenNhaSx}</a></li>
                  </c:forEach>
              	</ul>				
			</li>
			<security:authorize access="isAuthenticated()"> 
				<li><a href="list_order.action">Quản lý đơn hàng</a></li>
			</security:authorize>
			<security:authorize access="hasAnyRole('Admin')"> 
				<li>
					<s:a namespace="/admin" action="list_account">Admin</s:a>
				</li>
			</security:authorize>
			<li><a href="contact.action">Liên hệ</a></li>
			<li><a href="about.action">Giới thiệu</a></li>
		</ul>
	</nav>
</div>

<!-- Slider -->
<div class="wrapper row2">
	<div id="intro">
		<div class="boxholder">
			<div id="amazingslider-1">
				<ul class="amazingslider-slides" style="display: none;">
					<li><img src="resources/images/slider/1.png" alt="1" /></li>
					<li><img src="resources/images/slider/2.png" alt="2" /></li>
					<li><img src="resources/images/slider/3.png" alt="3" /></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!-- Search bar & Shopping Cart -->
<div class="wrapper row3">
	<div id="search">
		<div class="one_half">
			<form action="product.action" method="get">
				<input type="text" name="query" class="one_half" id="text-search-product"/> 
				<input type="submit" value="Tìm kiếm" class="one_ten" id="btnSearch"/>
			</form>
		</div>
		<c:if test="${sessionScope.cart != null}">
			<c:forEach var="item" items="${sessionScope.cart}">
				<c:set scope="page" var="count" value="${count + item.count}"/>
			</c:forEach>
		</c:if>
		<div id="cart">
			<img src="resources/images/cart.png" />
			<a id="cart-status" href="cart.action">
			Giỏ hàng
			<c:if test="${count > 0}">
				(<c:out value="${count}"></c:out>)
			 </c:if>
			</a>
		</div>
	</div>
</div>
<script>
	$(document).ready(function(){
		$('#btnSearch').click(function(e){
			var text = $('#text-search-product').val().trim();
			if (text == ""){
				e.preventDefault();
			}
		});
	});
</script>