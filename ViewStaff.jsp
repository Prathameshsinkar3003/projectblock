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
        <!--   <li><a class="nav-link scrollto active" href="">View</a></li> -->
          <!-- <li><a class="nav-link scrollto" href="About.jsp">About</a></li> -->
         <li class="dropdown"><a href="#"><span>Welcome<%response.setContentType("text/html");  
				 HttpSession sessio=request.getSession(true);  
	               if(session!=null){  
	               String name=(String)session.getAttribute("name");  
	                out.print(" "+name+""); }   %></span> <i class="bi bi-chevron-down"></i></a>
            <ul>
              <li><a href="ViewProfileAdmin.jsp">View Profile</a></li>            
             
              <li><a href="LogoutController">Logout</a></li>            
            </ul>
          </li>
         
        </ul>
        <i class="bi bi-list mobile-nav-toggle"></i>
      </nav><!-- .navbar -->

    </div>
  </header><!-- End Header -->



<br><br><br><br><br>
    <!-- ======= About Us Section ======= -->
    <section id="contact" class="contact">
      <div class="container">

   <div class="section-title">
          <h2 style="font-size:22px;"><span>View</span> Staff</h2>
          
        </div>
 <!-- <section id="contact">
			<div class="container">  -->
				<div class="row">
					<div class="col-md-12">
						<!-- <div class="col-lg-12">
							<div class="text-center color-elements">
								<br><br><br>
							<h2><b>View Users Data</b></h2>
						<br><br>
							</div>
						</div> -->
						<div class="col-sm-offset-2 col-lg-12 ">
						 <form class="subscription-form">
                    <div style="margin-left:20px;margin-right:20px">
                    <table class="table table-bordered" style="color:black">
                   
                     <%
                     Connection con=DBConnection.getConnection();
                     Statement st=con.createStatement();
                     ResultSet rs=st.executeQuery("select * from staff");
                     //while(rs.next())
                     if(rs.next() == false) {
                    	%>
                    	<h4 style="text-align:right;margin-right:70px"><b>No Users Present</b></h4>
                    	<%
                     }
                    else{
                    	int count=0;
                    	do{	 
                    	 if(count == 0) {	
                    	 %>
                    	 <tr  class="danger" style="color:black">
		                    
		                    <th> Staff Name</th>
		                     <th>Address</th>
		                     <th>Email</th>
		                     <th>Mobile No</th>
		                     <th>DOB</th>
		                    <!--  <th>password</th> -->
		                    <!--  <th>Status</th> -->
		                      <th>Action</th> 
		                  </tr>
		                  <%}%>
                    	 <TR>
                    	<%-- <td><img alt="Profile Pic" class="img-circle" src="Profilepic.jsp?id=<%=rs.getInt(1) %>"  width="100px" height="80px"/></td>
                    	   --%>
                    	  <td style="color:black"><%=rs.getString(2) %></td>
                    	  <td style="color:black"><%=rs.getString(3) %></td> 
                    	 <td style="color:black"><%=rs.getString(4) %></td>
                    	 <td style="color:black"><%=rs.getString(5) %></td>
                    	 <td style="color:black"><%=rs.getString(6) %></td>
                    	 <%-- <td style="color:black"><%=rs.getString(7) %></td> --%>
                    	 <%-- <td style="color:black"><%=rs.getString(8) %></td>
                    	 <td style="color:black"><%=rs.getString(9) %></td> --%>
          
                    	<%-- <th><a href="UserStatusController?id=<%=rs.getInt(1)%>&status=<%=rs.getString(9)%>"><%=rs.getString(9)%></a></th> --%>
                    	<%-- <td><a style="color:green;" href="UpdateStaff.jsp?id=<%=rs.getInt(1)%>"><b>Edit</b></a></td> --%>
                    	 <td><a style="color:red;" href="DeleteStaffCon?id=<%=rs.getInt(1)%>"><b>Delete</b></a></td>
                    	 </TR>                    	 
                    <%count++; }while(rs.next());}%> 
                   
                    </table>     
                  </form>
						</div>
					</div>
				</div>

      </div>
    </section><!-- End About Us Section -->

 
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