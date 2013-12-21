<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<!DOCTYPE html>
<html lang="en">
<head>    
    <title><tiles:insertAttribute name="title"/></title>
    <tiles:insertAttribute name="head"/>
</head>
<body>
    <tiles:insertAttribute name="header" />    
    <div class="container-fluid">
        <div class="row-fluid">
            <tiles:insertAttribute name="sidebar" />
            <div id="content" class="span9">
                <tiles:insertAttribute name="content" />
            </div>
        </div>
        <tiles:insertAttribute name="footer" />
    </div>    
</body>
</html>
