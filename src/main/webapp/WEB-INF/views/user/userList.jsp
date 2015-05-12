<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
<tiles:putAttribute name="body">
    <div class="body">
        <div class="container">
            <div class="page-header">
                <h1>List Of Users</h1>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div id="userDialog" style="display: none;">
                        <%@ include file="userForm.jsp" %>
                    </div>

                    <button class="btn btn-primary" onclick="addUser()">
                        <i class="fa fa-plus"></i> Add User
                    </button>
                    <br>
                    <table class="table table-responsive">
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
                                <td><c:out value="${loopCounter.count}"/></td>
                                <td><c:out value="${user.name}"/></td>
                                <td><c:out value="${user.login}"/></td>
                                <td><c:out value="${user.email}"/></td>
                                <td><c:out value="${user.password}"/></td>
                                <td><c:out value="${user.userId}"/></td>

                                <td>
                                    <nobr>
                                        <button onclick="editUser(${user.userId});"
                                                class="btn btn-primary">
                                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> Edit
                                        </button>

                                        <a href="delete/${user.userId}" class="btn btn-primary"
                                           onclick="return confirm('Are you sure you want to delete this user?');">
                                            <span class="glyphicon glyphicon-remove" aria-hidden="true"></span>Delete
                                        </a>
                                    </nobr>
                                </td>
                            </tr>
                        </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</tiles:putAttribute>
</tiles:insertDefinition>