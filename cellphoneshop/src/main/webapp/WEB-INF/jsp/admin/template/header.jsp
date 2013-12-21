<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>	

<div class="navbar">
	<div class="navbar-inner">
		<div class="container-fluid">
			<a class="btn btn-navbar" data-toggle="collapse"
				data-target=".top-nav.nav-collapse,.sidebar-nav.nav-collapse"> <span
				class="icon-bar"></span> <span class="icon-bar"></span> <span
				class="icon-bar"></span>
			</a> <a class="brand" href="index.html"> <img alt="Charisma Logo"
				src="/cellphoneshop/resources/images/logo20.png" /> <span>Admin</span></a>

			<!-- user dropdown starts -->
			<div class="btn-group pull-right">
				<a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
					<i class="icon-user"></i>
					<span class="hidden-phone">
						<%-- <security:authentication property="principal.name"/> --%>
						Khanh
					</span>
					<span class="caret"></span>
				</a>
				<ul class="dropdown-menu">
					<li class="divider"></li>
					<li>
						<form action="${logoutUrl}" method="post" id="logoutForm">
								<a
									href="javascript:document.getElementById('logoutForm').submit()">Thoát</a>
						</form>
					</li>
				</ul>
			</div>
			<!-- user dropdown ends -->

			<div class="top-nav nav-collapse">
				<ul class="nav">
					<li>
						<a href="/cellphoneshop/home.action">Trang chủ</a>
					</li>
					<li>
						<form class="navbar-search pull-left">
							<input placeholder="Search" class="search-query span2"
								name="query" type="text">
						</form>
					</li>
				</ul>
			</div>
			<!--/.nav-collapse -->
		</div>
	</div>
</div>