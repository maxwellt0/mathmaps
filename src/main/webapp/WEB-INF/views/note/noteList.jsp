<%--
  Created by IntelliJ IDEA.
  Note: Maxwellt
  Date: 11.04.2015
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ include file="../template/templateTop.jsp"%>

<div class="container">
  <div class="page-header">
    <h1>List Of Notes</h1>
  </div>
  <div class="row">
    <div class="col-md-12">

      <div id="noteDialog" style="display: none;">
        <%@ include file="noteForm.jsp" %>
      </div>

      <button class="btn btn-primary" onclick="addNote()">
        <i class="fa fa-plus"></i> Add Note
      </button>
      <br>
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
        <c:forEach items="${noteList}" var="note" varStatus="loopCounter">
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
                  <span class="glyphicon glyphicon-remove" aria-hidden="true"></span> Delete
                </a>
              </nobr>
            </td>
          </tr>
        </c:forEach>
        </tbody>
      </table>

      <!--  It is advised to put the <script> tags at the end of the document body so that they don't block rendering of the page -->
    </div>
  </div>
</div>
<script type="text/javascript" src='<c:url value="/resources/js/js-for-listNotes.js"/>'></script>
<%@ include file="../template/templateBottom.jsp"%>
