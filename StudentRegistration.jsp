<!DOCTYPE html>
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
 <style type="text/css">


/* /* Full-width input fields */
 /* input[type=text], input[type=password],input[type=date] {
  width: 80%;
  padding: 3px 5px;
  margin: 5px 0;
  display: inline-block;
  border: 1px solid #ccc;
/*   box-sizing: border-box; */
 /*  border-radius:10px;
}  */
 input[type=button], input[type=submit], input[type=reset] {
 
	position:relative;
    padding: 5px 22px;
	border-radius:15px;
	background-color:#008800;
	align:center;	
	color: white;
	font-type:Bold;
	text-decoration: none; 
    font-size: 20px;
    margin: 8px 4px;
    cursor: pointer;
} 
 */
 
 .contact .formone {
  width: 100%;
  box-shadow: 0 0 24px 0 rgba(0, 0, 0, 0.12);
  padding: 30px;
  background: #fff;
}

.contact .formone .form-group {
  padding-bottom: 8px;
}

/* .contact .formone .error-message {
  display: none;
  color: #fff;
  background: #ed3c0d;
  text-align: center;
  padding: 15px;
  font-weight: 600;
} */

.contact .formone .register {
  display: none;
  color: #fff;
  background: #18d26e;
  text-align: center;
  padding: 15px;
  font-weight: 600;
}



.contact .formone input {
  border-radius: 0;
  box-shadow: none;
  font-size: 14px;
}

.contact .formone input {
  height: 44px;
}



.contact .formone button[type=submit] {
  background: #ffb03b;
  border: 0;
  padding: 10px 24px;
  color: #fff;
  transition: 0.4s;
  border-radius: 50px;
}

.contact .formone button[type=submit]:hover {
  background: #ffa012;
}

@-webkit-keyframes animate-loading {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}

@keyframes animate-loading {
  0% {
    transform: rotate(0deg);
  }

  100% {
    transform: rotate(360deg);
  }
}
  </style>

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
          <li><a class="nav-link scrollto active" href="">Home</a></li>
          <li><a class="nav-link scrollto" href="About.jsp">About</a></li>
          <li><a class="nav-link scrollto" href="StudentLogin.jsp">Student</a></li>
          <li><a class="nav-link scrollto " href="StaffLogin.jsp">Staff</a></li>
          <li><a class="nav-link scrollto " href="AdminLogin.jsp">Admin</a></li>
         
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
          <h2 style="font-size:22px;"><span>Register</span> Here</h2>
          
        </div>
 
        <div class="row">
       <div class="col-lg-6">
         <form action="StudentRegistrationController" method="post" class="formone">
          <div class="row">
            
            <div class="form-group mt-1">
              <input type="text" name="std_name" class="form-control" id="std_name" placeholder="Your name" required>
            </div>
           
            <div class="form-group mt-1">
              <input type="text" name="std_address" class="form-control" id="std_address" placeholder="Your address" required>
            </div>
            <div class="form-group mt-1">
              <input type="date" name="std_dob" class="form-control" id="std_dob" placeholder="Your Date of Birth" required>
            </div>
            <div class="form-group mt-1">
              <input type="text" name="std_mobileno" class="form-control" id="std_mobileno" placeholder="Your Mobile Number" required>
            </div>
            <div class="form-group mt-1">
              <input type="email" class="form-control" name="email" id="email" placeholder="Your Email" required>
            </div>
            <div class="form-group mt-1">
              <input type="password" name="password" class="form-control" id="password" placeholder="Your password" required>
            </div>
            
          </div>
          <br>
       <div class="text-center"><button type="submit" class="btn-get-started">Register</button>
       
       <br><br><a href="StudentLogin.jsp" style="color:green;">Login here!!!</a></div>
        </form>
</div>
 <div class="col-lg-6">
 <img src="assets/img/student-registration.png" class="img-fluid" alt="">
 </div>
</div>
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