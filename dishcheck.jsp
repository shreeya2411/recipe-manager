<%@ page import="java.io.*,java.sql.*" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%
String sn=request.getParameter("ver");
Class.forName("com.mysql.jdbc.Driver");
Connection con =DriverManager.getConnection("jdbc:mysql://localhost:3306/mydb", "root", "root");
Statement st=con.createStatement();
ResultSet rs = st.executeQuery("select * from recipe where dish='"+sn+"'"); // this is for name
if(rs.next())
{
out.println("<font color=red>");
out.println("Dish already exists");
out.println("</font>");
}else {
out.println("<font color=green>");
out.println("Available");
out.println("</font>");
}
rs.close();
st.close();
con.close();
%>