<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
<tiles:putAttribute name="body">
<div class="body">
    <div class="container">
        <div class="page-header">
            <h1><c:out value="${note.name}"/>
                <a href="/user/notes/add/${note.noteId}" class="btn btn-primary pull-right">
                    Додати в список
                </a>
            </h1>
        </div>
        <div class="row">
            <div class="col-md-12">
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
</tiles:putAttribute>
</tiles:insertDefinition>
