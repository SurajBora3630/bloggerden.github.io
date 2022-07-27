

<%@page import="com.blogProject.entities.User"%>
<%@page import="com.blogProject.Dao.userDao"%>
<%@page import="com.blogProject.helper.connectionProvider"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
           int id=Integer.parseInt(request.getParameter("user_id"));
    userDao dao=new userDao(connectionProvider.getConnection());

User user=new User();
user=dao.getUserByUserId(id);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Blogger profile :<%=user.getName()%></title>
<!--     - Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <style>
            header {
	position:relative;
	left:0;
	top:0;
	width:100%;
	min-height:120px;
	padding:50px 0;
	color:#fff;
	    background: #383838 url(https://www.athenadesignstudio.com/plugins/switch/images/bg.jpg) no-repeat center center;
	margin-bottom:30px
}

/* Logo */
header .logo {
	clear:both;
    display:block;
	text-align:center;
    padding-bottom:10px;
}

/* Title */
header h1 {
    font-weight:300;
    font-size:24px;
    color:#eee;	
	letter-spacing:2px;
	text-align:center;
	text-transform:uppercase;
	margin:0 !important;
	padding-bottom:25px;
}


h1,
h2,
h3,
h4,
h5,
h6,
div,
input,
p,
a {
    font-family: "Open Sans";
    margin: 0px;
}

a,
a:hover,
a:focus {
    color: inherit;
}

body {
    background-color: #F1F2F3;
}

.container-fluid,
.container {
    max-width: 1200px;
}

.card-container {
    padding: 100px 0px;
    -webkit-perspective: 1000;
    perspective: 1000;
}





.profile-card-4:hover img {
    filter: grayscale(100%);
}


.profile-card-4 {
    max-width: 700px;
    background-color: #FFF;
    border-radius: 5px;
    box-shadow: 0px 0px 25px rgba(0, 0, 0, 0.1);
    overflow: hidden;
    position: relative;
    margin: 10px auto;
    cursor: pointer;
}

.profile-card-4 img {
    transition: all 0.25s linear;
}

.profile-card-4 .profile-content {
    position: relative;
    padding: 15px;
    background-color: #FFF;
}

.profile-card-4 .profile-name {
    font-weight: bold;
    position: absolute;
    left: 0px;
    right: 0px;
    top: -70px;
    color: #FFF;
    font-size: 17px;
}

.profile-card-4 .profile-name p {
    font-weight: 600;
    font-size: 13px;
    letter-spacing: 1.5px;
}

.profile-card-4 .profile-description {
    color: #777;
    font-size: 20px;
    padding: 10px;
    font-weight: 600;
}

.profile-card-4 .profile-overview {
    padding: 15px 0px;
}

.profile-card-4 .profile-overview p {
    font-size: 15px;
    
    color: #777;
}

.profile-card-4 .profile-overview h4 {
    color: #273751;
    font-weight: bold;
}

.profile-card-4 .profile-content::before {
    content: "";
    position: absolute;
    height: 20px;
    top: -10px;
    left: 0px;
    right: 0px;
    background-color: #FFF;
    z-index: 0;
    transform: skewY(3deg);
}

.profile-card-4:hover img {
    transform: rotate(5deg) scale(1.1, 1.1);
    filter: brightness(110%);
}
.nav-link{
    font-weight: bold;
}

        </style>
    </head>
    <body>



<!--        navbar-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp"><b><i class="fa-brands fa-elementor"></i>Blogger Den</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="profile.jsp">Profile</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="registerPage.jsp">Sign up</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="contactPage.jsp">Contact us</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="donationPage.jsp">Help Us grow</a></li>
                    </ul>
                </div>
            </div>
        </nav>
<!--  navbar end-->

<header>
    <div class="container text-center">

        <!-- Logo -->
        <div class="logo">
			  <h1><b>Blogger Id : <%=user.getId()%></b></h1>
        </div>

        <h1>Blogger name : <%=user.getName()%></h1>
        <h1>Email :<%=user.getEmail()%></h1>

    </div>
</header>

<div class="container">
	<div class="row">
		


		<div class="col">
    <hr>
    <div class="profile-card-4 text-center"><img style="width:350px"src="image/<%=user.getProfile()%>" class="img img-responsive">
        <div class="profile-content">
            
            <div class="profile-description"><%=user.getAbout()%></div>
            <div class="row">
                <div class="col-md-8">
                    <div class="profile-overview">
                        <p><%=user.getDateTime().toLocaleString()%></p>
                        </div>
                </div>
                <div class="col-md-4">
                    <div class="profile-overview">
                        <p><%=user.getGender()%></p>
                        
                </div>
               
            </div>
        </div>
    </div>
</div>
	</div>
</div>
        
   






<!--        javascript-->
        <!-- jQuery library -->
        <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

        <!-- Popper JS -->
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

        <!-- Latest compiled JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    </body>
</html>
