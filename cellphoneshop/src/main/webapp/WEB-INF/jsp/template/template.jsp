<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>

<html>
<head>
<tiles:insertAttribute name="head" />
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="content" />
	<tiles:insertAttribute name="footer" />
</body>
</html>
