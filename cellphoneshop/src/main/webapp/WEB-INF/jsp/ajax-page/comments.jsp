<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<div>
	<c:forEach var="cm" items="${list}">
		<div class="comment">
			<img class="avatar" src="resources/images/avatar.png"> <span
				class="name">${cm.nguoiDung.ten}</span> 
				<span class="time">					
					<fmt:formatDate pattern="dd/MM/yyyy" value="${cm.ngayBinhLuan}" />
				</span>
			<blockquote>${cm.loiBinh}</blockquote>
		</div>
	</c:forEach>
</div>
<c:if test="${requestScope.totalPage > 1}">
	<nav class="pagination">
		<ul id="pages">
			<c:forEach var="page" begin="1" end="${requestScope.totalPage}">
				<li><a href="#"
					<c:if test="${page == requestScope.currentPage}">
                                    class="active-page ajax-link"
                            </c:if>
					<c:if test="${page != requestScope.currentPage}">
                                    class="ajax-link"
                            </c:if>>${page}
				</a></li>
			</c:forEach>
		</ul>
	</nav>
</c:if>