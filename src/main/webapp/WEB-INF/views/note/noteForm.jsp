<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:url var="actionUrl" value="/note/add" />

<form:form id="noteForm" commandName="note" method="post"
           action="${actionUrl}" class="pure-form pure-form-aligned">

    <fieldset>
        <legend></legend>

        <div >
            <label for="name">Назва</label>
            <form:input  class="form-control" path="name" placeholder="Назва" />
        </div>
        <div >
            <label for="text">Текст</label>
            <form:textarea class="form-control" path="text" placeholder="Текст" />
        </div>
        <div >
            <label for="rank">Складність</label>
            <form:input class="form-control" path="rank" placeholder="Складність"/>
        </div>
        <div>
            <%--<label for="lowerNotesStr">Використані факти</label>--%>
            <input  class="form-control" name="lowerNotesStr" placeholder="Використані факти" />
        </div>
        <div>
            <%--<label for="higherNotesStr">Використовується у</label>--%>
            <input  class="form-control" name="higherNotesStr" placeholder="Використовується у" />
        </div>
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