<%--
  Created by IntelliJ IDEA.
  User: Maxwellt
  Date: 11.04.2015
  Time: 16:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<html>
<head>
  <title>List Of Users</title>

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

  <div id="userDialog" style="display: none;">
    <%@ include file="userForm.jsp"%>
  </div>

  <h1>List Of Users</h1>

  <button class="pure-button pure-button-primary" onclick="addUser()">
    <i class="fa fa-plus"></i> Add User
  </button>
  <br>
  <table class="pure-table pure-table-bordered pure-table-striped">
    <thead>
    <tr>
      <th width="4%">S.N</th>
      <th width="12%">Name</th>
      <th width="12%">Login</th>
      <th width="12%">Email</th>
      <th width="12%">Password</th>
      <th width="12%">ID</th>
      <th width="12%"></th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${userList}" var="user" varStatus="loopCounter">
      <tr>
        <td><c:out value="${loopCounter.count}" /></td>
        <td><c:out value="${user.name}" /></td>
        <td><c:out value="${user.login}" /></td>
        <td><c:out value="${user.email}" /></td>
        <td><c:out value="${user.password}" /></td>
        <td><c:out value="${user.userId}" /></td>

        <td>
          <nobr>
            <button onclick="editUser(${user.userId});"
                    class="pure-button pure-button-primary">
              <i class="fa fa-pencil"></i> Edit
            </button>

            <a href="delete/${user.userId}" class="pure-button pure-button-primary"
               onclick="return confirm('Are you sure you want to delete this user?');">
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
        src='<c:url value="/web-resources/js/js-for-listUsers.js"/>'></script>
</body>
</html>
