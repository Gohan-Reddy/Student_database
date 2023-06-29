<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Search</title>
  <link rel="stylesheet" href="home.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
    
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

.ach1{
   text-decoration: none;
   color: white;
}
.ach1:hover{
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
       
      <button class="btn btn-outline-success" ><a class="ach" href="index.html" style=" text-decoration: none;" >  Go Back </a></button>
      </form> 
      
    
    </div>

</nav>

<div class="container">


    



    <div class="title">Search</div>
    <div class="content">
      <form action="search.jsp">
        <div class="user-details">

          <div class="input-box">
            <span class="details">Search For the Name</span>
            <input type="text" placeholder="Search" name="sname" id="socialM" required>
          </div>


          <div class="input-box">
            <div class="button">
              <input type="submit" value="Search" >
            </div>
          </div>

        </div>

        
      </form>
      
       <table class="table" style="color: purple;">
        <thead>
          <tr>
            <th scope="col">#ID</th>
            <th scope="col">Name</th>
            <th scope="col">Sex</th>
            <th scope="col">Contact Number</th>
            <th scope="col">DOB</th>
            <th scope="col">Email</th>
         
          </tr>
        </thead>
        
         
        <%
        String sname = request.getParameter("sname");
        HttpSession sess = request.getSession();
        sess.setAttribute("sname", sname);
        
        PreparedStatement p = null;
        ResultSet rs = null;
        try {
        	Class.forName("com.mysql.cj.jdbc.Driver");
        	Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","admin");
        	System.out.println("Connected to mysql successfully...");
        	Statement stmt = conn.createStatement();
        	String sql1 = "Select *from student where name=\""+sname+"\"";
        	p = conn.prepareStatement(sql1);
        	rs = p.executeQuery();
        	
        	while(rs.next()){
          	    String id = rs.getString("ID");
        	    String name = rs.getString("Name");
        	    String sex = rs.getString("Sex");
        	    
        	    String cn = rs.getString("Contact_Number");
        	    String email = rs.getString("Email");
        	    String branch = rs.getString("branch");
        	    String cgpa = rs.getString("CGPA");
            	out.print("<tbody>");
            	out.println("<tr><th scope=\"row\">"+  id + "</th>"+"<td>"+name+"</td>"+
            	            "<td>"+sex+"</td>"+ "<td>"+cn+"</td>"+ "<td>"+rs.getDate("DOB")+"</td>" +"<td>"+email+"</td>"+"</tr></tbody>");
            
        	
            
        	}

        	




        	

        	
        	
        }catch(Exception e) {
        	e.printStackTrace();
        }
        
        
        %>
        
        
        
         </table>
         
        
         
       
         <form action="delete.jsp">
          <button class="btnd"><a class="ach1" href="delete.jsp">Delete</a> </button> <br><br>
         
         </form>
         
         <form action="modify.jsp">
         <button class="btnm"><a class="ach1" href="modify.jsp">Modify</a></button>
         
         </form>
           
           
         
         
    </div>
    
    
  </div>
 
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
    crossorigin="anonymous"></script>
    
</body>
</html>