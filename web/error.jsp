<%--
  Created by IntelliJ IDEA.
  User: 23100
  Date: 2020/11/10
  Time: 11:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" isErrorPage="true" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="nav.jsp"/>

<%
    out.write("<br/>");
    out.write(exception.getMessage());
    out.write("<br/>");
    out.write("出错啦！");
%>

</body>
</html>
