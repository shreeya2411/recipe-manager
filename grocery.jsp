<!DOCTYPE html>
<html lang="en">
<head>
  <title>GROCERY LIST</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <link rel="stylesheet" type="text/css" href="style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.css">
  
<script type="text/javascript" charset="utf8" src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.js"></script>
</head>
<body style="background-color: #339a7b;">

<header>
<div class="navbar">
<ul>

<li><a href="viewrecipe.jsp"><i class="fa fa-newspaper-o" aria-hidden="true"></i>FEED</a></li>
<li><a href="viewrecipe.jsp"><i class="fa fa-search" aria-hidden="true"></i>SEARCH</a></li>
<li><a href="addreci.jsp"><i class="fa fa-glass" aria-hidden="true"></i>ADD RECIPE</a></li>
<li><a href="favorite.jsp"><i class="fa fa-heart-o" aria-hidden="true"></i>FAVORITES</a></li>
<li><a href="grocery.jsp"><i class="fa fa-shopping-basket" aria-hidden="true"></i>GROCERY LIST</a></li>
<li><a href="logout"><i class="fa fa-sign-out" aria-hidden="true"></i>LOGOUT</a></li>

</ul>
</div>
</header>

<div class="container" style="background-color:rgba(44,62,80,0.7);">
  <h2 id="viewrecord">Grocery list</h2>
  <form name='f1' method='post' action="#" enctype="">
	
        
        	<%@ page import="java.sql.*,java.io.*" %>
	<%@page import="java.util.ArrayList"%>
	<%@ page import="java.util.*" %>
 	<%
	
 final String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
    
 final String DB_URL = "jdbc:mysql://localhost:3306/mydb";
	

 final String USERNAME = "root";
	
 final String PASSWORD = "root";
	

Connection conn = null;
    
Statement stmt = null;
	
String path=request.getContextPath(); //returns application path
	
%>

	
   <br>

	
	
	
   </form>
   
   
   <div class="container" style='margin-top:-40px'>
   	<%
	 
try{
     
      

	  //gets path of web app on the server		
	  // String path = application.getRealPath("/");
	  Class.forName(JDBC_DRIVER);
	  conn = DriverManager.getConnection(DB_URL, USERNAME, PASSWORD);
      stmt = conn.createStatement();
     
		String uname=(String)session.getAttribute("uname");
	  String qry1="select grocery from cookuser where username ='"+uname+"' ";
	  ResultSet rs=stmt.executeQuery(qry1);
	  if(rs.next())
	  {
		out.println("<br><table class='table table-bordered display' id='table_id'>");
		out.println("<thead class='thead'>");
		out.println("<tr>");out.println("<th>grocery list</th>");
				out.println("</tr>");
		out.println("</thead>");
		out.println("<tbody>");
						

			out.println("<tr>");
			
		 out.println("<td>"+rs.getString("grocery")+"</td>");
		 
		 		out.println("</tr>");
		
		out.println("</tbody>");
		out.println("<thead class='thead-dark'>");
		out.println("<tr>");
				out.println("</tr>");
		out.println("</thead>");
		out.println("</table></div>");
	  }
	 else
	  {
	 	  out.println("<h3>Nothing to display.</h3>");
	  }
	  stmt.close();
	  conn.close();
	  
	 }
	 catch(Exception ee)
	 {
		 out.println("<h3>Error :"+ee.toString());
	 }
	%>
   </div>
   <br>
   
  
</div>
		<script>
		$(document).ready( function () {
    $('#table_id').DataTable();
} );
		</script>
		
</body>
</html>
