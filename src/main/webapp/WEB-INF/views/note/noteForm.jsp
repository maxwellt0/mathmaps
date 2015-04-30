<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:url var="actionUrl" value="/note/add"/>
<!-- Modal -->
<div class="modal fade bs-example-modal-lg" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Створення нотатки</h4>
            </div>
            <div class="modal-body">
                <form:form commandName="note" method="post" action="${actionUrl}" id="noteForm">
                    <div class="input-group">
                        <label for="name">Назва</label>
                        <input class="form-control" name="name" placeholder="Назва" id="name"/>
                    </div>
                    <div class="input-group">
                        <label for="text">Текст</label>
                        <textarea class="form-control" name="text" placeholder="Текст" id="text"></textarea>
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
                                <input type="number" class="form-control" name="rank" min="0" max="100" id="rank"/>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="input-group">
                                <label for="status">Статус</label>
                                <select class="form-control" name="status" id="status">
                                    <option value="1" selected>Заплановано</option>
                                    <option value="2">Вивчається</option>
                                    <option value="3">Вивчено</option>
                                    <option value="4">Відкладено</option>
                                    <option value="5">Покинуто</option>
                                </select>
                            </div>
                        </div>
                    </div>
                    <div class="input-group">
                        <label for="lower">Використані факти</label>
                        <input class="form-control" name="lowerNotesStr" placeholder="через кому" id="lower"/>
                    </div>
                    <div class="input-group">
                        <label for="higher">Використовується у</label>
                        <input class="form-control" name="higherNotesStr" placeholder="через кому" id="higher"/>
                    </div>
                    <form:input path="noteId" type="hidden"/>
                </form:form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Відміна</button>
                <button type="button" class="btn btn-primary" id="form-submit">Зберегти</button>
            </div>
        </div>
    </div>
</div>