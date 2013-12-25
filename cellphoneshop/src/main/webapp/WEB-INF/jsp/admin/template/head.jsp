<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="s" uri="/struts-tags"%>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- The styles -->
<style type="text/css">
body {
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="<s:url value='/resources/css/admin/jquery-ui-1.8.21.custom.css' />"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/bootstrap-cerulean.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/bootstrap-responsive.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/charisma-app.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/fullcalendar.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/fullcalendar.print.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/chosen.css'/>" rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/uniform.default.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/colorbox.css'/>" rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/jquery.cleditor.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/jquery.noty.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/noty_theme_default.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/elfinder.theme.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/jquery.iphone.toggle.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/opa-icons.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/uploadify.css'/>"
	rel="stylesheet" />
<link href="<s:url value='/resources/css/admin/adminstyle.css'/>"
	rel="stylesheet" />

<script src="<s:url value='/resources/script/admin/jquery-1.7.2.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery-ui-1.8.21.custom.js'/>"></script>
<script src="<s:url value='/resources/script/jquery.unobtrusive-ajax.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-transition.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-alert.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-modal.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-dropdown.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-scrollspy.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-tab.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-tooltip.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-popover.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-button.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-collapse.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-carousel.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-typeahead.js'/>"></script>
<script src="<s:url value='/resources/script/admin/bootstrap-tour.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.cookie.js'/>"></script>
<script src="<s:url value='/resources/script/admin/fullcalendar.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.dataTables.js'/>"></script>
<script src="<s:url value='/resources/script/admin/excanvas.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.flot.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.flot.pie.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.flot.stack.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.flot.resize.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.chosen.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.uniform.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.colorbox.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.cleditor.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.noty.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.elfinder.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.raty.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.iphone.toggle.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.autogrow-textarea.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.uploadify-3.1.js'/>"></script>
<script src="<s:url value='/resources/script/admin/jquery.history.js'/>"></script>
<script src="<s:url value='/resources/script/admin/charisma.js'/>"></script>
<script src="<s:url value='/resources/script/jquery.validate.js'/>"></script>
<script src="<s:url value='/resources/script/jquery.validate.unobtrusive.js'/>"></script>



<!-- The HTML5 shim, for IE6-8 support of HTML5 elements -->
<!--[if lt IE 9]>
	  <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

<!-- The fav icon -->
<link rel="shortcut icon" href="<s:url value='/resources/images/favicon.ico'/>"/>