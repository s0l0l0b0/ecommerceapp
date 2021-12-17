<%--
  Created by IntelliJ IDEA.
  User: sololobo
  Date: 12/17/21
  Time: 3:20 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<html>
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/style.css">
    <title> Login </title>
</head>
<body>

<div class="login-page">
    <div class="form">
        <div class="login">
            <div class="login-header">
                <h3>LOGIN</h3>
                <p>
                    <c:if test="${not empty successMsg}">
                        <span style="color:green">${successMsg}</span>
                    </c:if>
                    <c:if test="${not empty error_msg}">sdu
                        <span style="color:red">${error_msg}</span>
                    </c:if>
                    <c:if test="${empty error_msg}">
                        Please enter your credentials to login.
                    </c:if>
                </p>
            </div>
        </div>
        <form class="login-form" action="${pageContext.request.contextPath}/login" method="POST">
            <input type="text" name="username" placeholder="username"/>
            <input type="password" name="password" placeholder="password"/>
            <button type="submit">login</button>
            <p class="message">Not registered? <a href="${pageContext.request.contextPath}/registration">Create an account</a></p>
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        </form>
    </div>
</div>
</body>
</html>
