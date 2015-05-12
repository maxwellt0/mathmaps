<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="container">
                <div class="page-header">
                    <h1>Список нотаток</h1>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <table class="table table-responsive paginated">
                            <thead>
                            <tr>
                                <th width="22%">Назва</th>
                                <th width="8%">Тип</th>
                                <th width="8%">Складність</th>
                                <th width="8%">Карта</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${noteList}" var="note" varStatus="loopCounter">
                                <tr>
                                    <td><a href="/note/page/${note.noteId}"><c:out value="${note.name}"/></a></td>
                                    <td><c:out value="${note.type.type}"/></td>
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
        <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-ui-i18n.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/datatables/jquery.dataTables.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/datatables/dataTables.bootstrap.js"/>"></script>
        <script type="text/javascript" src='<c:url value="/resources/js/datatables/global.datatables.js"/>'></script>
    </tiles:putAttribute>
</tiles:insertDefinition>
