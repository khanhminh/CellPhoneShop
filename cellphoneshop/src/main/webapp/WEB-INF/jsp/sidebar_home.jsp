<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="sidebox-wrapper">

	<div id="brand" class="sidebox-wrapper">
		<div class="sidebox-title">
			<span>NHÀ SẢN XUẤT</span>
		</div>
		<div class="sidebox-body">
			<c:forEach var="nsx" items="${listNSX}" varStatus="status">
				<c:choose>
					<c:when test="${status.index % 2 == 0}">
						<c:out value="<div class='icon-brand'>" escapeXml="false"/>						
						<a href="product?brand=${nsx.maNhaSx}"> 
							<img title="${nsx.tenNhaSx}" src="${nsx.logo}">
						</a>
					</c:when>
					<c:otherwise>
						<a href="product?brand=${nsx.maNhaSx}"> 
							<img title="${nsx.tenNhaSx}" src="${nsx.logo}">
						</a>
						<c:out value="</div>" escapeXml="false"/>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<!-- <div class="icon-brand">
				<a href="product?brand=2"> <img title="HTC"
					src="resources/images/fb_HTC.gif">
				</a>
			</div> -->
		</div>
	</div>

	<div id="support-online" class="sidebox-wrapper">
		<div class="sidebox-title">
			<span>HỖ TRỢ KHÁCH HÀNG</span>
		</div>
		<div class="sidebox-body">
			<div class="yh-support">
				<div class="tiltle-yh">Phòng kinh doanh:</div>
				<a href="ymsgr:sendIM?minhkhanh200830"> <img alt="icon yahoo"
					class="yh-icon" border="0"
					src="http://opi.yahoo.com/online?u=minhkhanh200830&amp;m=g&amp;t=2">
				</a>
			</div>
			<div class="yh-support">
				<div class="tiltle-yh">Phòng kĩ thuật:</div>
				<a href="ymsgr:sendIM?minhkhanh200830"> <img alt="icon yahoo"
					class="yh-icon" border="0"
					src="http://opi.yahoo.com/online?u=minhkhanh200830&amp;m=g&amp;t=2">
				</a>
			</div>
		</div>
	</div>

	<div id="info-promotion" class="sidebox-wrapper">
		<div class="sidebox-title">
			<span>THÔNG TIN KHUYẾN MÃI</span>
		</div>
		<div class="sidebox-body">
			<div id="list-promotion">
				<c:forEach var="km" items="${requestScope.listKM}">
					<div class="promotion">
						<img src="${km.hinhAnh}"> 
						<a>${km.tieuDe}</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</div>