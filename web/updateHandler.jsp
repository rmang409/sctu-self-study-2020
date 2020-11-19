<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page errorPage="error.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String id=request.getParameter("id");
    String name =request.getParameter("name");
    String age=request.getParameter("age");
//
//    out.write(name+" "+age);

    String sql="update t_user1 set name=?,age=? where id=?";

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
    statement.setString(1,name);
    statement.setInt(2,Integer.parseInt(age));
    statement.setInt(3,Integer.parseInt(id));

    statement.execute();

    statement.close();
    connection.close();
    response.sendRedirect("index.jsp");
%>
