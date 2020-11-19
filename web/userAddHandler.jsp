<%@ page import="java.sql.*" %>
<%@ page errorPage="error.jsp" %>

<%
    request.setCharacterEncoding("utf-8");

    String name =request.getParameter("username");
    String age=request.getParameter("age");

    out.write(name+" "+age);

    String sql="insert into t_user1(name,age) values(?,?)";

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

    statement.execute();

    statement.close();
    connection.close();
    response.sendRedirect("index.jsp");
%>