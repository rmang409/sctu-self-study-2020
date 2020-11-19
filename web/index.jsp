<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
  <head>
    <title>Jsp</title>
  </head>
  <body>
  <jsp:include page="nav.jsp"/>

  <%


    if (application.getAttribute("count")==null){
      Integer count=0;
      System.out.println("test");
      application.setAttribute("count",count);
    }
    System.out.println(application.getAttribute("count"));
    Integer count= (Integer) application.getAttribute("count");
    count++;
    application.setAttribute("count",count);

  %>

  <table style="border: coral 1px groove;border-radius: 20px;">
    <tr>
      <td>id</td>
      <td>name</td>
      <td>age</td>
      <td>operate1</td>
      <td>operate2</td>
    </tr>

    <%
      //3+1
      String sql="select *from t_user1";
      Connection connection=null;
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

      while(resultSet.next()){
        int id;
        String name="";
        int age;

        id=resultSet.getInt(1);
        name=resultSet.getString(2);
        age=resultSet.getInt(3);
//        System.out.println(id+name+age);
//        out.write(id+name+age);
//        out.write("<br/>");

        out.write("<tr>");
        out.write("<td>"+id+"</td>");
        out.write("<td>"+name+"</td>");
        out.write("<td>"+age+"</td>");
        out.write("<td>"+"<a href='deleteUserHandler.jsp?id="+id+"&name="+name+"&age="+age+"'>删除</a>"+"</td>");
        out.write("<td>"+"<a href='updateUser.jsp?id="+id+"&name="+name+"&age="+age+"'>更新</a>"+"</td>");
        out.write("</tr>");
      }

      resultSet.close();
      statement.close();
      connection.close();


    %>

    <%
      out.write("<h1>访问次数："+
              application.getAttribute("count")+"</h1>");
    %>
  </table>

  </body>
</html>
