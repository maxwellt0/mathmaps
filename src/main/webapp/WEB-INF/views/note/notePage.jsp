<%--
  Created by IntelliJ IDEA.
  User: Maxwellt
  Date: 13.04.2015
  Time: 9:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/templateTop.jsp"%>

<div class="container">
  <div class="page-header">
    <h1><c:out value="${note.name}"/></h1>
  </div>
  <div class="row">
    <div class="col-md-12">

      ${note.text}

    </div>
  </div>
</div>

  <script type="text/x-mathjax-config">
  MathJax.Hub.Config({tex2jax: {inlineMath: [['$','$'], ['\\(','\\)']]}});
  </script>
  <script type="text/javascript"
  src="https://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_HTMLorMML">
  </script>
  <%@ include file="../template/templateBottom.jsp"%>
