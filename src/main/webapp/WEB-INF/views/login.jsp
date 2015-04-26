<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@page session="true" %>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body" onload='document.loginForm.username.focus();'>
            <div class="container">
                <div class="page-header">
                    <c:if test="${not empty error}">
                        <div class="error">${error}</div>
                    </c:if>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">Форма входу</div>
                    <div class="panel-body">
                        <form name='loginForm' action="<c:url value='/login' />" method='POST' class="form-login">
                            <div class="input-group">
                                <label for="username">Логін</label>
                                <input type='text' class="form-control" name='username' id="username">
                            </div>
                            <div class="input-group">
                                <label for="password">Пароль</label>
                                <input type='password' class="form-control" name='password' id="password"/>
                            </div>
                            <button name="submit" type="submit" class="btn btn-primary btn-login">Ввійти</button>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>