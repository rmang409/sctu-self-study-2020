<%--
  Created by IntelliJ IDEA.
  User: 23100
  Date: 2020/11/10
  Time: 14:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="nav.jsp"/>
<form action="loginHandler.jsp" method="post">
    账户:
    <input type="text" name="name"/>
    <br/>
    密码:
    <input type="password" name="password"/>
    <br/>
    <input type="submit" value="登录">
</form>
</body>
</html>
