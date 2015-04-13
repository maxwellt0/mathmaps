<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="actionUrl" value="save" />

<form:form id="userForm" commandName="user" method="post"
           action="${actionUrl}" class="pure-form pure-form-aligned">

    <fieldset>
        <legend></legend>

        <div class="pure-control-group">
            <label for="name">Name</label>
            <form:input path="name" placeholder="Book Name" />
        </div>
        <div class="pure-control-group">
            <label for="login">Login</label>
            <form:input path="login" placeholder="Login" maxlength="15" />
        </div>
        <div class="pure-control-group">
            <label for="email">Email</label>
            <form:input path="email" placeholder="Email" maxlength="30" />
        </div>
        <%--<div class="pure-control-group">--%>
            <%--<label for="authors">Author(s)</label>--%>
            <%--<form:input path="authors" placeholder="Authors" />--%>
        <%--</div>--%>
        <div class="pure-control-group">
            <label for="password">Password</label>
            <form:input path="password" placeholder="Password" />
        </div>
        <%--<div class="pure-control-group">--%>
            <%--<label for="publisher">Publisher</label>--%>
            <%--<form:input path="publisher" placeholder="Publisher" />--%>
        <%--</div>--%>
        <%--<div class="pure-control-group">--%>
            <%--<label for="publishedOn">Published On</label>--%>
            <%--<form:input path="publishedOn" placeholder="YYYY-MM-DD" class="datepicker" />--%>
        <%--</div>--%>

        <form:input path="userId" type="hidden" />
    </fieldset>
</form:form>