<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<!DOCTYPE html>
<html>
<head>
    <title>MathMaps</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/dataTables.bootstrap.css"/>"/>
    <link type="text/css" rel="stylesheet" href='<c:url value="/resources/css/jquery-ui.min.css"/>'>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/pace.css"/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/bootstrap-theme.min.css"/>"/>
    <link type="text/css" rel="stylesheet" href="<c:url value="/resources/css/custom.css"/>"/>

    <script type="text/javascript" src="<c:url value="/resources/js/jquery/jquery-1.11.2.min.js"/>"></script>
</head>
<body>
<div class="container">
    <tiles:insertAttribute name="header"/>
    <div class="page-header"></div>
    <tiles:insertAttribute name="body"/>
    <tiles:insertAttribute name="footer"/>
</div>
<script type="text/javascript" src="<c:url value="/resources/js/bootstrap.min.js"/>"></script>
<script type="text/javascript" src='<c:url value="/resources/js/jquery/jquery-ui.min.js"/>'></script>
</body>
</html>

