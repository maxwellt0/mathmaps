<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<tiles:insertDefinition name="defaultTemplate">
  <tiles:putAttribute name="body">
    <div class="body">
      <div class="container">
        <div class="page-header"></div>
        <c:url var="addUrl" value="/signup"/>
        <form:form action="${addUrl}" method="post" modelAttribute="user" id="registrationForm" class="form-horizontal">
          <%--<sec:csrfInput/>--%>
          <div class="form-group">
            <label class="col-xs-3 control-label">
              Логін
            </label>
            <div class="col-xs-5">
              <input id="username" type="text" class="form-control" name="username" required/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">
              Email
            </label>
            <div class="col-xs-5">
              <input type="email" class="form-control" name="email" required/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">
              Пароль
            </label>
            <div class="col-xs-5">
              <input type="password" class="form-control" name="password" id="password" required/>
            </div>
          </div>
          <div class="form-group">
            <label class="col-xs-3 control-label">
              Підтвердження
            </label>
            <div class="col-xs-5">
              <input type="password" class="form-control" name="confirmPassword" required/>
            </div>
          </div>

          <div class="form-group">
            <div class="col-xs-9 col-xs-offset-3">
              <button id="submit" name="signup" type="submit" class="btn btn-primary" name="sign up" value="">
                Зареєструватись
              </button>
            </div>
          </div>
        </form:form>
      </div>

      <script src="<c:url value='/resources/js/jquery/jquery-validate.js'/>"></script>
      <script src="<c:url value='/resources/js/registration.js'/>"></script>
      </div>
    </div>
  </tiles:putAttribute>
</tiles:insertDefinition>
