<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
 <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Student Database</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    <link rel="stylesheet" href="sp.css">
          <style>
    
    
    
    .btnd{
  height: 100%;
  width: 30%;
  border-radius: 5px;
  border: none;
  color: #fff;
  font-size: 18px;
 
  
  cursor: pointer;

  background: linear-gradient(135deg, #e47ba5, #892629);
}
.btnm{
  height: 100%;
  width: 30%;
  border-radius: 5px;
  border: none;
  color: #fff;
  font-size: 18px;
 
  
  cursor: pointer;

  background: linear-gradient(135deg, #8fb8e0, #0f2a5f);
}

.ach{
   text-decoration: none;
   color: Green;
}
.ach:hover{
color:orange;
}
    
    </style>

</head>
<body>



 <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">Student Database</a>

      <!-- redirect to log in page -->
      <form class="d-flex" role="search" >
       
      <button class="btn btn-outline-success" ><a class = "ach" href="index.html" style=" text-decoration: none;" >  Go Back </a></button>
      </form> 
      
    
    </div>

</nav>
    <div class="container">
        <div class="content">
        
     <table class="table" style="color: purple;">
        <thead>
          <tr>
            <th scope="col">#ID</th>
            <th scope="col">SIC</th>
            <th scope="col">Branch</th>
            <th scope="col">Name</th>
            <th scope="col">Sex</th>
            <th scope="col">Contact Number</th>
            <th scope="col">DOB</th>
            <th scope="col">Email</th>
            <th scope="col">CGPA</th>
         
          </tr>
        </thead>
        
        <%
        
        PreparedStatement p = null;
        ResultSet rs = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","admin");
        	System.out.println("Connected to mysql successfully...");
        	Statement stmt = conn.createStatement();
        	String sql1 = "Select *from student";
        	p = conn.prepareStatement(sql1);
        	rs = p.executeQuery();
        	
        	while(rs.next()){
        		String id = rs.getString("ID");
        	    String name = rs.getString("Name");
        	    String sex = rs.getString("Sex");
        	    String cgpa = rs.getString("cgpa");
        	    String Branch = rs.getString("Branch");
        	    String sic = rs.getString("SIC");
        	    String cn = rs.getString("Contact_Number");
        	    String email = rs.getString("Email");
            	out.print("<tbody>");
            	out.println("<tr><th scope=\"row\">"+  id + "</th>"+"<td>"+sic+"</td>"+"<td>"+Branch+"</td>"+"<td>"+name+"</td>"+
            	            "<td>"+sex+"</td>"+ "<td>"+cn+"</td>"+ "<td>"+rs.getDate("DOB")+"</td>" +"<td>"+email+"</td>"+"<td>"+cgpa+"</td>"+"</tr></tbody>");
            }
        	

        	




        	

        	
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        
        %>
   
  
      </table>
    </div>
  
</div>

</body>
</html>