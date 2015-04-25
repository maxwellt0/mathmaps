<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
  <tiles:putAttribute name="body">
    <div class="body" onload='document.loginForm.username.focus();'>
      <div class="container">
        <h1>Форма входу</h1>

      </div>
    </div>
  </tiles:putAttribute>
</tiles:insertDefinition>
