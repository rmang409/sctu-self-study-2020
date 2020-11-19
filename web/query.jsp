<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %><%--
  Created by IntelliJ IDEA.
  User: 23100
  Date: 2020/11/10
  Time: 10:54
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询</title>
</head>
<body>
<jsp:include page="nav.jsp"/>
<form action="query.jsp" method="post">
    <input type="text" name="keyword">
    <input type="submit" value="搜索">
</form>


<table style="border: coral 1px groove;border-radius: 20px;">
    <tr>
        <td>id</td>
        <td>name</td>
        <td>age</td>
        <td>op1</td>
        <td>op2</td>
    </tr>

<%
    String keyword=request.getParameter("keyword");

    String sql="select *from  t_user1 where name like '%"+keyword+"%'";


    Connection connection =null;
    PreparedStatement statement=null;
    ResultSet resultSet=null;

    Class.forName("com.mysql.jdbc.Driver");
    connection= DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/java?serverTimezone=UTC",
            "root",
            "123456789"
    );
    statement=connection.prepareStatement(sql);

    resultSet=statement.executeQuery(sql);

    while(resultSet.next()){
        int id;
        String name="";
        int age;

        id=resultSet.getInt(1);
        name=resultSet.getString(2);
        age=resultSet.getInt(3);

        out.write("<tr>");
        out.write("<td>"+id+"</td>");
        out.write("<td>"+name+"</td>");
        out.write("<td>"+age+"</td>");
        out.write("<td>"+"<a href='deleteUserHandler.jsp?id="+id+"&name="+name+"&age="+age+"'>删除</a>"+"</td>");
        out.write("<td>"+"<a href='updateUser.jsp?id="+id+"&name="+name+"&age="+age+"'>更新</a>"+"</td>");
        out.write("</tr>");}

    resultSet.close();
    statement.close();
    connection.close();

%>
</table>
</body>
</html>
