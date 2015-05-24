<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="container">

                <%@ include file="../note/noteForm.jsp" %>

                <div role="tabpanel">
                    <ul class="nav nav-tabs" role="tablist">
                        <c:forEach items="${types}" var="type" varStatus="typeIndex">
                            <li role="presentation">
                                <c:set value="${typeIndex.index}" var="index"/>
                                <a href="#navtab${index}" aria-controls="navtab${index}" role="tab" data-toggle="tab">
                                    <c:out value="${type}"/>
                                    <c:if test="${lists.get(typeIndex.index).size() ne 0}">
                                        <span class="badge">
                                            <c:out value="${lists.get(typeIndex.index).size()}"/>
                                        </span>
                                    </c:if>
                                </a>
                            </li>
                        </c:forEach>
                        <li class="pull-right">
                            <button class="btn btn-info" data-toggle="modal" data-target="#myModal">
                                Створити
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <c:forEach items="${lists}" var="list" varStatus="listType">
                            <c:set value="${listType.index}" var="index1"/>
                            <div role="tabpanel" class="tab-pane" id="navtab${index1}">
                                <table class="table table-responsive paginated">
                                    <thead>
                                    <tr>
                                        <th>Назва</th>
                                        <th>Тип</th>
                                        <th>Складність</th>
                                        <th class="table-actions">Дії</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="listNote" varStatus="loopCounter">
                                        <tr>
                                            <td><a href="/note/page/${listNote.noteId}"><c:out value="${listNote.name}"/></a></td>
                                            <td><c:out value="${listNote.type.type}"/></td>
                                            <td><c:out value="${listNote.rank}"/></td>
                                            <td class="table-actions">
                                                <nobr>
                                                    <c:choose>
                                                        <c:when test="${listNote.publishingStatus == 2}">
                                                            <c:set var="disabled" value="${'disabled'}"/>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set var="disabled" value="${''}"/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a type="button" href="/note/offer/${listNote.noteId}/${pageContext.request.userPrincipal.name}"
                                                       class="btn btn-info" ${disabled} title="Запропонувати">
                                                        <span class="glyphicon glyphicon-share-alt" aria-hidden="true"></span>
                                                    </a>
                                                    <c:choose>
                                                        <c:when test="${listNote.publishingStatus == 2}">
                                                            <button class="btn btn-warning edit-button" title="Редагувати"
                                                                    onclick="passId('${listNote.noteId}')">
                                                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                            </button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <a  href="/note/edit/${listNote.noteId}"
                                                                class="btn btn-warning" title="Редагувати">
                                                                <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                            </a>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <a  href="/note/delete/${listNote.noteId}/${pageContext.request.userPrincipal.name}"
                                                        class="btn btn-default" title="Видалити"
                                                        onclick="return confirm('Ви справді хочете видалити цей запис?');">
                                                        <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                                                    </a>
                                                </nobr>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </div>
                        </c:forEach>
                    </div>
                </div>

            </div>
        </div>
        <script>
            var noteStates = '${jsTypes}'.split("~");
            var username = '${pageContext.request.userPrincipal.name}';
            var noteId;
            function passId(newNoteId){
                noteId = newNoteId;
            }
        </script>
        <script type="text/javascript" src='<c:url value="/resources/js/userPage.js"/>'></script>
        <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-ui-i18n.min.js'/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/datatables/jquery.dataTables.min.js"/>"></script>
        <script type="text/javascript" src="<c:url value="/resources/js/datatables/dataTables.bootstrap.js"/>"></script>
        <script type="text/javascript" src='<c:url value="/resources/js/datatables/datatables.js"/>'></script>
    </tiles:putAttribute>
</tiles:insertDefinition>
