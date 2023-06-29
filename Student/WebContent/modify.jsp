<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.sql.*" %>
<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Bootstrap demo</title>
  <link rel="stylesheet" href="home.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>

<body>

  <!-- <a href=logout>Logout </a>||<a href="savedpass.jsp">View Saved passwords</a><hr> -->


  <nav class="navbar navbar-expand-lg bg-light">
  <div class="container-fluid">
    <a class="navbar-brand" href="index.html">Student Database</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
         
        </li>
        <li class="nav-item">
          
        </li>
        <li class="nav-item">
         
        </li>
      
      </ul>
      <!-- redirect to log in page -->
      <form class="d-flex" role="search" >
           
        <button class="btn btn-outline-success" ><a href="search.jsp " style="text-decoration: none">  Go Back </a></button>
      </form>
  <form class="d-flex" role="search" >
   
  <button class="btn btn-outline-success" ><a href="table.jsp " style="text-decoration: none">  View DataBase </a></button>
  </form> 
    </div>
  </div>
</nav>



  



  <div class="container">


    



    <div class="title">Modify</div>
    <div class="content">
      <form action="modify.jsp">
        <div class="user-details">

          <div class="input-box">
            <span class="details">Email</span>
            <input type="text" placeholder="social media handle" name="email" id="socialM" required>
          </div>


          <div class="input-box">
            <span class="details">Phone Number</span>
            <input type="text" placeholder="Enter your password" name="ph" id="spass" required>
          </div>

        </div>

        <div class="button">
          <input type="submit" value="Save" >
        </div>
      </form>
      
      <%
        
        
        HttpSession sess = request.getSession();
        String sname = (String)sess.getAttribute("sname");
        
        String Email = request.getParameter("email");
        String phone = request.getParameter("ph");
        
        if(sname != null){
        
        
        
        	try {
        		Class.forName("com.mysql.cj.jdbc.Driver");
        		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/student","root","admin");
        		System.out.println("Connected to mysql successfully...");
        		Statement stmt = conn.createStatement();
        	
            	String sql1 = "update student set Email="+'"'+Email+'"'+","+"Contact_Number="+'"'+phone+'"'+ " where name="+'"'+sname+'"'+";";
            	stmt.executeUpdate(sql1);
            	if(Email != null){
            		out.println("<h2>Information have been modified successfully....</h2>");
            }
            
            
            

        	
        	}catch(Exception e) {
        		e.printStackTrace();
        	}
        
        
        }
        else{
        	out.println("<h6>No Student Selected... Please Goback and select a valid student....</h6>");
        }
 
        
        %>
      
    </div>
  </div>

  
   


    
</body>

</html>