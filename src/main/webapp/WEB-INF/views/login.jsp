<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@page session="true"%>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body" onload='document.loginForm.username.focus();'>
            <div class="container">
                <h1>Spring Security Login Form (Database Authentication)</h1>

                <div id="login-box">

                    <h2>Login with Username and Password</h2>

                    <c:if test="${not empty error}">
                        <div class="error">${error}</div>
                    </c:if>
                    <c:if test="${not empty msg}">
                        <div class="msg">${msg}</div>
                    </c:if>

                    <form name='loginForm'
                          action="<c:url value='/login' />" method='POST'>

                        <table>
                            <tr>
                                <td>User:</td>
                                <td><input type='text' name='username'></td>
                            </tr>
                            <tr>
                                <td>Password:</td>
                                <td><input type='password' name='password' /></td>
                            </tr>
                            <tr>
                                <td colspan='2'><input name="submit" type="submit"
                                                       value="submit" /></td>
                            </tr>
                        </table>

                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />

                    </form>
                </div>
            </div>
        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>