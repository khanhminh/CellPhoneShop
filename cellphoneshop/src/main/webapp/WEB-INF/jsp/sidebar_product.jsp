<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<div id="sidebar_1" class="sidebar one_quarter first">
	<div class="sidebox-wrapper">

		<div id="categories" class="sidebox-wrapper">
			<div class="sidebox-title">
				<span>PHÂN LOẠI</span>
			</div>
			<div class="sidebox-body">
				<form action="product" method="get" id="frm-filter">
					<s:hidden name="page" theme="simple" id="page-frm-filter" />
					<s:hidden name="productPerPage" id="productPerPage-frm-filter" theme="simple"/>
					<s:hidden name="sortby" id="sortby-frm-filter" theme="simple"/>
					<div class="group-narrow">
						<h4>Giá</h4>
						<ul>
							<c:forEach var="price" items="${listPrice}">
								<li><input type="checkbox" class="chk-select" name="price"
									value="${price.string}"
									<c:forEach var="p" items="${prices}">												
												<c:if test="${p == price.string}">
													checked="checked"
												</c:if>
											</c:forEach> />
									<label> <fmt:formatNumber value="${price.minPrice}"
											type="number" /> <span> - </span> <fmt:formatNumber
											value="${price.maxPrice}" type="number" /> VNĐ
								</label></li>
							</c:forEach>
						</ul>
					</div>
					<div class="group-narrow">
						<h4>Hệ điều hành</h4>
						<ul>
							<c:forEach var="os" items="${listOS}">
								<li><input type="checkbox" name="os" value="${os.maHdh}" class="chk-select"
									<c:forEach var="o" items="${oss}">
											<c:if test="${o == os.maHdh}">
												checked="checked"
											</c:if>
										</c:forEach> />
									<label>${os.tenHdh}</label></li>
							</c:forEach>
						</ul>
					</div>
					<div class="group-narrow">
						<h4>Nhà sản xuất</h4>
						<ul>
							<c:forEach var="brand" items="${listBrand}">
								<li><input type="checkbox" name="brand" class="chk-select"
									value="${brand.maNhaSx}"
									<c:forEach var="b" items="${brands}">
											<c:if test="${b == brand.maNhaSx}">
												checked="checked"
											</c:if>
										</c:forEach> />

									<label>${brand.tenNhaSx}</label></li>
							</c:forEach>
						</ul>
					</div>
					<div class="group-narrow">
						<h4>Đánh giá</h4>
						<ul>
							<c:forEach var="star" items="${listStar}">
								<li><input type="checkbox" name="star" value="${star}" class="chk-select"
									<c:forEach var="s" items="${stars}">
											<c:if test="${s == star}">
												checked="checked"
											</c:if>
										</c:forEach> />

									<img src="resources/images/${star}star.png">
								</li>
							</c:forEach>
						</ul>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
