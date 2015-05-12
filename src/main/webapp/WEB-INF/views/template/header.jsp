<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<nav class="navbar navbar-default navbar-fixed-top">
    <div class="container">

        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                    data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <%--<a class="navbar-brand" href="/">MathMaps</a>--%>
        </div>

        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav">
                <li><a href="/">Головна <span class="sr-only">(current)</span></a>
                </li>
                <li><a href="/note/listNotes">Нотатки</a></li>
                <li><a href="/maps/">Карти</a></li>
                <%--<li class="dropdown">--%>
                <%--<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>--%>
                <%--<ul class="dropdown-menu" role="menu">--%>
                <%--<li><a href="#">Action</a></li>--%>
                <%--<li><a href="#">Another action</a></li>--%>
                <%--<li><a href="#">Something else here</a></li>--%>
                <%--<li class="divider"></li>--%>
                <%--<li><a href="#">Separated link</a></li>--%>
                <%--<li class="divider"></li>--%>
                <%--<li><a href="#">One more separated link</a></li>--%>
                <%--</ul>--%>
                <%--</li>--%>
            </ul>
            <%--<form class="navbar-form navbar-left" role="search">--%>
            <%--<div class="form-group">--%>
            <%--<input type="text" class="form-control" placeholder="Search">--%>
            <%--</div>--%>
            <%--<button type="submit" class="btn btn-default">Submit</button>--%>
            <%--</form>--%>
            <ul class="nav navbar-nav navbar-right">
                <sec:authorize access="isAnonymous()">
                    <li><a href="/signup">Реєстрація</a></li>
                    <li><a href="/login">Вхід</a></li>
                </sec:authorize>
                <sec:authorize access="isAuthenticated()">
                <li class="dropdown">
                    <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                        <span class="glyphicon glyphicon-user"></span>
                        <c:out value="${pageContext.request.userPrincipal.name}"/>
                        <span class="caret"></span>
                    </a>
                    <ul class="dropdown-menu" role="menu">
                        <li><a href="/user/page/${pageContext.request.userPrincipal.name}">Профайл</a></li>
                        <sec:authorize access="hasRole('ADMIN')">
                            <li><a href="/user/admin" >Адміністрування</a></li>
                        </sec:authorize>
                        <li class="divider"></li>
                        <li>
                            <c:url value="/logout" var="logoutUrl"/>
                            <form action="${logoutUrl}" method="post" id="logoutForm">
                                <input type="hidden" name="${_csrf.parameterName}"
                                       value="${_csrf.token}"/>
                            </form>
                            <script>
                                function formSubmit() {
                                    document.getElementById("logoutForm").submit();
                                }
                            </script>
                            <a href="javascript:formSubmit()">Вийти</a>
                        </li>
                    </ul>
                </li>
                </sec:authorize>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container-fluid -->
</nav>