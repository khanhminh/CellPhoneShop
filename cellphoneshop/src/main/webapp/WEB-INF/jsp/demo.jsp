<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<ul>
	<c:forEach var="vt" items="${list}">
		<li><img src="${vt.hinhDaiDien}"/></li>
	</c:forEach>
</ul>
