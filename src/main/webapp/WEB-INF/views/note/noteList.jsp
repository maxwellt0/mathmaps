<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="container">
                <div class="page-header">
                    <h1>Список записів</h1>
                </div>
                <div class="row">
                    <div class="col-md-12">

                        <br>
                        <table class="table table-responsive">
                            <thead>
                            <tr>
                                <th width="4%">ID</th>
                                <th width="12%">Назва</th>
                                <th width="12%">Текст</th>
                                <th width="12%">Складність</th>
                                <th width="12%">Карта</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${noteList}" var="note" varStatus="loopCounter">
                                <tr>
                                    <td><c:out value="${note.noteId}"/></td>
                                    <td><c:out value="${note.name}"/></td>
                                    <td><a href="/note/page/${note.noteId}">Текст</a></td>
                                    <td><c:out value="${note.rank}"/></td>
                                    <td><a href="/maps/${note.noteId}">Карта</a></td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

        </div>
    </tiles:putAttribute>
</tiles:insertDefinition>
