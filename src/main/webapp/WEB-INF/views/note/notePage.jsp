<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<tiles:insertDefinition name="defaultTemplate">
<tiles:putAttribute name="body">
<div class="body">
    <div class="container map-top"></div>
    <div class="container">
        <div class="page-header">
            <%--<h4><c:out value="${note.type.type}"/></h4>--%>
            <h1><c:out value="${note.name}"/>
                <sec:authorize access="isAuthenticated()">
                    <c:if test="${isAdded}">
                        <button class="btn btn-success pull-right">
                            Додано
                            <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
                        </button>
                    </c:if>
                    <c:if test="${not isAdded}">
                        <a href="/note/user/add/${note.noteId}" class="btn btn-primary pull-right">
                            Додати в список
                            <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>
                        </a>
                    </c:if>
                </sec:authorize>
                <a href="/maps/${note.noteId}?full=1" class="btn btn-default pull-right btn-map">
                    Розширена карта
                </a>
            </h1>
        </div>
        <div class="row">
            <div class="col-md-12 note-text">
                   ${note.text}
            </div>
        </div>
    </div>
</div>
<script type="text/x-mathjax-config">
    MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
</script>
<script type="text/javascript"
        src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
</script>
    <script type="text/javascript">
        $(document).ready( function(){
            $.ajax({
                url: "/maps/ajax/" + "${note.noteId}",
                success: function (result) {
                    $('.map-top').append(result);
                }
            })
        });
    </script>
</tiles:putAttribute>
</tiles:insertDefinition>
