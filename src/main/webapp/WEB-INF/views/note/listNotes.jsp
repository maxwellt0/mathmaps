<%--
  Created by IntelliJ IDEA.
  Note: Maxwellt
  Date: 11.04.2015
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
  <title>List Of Notes</title>

  <link rel="stylesheet" href='<c:url value="/web-resources/css/pure-0.4.2.css"/>'>

  <link rel="stylesheet"
        href='<c:url value="/web-resources/css/font-awesome-4.0.3/css/font-awesome.css"/>'>
  <link rel="stylesheet"
        href='<c:url value="/web-resources/css/jquery-ui-1.10.4.custom.css"/>'>
  <style type="text/css">
    th {
      text-align: left
    }

  </style>
</head>

<body>
<div style="width: 95%; margin: 0 auto;">

  <div id="noteDialog" style="display: none;">
    <%@ include file="noteForm.jsp"%>
  </div>

  <h1>List Of Notes</h1>

  <button class="pure-button pure-button-primary" onclick="addNote()">
    <i class="fa fa-plus"></i> Add Note
  </button>
  <br>
  <table class="pure-table pure-table-bordered pure-table-striped">
    <thead>
    <tr>
      <th width="4%">ID</th>
      <th width="12%">Name</th>
      <th width="12%">Text</th>
      <th width="12%">Rank</th>
      <%--<th width="12%">Higher Note</th>--%>
      <%--<th width="12%">Lower Note</th>--%>
      <th width="12%"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${noteList}" var="note" varStatus="loopCounter">
      <tr>
        <td><c:out value="${note.noteId}" /></td>
        <td><c:out value="${note.name}" /></td>
        <td><c:out value="${note.text}" /></td>
        <td><c:out value="${note.rank}" /></td>
        <%--<td>--%>
      <%--<c:forEach items="${noteList}" var="higher_note">--%>
        <%--&lt;%&ndash;<c:out value="${higher_note.name}" />&ndash;%&gt;--%>
        <%--,--%>
      <%--</c:forEach>--%>
        <%--</td>--%>
        <%--<td>--%>
          <%--<c:forEach items="${note.uses}" var="lower_note">--%>
            <%--<c:out value="${lower_note.name}" /> ,--%>
          <%--</c:forEach>--%>
        <%--</td>--%>
        <td>
          <nobr>
            <button onclick="editNote(${note.noteId});"
                    class="pure-button pure-button-primary">
              <i class="fa fa-pencil"></i> Edit
            </button>

            <a href="delete/${note.noteId}" class="pure-button pure-button-primary"
               onclick="return confirm('Are you sure you want to delete this note?');">
              <i class="fa fa-times"></i>Delete
            </a>
          </nobr>
        </td>
      </tr>
    </c:forEach>
    </tbody>
  </table>
</div>

<!--  It is advised to put the <script> tags at the end of the document body so that they don't block rendering of the page -->

<script type="text/javascript"
        src='<c:url value="/web-resources/js/lib/jquery-1.10.2.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/js/lib/jquery-ui-1.10.4.custom.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/js/lib/jquery.ui.datepicker.js"/>'></script>
<script type="text/javascript"
        src='<c:url value="/web-resources/js/js-for-listNotes.js"/>'></script>
</body>
</html>
