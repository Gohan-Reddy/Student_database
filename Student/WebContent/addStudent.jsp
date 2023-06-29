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
String ID = request.getParameter("sid");
String sname = request.getParameter("sname");
String ssex = request.getParameter("ssex");
String sdob = request.getParameter("sdob");
String snum = request.getParameter("snum");
String semail = request.getParameter("semail");
String cgpa = request.getParameter("cgpa");
String branch = request.getParameter("sbranch");
String sic = request.getParameter("SIC");

//Database Connection

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","admin");
	System.out.println("Connected to mysql successfully...");
	Statement stmt = conn.createStatement();
	String sql = "CREATE TABLE student("
			+ "    ID VARCHAR(255) PRIMARY KEY,"
			+ "    SIC VARCHAR(255),"
			+ "    Name VARCHAR(255),"
			+ "    Sex VARCHAR(255),"
			+ "    DOB DATE,"
			+ "    Contact_Number VARCHAR(255),"
			+ "    Branch VARCHAR(255),"
			+ "    CGPA VARCHAR(255),"
			+ "    Email VARCHAR(255)"
			+ ")";
	String sql1 = "DROP TABLE student";
	String ins = "INSERT INTO student (ID,SIC,Branch, Name, Sex, DOB, Contact_Number, Email,CGPA) VALUES ('"+ID+"','"+sic+"','"+branch+"','"+sname+"','"+ssex+"','"+sdob+"','"+snum+"','"+semail+"','"+cgpa+"');";
 //	stmt.executeUpdate(sql);
 // System.out.println("Table created in database...");
	stmt.executeUpdate(ins);
	System.out.println("Student values inserted....");
	
	
	
//	stmt.executeUpdate(sql1);
//	System.out.println("Table deleted...");








	

	
	
}catch(Exception e) {
	e.printStackTrace();
}


%>






  <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Student Database</a>

      <!-- redirect to log in page -->
      <form class="d-flex" role="search" >
       
     <button class="btn btn-outline-success" ><a href="index.html" style=" text-decoration: none;" >  Go Back </a></button>
      </form> 
      
    
    </div>

</nav>
  



  <div class="container">


    <h6>Student Data Registered Successfully......</h6>




  </div>


</body>
</html>