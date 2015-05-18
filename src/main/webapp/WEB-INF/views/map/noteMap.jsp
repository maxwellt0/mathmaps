<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div id="myDiagramDiv"></div>
<script type="text/javascript">
    var mapData = JSON.parse('${names}');
    var linkData = JSON.parse('${links}');
</script>
<script type="text/javascript" src='<c:url value="/resources/js/maps/go.js"/>'></script>
<script type="text/javascript" src="<c:url value='/resources/js/maps/map.js'/>"></script>
<script type="text/javascript" src="<c:url value="/resources/js/pace.min.js"/>"></script>

