<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<tiles:insertDefinition name="defaultTemplate">
  <tiles:putAttribute name="body">
    <div class="body">
      <div class="container">

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
              </ul>
              <div class="tab-content">
                  <c:forEach items="${lists}" var="list" varStatus="listType">
                      <c:set value="${listType.index}" var="index"/>
                      <div role="tabpanel" class="tab-pane" id="navtab${index}">
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
                                              <c:set var="publDisabled" value="${''}"/>
                                              <c:set var="denyDisabled" value="${''}"/>
                                              <c:if test="${listNote.publishingStatus==2}">
                                                  <c:set var="publDisabled" value="${'disabled'}"/>
                                              </c:if>
                                              <c:if test="${listNote.publishingStatus==3}">
                                                  <c:set var="denyDisabled" value="${'disabled'}"/>
                                              </c:if>
                                              <a  href="/note/publish/${listNote.noteId}"
                                                  class="btn btn-info" ${publDisabled}>
                                                  <span class="glyphicon glyphicon-ok-circle" aria-hidden="true"></span>
                                              </a>
                                              <a  href="/note/deny/${listNote.noteId}"
                                                  class="btn btn-info" ${denyDisabled}>
                                                  <span class="glyphicon glyphicon-ban-circle" aria-hidden="true"></span>
                                              </a>
                                              <a href="/note/edit/${listNote.noteId}/${pageContext.request.userPrincipal.name}" class="btn btn-default">
                                                  <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                              </a>
                                              <a  href="/note/delete/${listNote.noteId}" class="btn btn-default"
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
      <script type="text/javascript" src="<c:url value='/resources/js/jquery/jquery-ui-i18n.min.js'/>"></script>
      <script type="text/javascript" src="<c:url value="/resources/js/datatables/jquery.dataTables.min.js"/>"></script>
      <script type="text/javascript" src="<c:url value="/resources/js/datatables/dataTables.bootstrap.js"/>"></script>
      <script type="text/javascript" src='<c:url value="/resources/js/datatables/datatables.js"/>'></script>
      <script type="text/javascript" src='<c:url value="/resources/js/admin.js"/>'></script>
  </tiles:putAttribute>
</tiles:insertDefinition>
