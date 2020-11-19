<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String id=request.getParameter("id");
    String name=request.getParameter("name");
    String age=request.getParameter("age");


    out.write("成功删除用户"+id+name+age);

    //3+1
    String sql="delete from t_user1 where id="+id;

    Connection connection=null;
    PreparedStatement preparedStatement =null;
    ResultSet resultSet=null;

    Class.forName("com.mysql.jdbc.Driver");
    connection= DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/java?serverTimezone=UTC",
            "root",
            "123456789"
    );
    preparedStatement=connection.prepareStatement(sql);
    preparedStatement.execute();

    preparedStatement.close();
    connection.close();

    response.sendRedirect("index.jsp");//停留页面

%>

