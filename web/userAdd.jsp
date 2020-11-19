<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>添加用户</title>
</head>
<body>
<%
    if(session.getAttribute("user")==null){
        response.sendRedirect("login.jsp");
    }
%>



<jsp:include page="nav.jsp"></jsp:include>
<br/>
    <form method="post" action="userAddHandler.jsp">
    姓名：<input type="text" name="username" />
    <br/>
    年龄：<input type="text" name="age"/>
    <br/>
    <input type="submit" value="保存">
</form>
</body>
</html>
