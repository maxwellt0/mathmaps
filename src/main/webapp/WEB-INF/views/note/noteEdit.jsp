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
            <input class="form-control" name="name" placeholder="Назва" id="name" value="${note.name}"/>
          </h1>
        </div>
        <div class="row">
          <div class="col-md-12">
              <input name="noteId" type="hidden" value="${note.noteId}"/>
              <div class="input-group">
                <label for="text">Текст</label>
                <textarea class="form-control" name="text" placeholder="Текст" id="text" ><c:out value="${note.text}"/></textarea>
              </div>
              <div class="row">
                <div class="col-lg-4">
                  <div class="input-group">
                    <label for="type">Тип</label>
                    <select class="form-control" name="typeId" id="type"  value="${note.type.noteTypeId}">
                      <c:forEach var="noteType" items="${noteTypes}">
                        <option value="${noteType.noteTypeId}">${noteType.type}</option>
                      </c:forEach>
                    </select>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="input-group">
                    <label for="rank">Складність</label>
                    <input type="number" class="form-control" name="rank" min="0" max="100" id="rank"  value="${note.rank}"/>
                  </div>
                </div>
                <div class="col-lg-4">
                  <div class="input-group">
                    <label for="status">Статус</label>
                    <select class="form-control" name="status" id="status" >
                      <option value="1" >Заплановано</option>
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
                <input class="form-control" name="lowerNotesStr" placeholder="через кому" id="lower" />
              </div>
              <div class="input-group">
                <label for="higher">Використовується у</label>
                <input class="form-control" name="higherNotesStr" placeholder="через кому" id="higher"/>
              </div>
              <a href="/" class="btn btn-default" data-dismiss="modal">Відміна</a>
              <button type="submit" class="btn btn-primary">Зберегти</button>
            </form:form>
          </div>
        </div>
      </div>
    </div>
  </tiles:putAttribute>
</tiles:insertDefinition>
