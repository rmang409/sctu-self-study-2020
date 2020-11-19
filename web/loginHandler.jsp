<%--
  Created by IntelliJ IDEA.
  User: 23100
  Date: 2020/11/10
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String name=request.getParameter("name");
    String pwd=request.getParameter("password");

    String sql="select *from t_login where name='"+name+"'";


    Connection connection =null;
    Statement statement=null;
    ResultSet resultSet=null;

    Class.forName("com.mysql.jdbc.Driver");
    connection= DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/java?serverTimezone=UTC",
            "root",
            "123456789"
    );
    statement=connection.createStatement();

    resultSet=statement.executeQuery(sql);

    String password =null;
    while (resultSet.next()){
        password=resultSet.getString(3);
    }

    if (password.equals(pwd)){
        session.setAttribute("user:",name);
        response.sendRedirect("index.jsp");
    }else {
        out.write("用户名或密码错误！");
    }

    resultSet.close();
    statement.close();
    connection.close();


%>
