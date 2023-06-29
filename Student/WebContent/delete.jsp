<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link rel="stylesheet" href="home.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>

 <%
          
        HttpSession sess = request.getSession();
        String sname = (String)sess.getAttribute("sname");
        
 
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","admin");
        	System.out.println("Connected to mysql successfully...");
        	Statement stmt = conn.createStatement();
        	String sql1 = "delete from student where Name=\""+sname+"\"";
        	stmt.executeUpdate(sql1);
        	
        	
 

        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        
        %>






  <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">Student Database</a>

      <!-- redirect to log in page -->
      <form class="d-flex" role="search" >
       
     <button class="btn btn-outline-success" ><a href="table.jsp" style=" text-decoration: none;" >  DataBase </a></button>
      </form> 
      
    
    </div>

</nav>
  



  <div class="container">

<%
    if(sname != null){
    	out.println("<h6>Student Data Removed Successfully......</h6>");
    }
    else{
    	out.println("<h6>No Student Selected... Please go back and Select a Valid Student....</h6>");
    }


%>
    




  </div>


</body>
</html>