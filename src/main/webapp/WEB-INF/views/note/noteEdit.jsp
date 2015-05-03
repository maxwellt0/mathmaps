<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:url var="actionUrl" value="/note/update"/>

<tiles:insertDefinition name="defaultTemplate">
    <tiles:putAttribute name="body">
        <div class="body">
            <div class="container">
                <form:form commandName="note" method="post" action="${actionUrl}" id="noteForm">
                <div class="page-header">
                    <h1>
                        <label for="name">Назва</label>
                        <input class="form-control" name="name" placeholder="Назва" id="name" value="${note.name}" required/>
                    </h1>
                </div>
                <div class="row">
                    <div class="col-md-12">
                        <input name="noteId" type="hidden" value="${note.noteId}"/>

                        <div class="input-group">
                            <label for="text">Текст</label>
                            <textarea class="form-control" name="text" placeholder="Текст" id="text" required><c:out
                                    value="${note.text}" /></textarea>
                        </div>
                        <div class="row">
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <label for="type">Тип</label>
                                    <select class="form-control" name="typeId" id="type">
                                        <c:forEach var="noteType" items="${noteTypes}">
                                            <option value="${noteType.noteTypeId}">${noteType.type}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <label for="rank">Складність</label>
                                    <input type="number" class="form-control" name="rank" min="0" max="100" id="rank"
                                           value="${note.rank}"/>
                                </div>
                            </div>
                            <div class="col-lg-4">
                                <div class="input-group">
                                    <label for="status">Статус</label>
                                    <select class="form-control" name="status" id="status">
                                        <option value="1">Заплановано</option>
                                        <option value="2">Вивчається</option>
                                        <option value="3">Вивчено</option>
                                        <option value="4">Відкладено</option>
                                        <option value="5">Покинуто</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-3">
                                <label for="higher">Використовує:</label>
                            </div>
                            <div class="col-lg-6"></div>
                            <div class="col-lg-3">
                                <label for="lower">Використовується у:</label>
                            </div>
                        </div>
                        <legend></legend>
                        <section>
                            <div class="row">
                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <select name="higher" class="form-control" id="higher" size="8" multiple></select>
                                    </div>
                                </div>
                                <div class="col-lg-1">
                                    <a id="toHigher" class="btn btn-info btn-add">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    </a>
                                    <a id="fromHigher" class="btn btn-default btn-add">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    </a>
                                </div>
                                <div class="col-lg-4">
                                    <select class="form-control" id="assocNotes" size="8" multiple>
                                        <c:forEach var="assocNote" items="${allNotes}">
                                            <option value="${assocNote.noteId}"><c:out
                                                    value="${assocNote.name}"/></option>
                                        </c:forEach>
                                    </select>
                                </div>
                                <div class="col-lg-1">
                                    <a id="toLower" class="btn btn-info btn-add">
                                        <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                                    </a>
                                    <a id="fromLower" class="btn btn-default btn-add">
                                        <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                                    </a>
                                </div>
                                <div class="col-lg-3">
                                    <div class="input-group">
                                        <select name="lower" class="form-control" id="lower" size="8" multiple></select>
                                    </div>
                                </div>
                            </div>
                        </section>
                        <div class="pull-right">
                            <a href="/note/page/${note.noteId}" class="btn btn-default" data-dismiss="modal">Відміна</a>
                            <button type="submit" class="btn btn-primary">Зберегти</button>
                        </div>
                        </form:form>
                    </div>
                </div>
            </div>
        </div>
        <script>
            var lowerIds = JSON.parse("${lowerIds}");
            var higherIds = JSON.parse("${higherIds}");
            var status = "${currentStatus}";
            var typeId = "${currentType}";
        </script>
        <script type="text/javascript" src='<c:url value="/resources/js/note/noteForm.js"/>'></script>
        <script type="text/javascript" src='<c:url value="/resources/js/note/noteEdit.js"/>'></script>
    </tiles:putAttribute>
</tiles:insertDefinition>
