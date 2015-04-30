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
                                </a>
                            </li>
                        </c:forEach>
                        <li class="pull-right">
                            <button class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                                Створити
                            </button>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <c:forEach items="${lists}" var="list" varStatus="listType">
                            <c:set value="${listType.index}" var="index"/>
                            <div role="tabpanel" class="tab-pane" id="navtab${index}">
                                <table class="table table-responsive">
                                    <thead>
                                    <tr>
                                        <th width="22%">Назва</th>
                                        <th width="8%">Текст</th>
                                        <th width="8%">Тип</th>
                                        <th width="8%">Складність</th>
                                        <th width="8%">Карта</th>
                                        <th width="8%">Дії</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${list}" var="listNote" varStatus="loopCounter">
                                        <tr>
                                            <td><c:out value="${listNote.name}"/></td>
                                            <td><a href="/note/page/${listNote.noteId}">Текст</a></td>
                                            <td><c:out value="${listNote.type.type}"/></td>
                                            <td><c:out value="${listNote.rank}"/></td>
                                            <td><a href="/maps/${listNote.noteId}">Карта</a></td>
                                            <td>
                                                <nobr>
                                                    <button onclick="editNote(${listNote.noteId});" class="btn btn-default">
                                                        <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                                    </button>
                                                    <a  href="/note/user/delete/${listNote.noteId}" class="btn btn-primary"
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
        <script type="text/javascript" src='<c:url value="/resources/js/js-for-listNotes.js"/>'></script>
    </tiles:putAttribute>
</tiles:insertDefinition>
