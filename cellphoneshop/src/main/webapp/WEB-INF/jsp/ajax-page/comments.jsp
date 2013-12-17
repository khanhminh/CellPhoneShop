<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<c:forEach var="cm" items="${list}">
	<div class="comment">
		<img class="avatar" src="resources/images/avatar.png"> <span
			class="name">${cm.nguoiDung.ten}</span> <span class="time">${cm.ngayBinhLuan}</span>
		<blockquote>${cm.loiBinh}</blockquote>
	</div>
</c:forEach>