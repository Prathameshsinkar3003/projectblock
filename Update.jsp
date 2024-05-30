<!DOCTYPE html>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="com.connection.DBConnection"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %> 
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>Document Verification System</title>
  <meta content="" name="description">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/favicon.png" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/aos/aos.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/glightbox/css/glightbox.min.css" rel="stylesheet">
  <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
  <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

  <!-- Template Main CSS File -->
  <link href="assets/css/style.css" rel="stylesheet">

  <!-- =======================================================
  * Template Name: Dewi - v4.9.0
  * Template URL: https://bootstrapmade.com/dewi-free-multi-purpose-html-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->

<style type="text/css">
#contact .btn-get-started {
  font-family: "Open Sans", sans-serif;
  text-transform: uppercase;
  font-weight: 500;
  font-size: 14px;
  display: inline-block;
  padding: 10px 35px 10px 35px;
  border-radius: 4px;
  transition: 0.5s;
  color: #fff;
  background: #ff4a17;
  border: 2px solid #ff4a17;
}


</style>
</head>

<body>

  
  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top" style="background-color:gray;">
    <div class="container d-flex align-items-center justify-content-between">

      <h1 class="logo"><a href="">Document Verification System</a></h1>
      <!-- Uncomment below if you prefer to use an image logo -->
      <!-- <a href="index.html" class="logo"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

      <nav id="navbar" class="navbar">
         <ul>
          <li><a class="nav-link scrollto active" href="StudentHome.jsp">Home</a></li>
           <li><a class="nav-link scrollto" href="UploadFile.jsp">Upload File</a></li> 
         <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String std_name=(String)session.getAttribute("std_name");  
	                out.print(" "+std_name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="ViewProfileStudent.jsp">View Profile</a></li>            
              <li><a href="ChangePasswordStudent.jsp">Change Password</a></li>
              <li><a href="LogoutController">Logout</a></li>            
            </ul>
          </li>
         
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->



<br><br><br><br><br>
<!-- ======= Contact Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

        <div class="section-title">
          <h2 style="font-size:22px;"><span>Update</span> File</h2>         
        </div>
 
           <form action="UpdateController" method="post">
						 <%
                   
                   try
                   {
                	   
                	  
            	       String file_name=request.getParameter("filename");
            	       String filecontent=request.getParameter("file");
             		   Connection con = DBConnection.getConnection();
                       Statement stmt =con.createStatement();
                       
                       HttpSession se=request.getSession();
                       se.setAttribute("filename", file_name);
                
                       stmt.setFetchDirection(ResultSet.FETCH_REVERSE);
                      // System.out.println("user_email:"+userEmail);
                     
                       ResultSet rs=stmt.executeQuery("select * from tbl_files where filename='"+file_name+"' ");  
                       
                      // rs.setFetchDirection(ResultSet.FETCH_REVERSE);
                      // id, user_name, user_dob, user_add, user_mobno, user_email, user_password
                       while(rs.next())
                       {
                    	                 
                
                %>
                   
              
                        
                            <center>
                          
                                      <b><div style="color: white;background-color: gray;width: 400px">File Name: <%=rs.getString(3) %></div></b><br>
                              
  <textarea style="height: 200px;width: 400px; color: purple; background-color:pink" name="newfile" value=<%=filecontent %>> <%=rs.getString(4) %></textarea>
   
              <br>   <br> <br>              
                  <!-- <h5 style="color: white;"><a href="" style="color: blue;"><input type="button" name="profile" value="Spilt" class="btn btn-success"></a></h5> -->             
                            
                         <button style="color:darkblue; background-color:white"><b>Update</b></button>                                   
                        </center>  
                          
                  <%      
                          
                         
                  }
                  }
                   catch(Exception e)
                   {
                	   System.out.println(e.getMessage());
                   }
 

 
 %>

                  </form>
    
</div>
      
    </section><!-- End Contact Section -->


  <div id="preloader"></div>
  <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

  <!-- Vendor JS Files -->
  <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
  <script src="assets/vendor/aos/aos.js"></script>
  <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
  <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
  <script src="assets/vendor/php-email-form/validate.js"></script>

  <!-- Template Main JS File -->
  <script src="assets/js/main.js"></script>

</body>

</html>