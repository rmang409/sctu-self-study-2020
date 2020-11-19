<%--
  Created by IntelliJ IDEA.
  User: 23100
  Date: 2020/11/4
  Time: 11:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<jsp:include page="nav.jsp"></jsp:include>

<%
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String age=request.getParameter("age");


%>
<form method="post" action="updateHandler.jsp">
    编号：
    <input type="text" name="id" value="<%out.write(id);%>"/>
    姓名：
    <input type="text" name="name" value="<%out.write(name);%>"/>
    <br/>
    年龄：
    <input type="text" name="age" value="<%out.write(age);%>"/>
    <br/>
    <input type="submit" value="更新">
</form>

</body>
</html>
