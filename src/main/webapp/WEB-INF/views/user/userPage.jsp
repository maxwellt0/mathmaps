<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
  <tiles:putAttribute name="body">
    <div class="body">
      <div class="container">
        <div class="page-header">
          <c:url value="/logout" var="logoutUrl" />
          <form action="${logoutUrl}" method="post" id="logoutForm">
            <input type="hidden" name="${_csrf.parameterName}"
                   value="${_csrf.token}" />
          </form>
          <script>
            function formSubmit() {
              document.getElementById("logoutForm").submit();
            }
          </script>
          <c:if test="${pageContext.request.userPrincipal.name != null}">
            <h2>
              Welcome : ${pageContext.request.userPrincipal.name} | <a
                    href="javascript:formSubmit()"> Logout</a>
            </h2>
          </c:if>
        </div>
        <c:forEach items="${lists}" var="list" varStatus="listType">
          <h3><c:out value="${types[listType.index]}"/></h3>
          <table class="table table-responsive">
            <thead>
            <tr>
              <th width="4%">ID</th>
              <th width="12%">Назва</th>
              <th width="12%">Текст</th>
              <th width="12%">Складність</th>
              <th width="12%">Карта</th>
              <th width="12%"></th>
            </tr>
            </thead>
            <tbody>
            <c:forEach items="${list}" var="note" varStatus="loopCounter">
              <tr>
                <td><c:out value="${note.noteId}"/></td>
                <td><c:out value="${note.name}"/></td>
                <td><a href="page/${note.noteId}">Текст</a></td>
                <td><c:out value="${note.rank}"/></td>
                <td><a href="http://localhost:8080/maps/${note.noteId}">Карта</a></td>
                <td>
                  <nobr>
                    <button onclick="editNote(${note.noteId});" class="btn btn-default">
                      <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
                    </button>

                    <a href="delete/${note.noteId}" class="btn btn-primary"
                       onclick="return confirm('Are you sure you want to delete this note?');">
                      <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>
                      Delete
                    </a>
                  </nobr>
                </td>
              </tr>
            </c:forEach>
            </tbody>
          </table>
        </c:forEach>
       
      </div>
    </div>
  </tiles:putAttribute>
</tiles:insertDefinition>
