<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="actionUrl" value="save" />

<form:form id="noteForm" commandName="note" method="post"
           action="${actionUrl}" class="pure-form pure-form-aligned">

    <fieldset>
        <legend></legend>

        <div class="pure-control-group">
            <label for="name">Назва</label>
            <form:input path="name" placeholder="Назва" />
        </div>
        <div class="pure-control-group">
            <label for="text">Text</label>
            <form:textarea path="text" placeholder="Текст" />
        </div>
        <div class="pure-control-group">
            <label for="rank">Складність</label>
            <form:input path="rank" placeholder="Складність" maxlength="10" />
        </div>
        <%--<div class="pure-control-group">--%>
            <%--<label for="authors">Author(s)</label>--%>
            <%--<form:input path="authors" placeholder="Authors" />--%>
        <%--</div>--%>
        <%--<div class="pure-control-group">--%>
            <%--<label for="publisher">Publisher</label>--%>
            <%--<form:input path="publisher" placeholder="Publisher" />--%>
        <%--</div>--%>
        <%--<div class="pure-control-group">--%>
            <%--<label for="publishedOn">Published On</label>--%>
            <%--<form:input path="publishedOn" placeholder="YYYY-MM-DD" class="datepicker" />--%>
        <%--</div>--%>

        <form:input path="noteId" type="hidden" />
    </fieldset>
</form:form>