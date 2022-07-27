

<%@page import="com.blogProject.entities.catagories"%>
<%@page import="com.blogProject.Dao.userDao"%>
<%@page import="com.blogProject.entities.User"%>
<%@page import="java.util.List"%>
<%@page import="com.blogProject.Dao.postDao"%>
<%@page import="com.blogProject.Dao.catagoriesDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blogProject.entities.posts"%>
<%@page import="com.blogProject.helper.connectionProvider"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>home-Blogger Den</title>
        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <!-- Google fonts-->
        <link href="https://fonts.googleapis.com/css?family=Lora:400,700,400italic,700italic" rel="stylesheet" type="text/css" />
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800" rel="stylesheet" type="text/css" />
        <!-- Core theme CSS (includes Bootstrap)-->
        <link href="css/bootCss.css" rel="stylesheet" />
    </head>
    <body>
        <!-- Navigation-->
        <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp"><i class="fa-brands fa-elementor" style="width: 40px"></i>Blogger Den</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp">Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="loginPage.jsp">Login</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="registerPage.jsp">sign up</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="contactPage.jsp">Contact us</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="donationPage.jsp">Help Us grow</a></li>
                    </ul>
                </div>
            </div>
        </nav>
        <!-- Page Header-->
        <header class="masthead" style="background-image: url('image/blogPage.jpg')">
            <div class="container position-relative px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <div class="site-heading">
                            <h1>your enigmatic blogging companion</h1>
                            <span class="subheading">“Your first blog posts won’t be perfect, but you just have to do it. You have to start somewhere.” – Shane Barker</span>
                        </div>
                    </div>
                </div>
            </div>
        </header>
        
                   <!-- Main Content-->
        <div class="container px-4 px-lg-5">
            <div class="row gx-4 gx-lg-5 justify-content-center">
                <div class="col-md-10 col-lg-8 col-xl-7">
                   
<!--                   Post preview-->

<!--fetching all the posts to show on front page-->
<% 
List<posts> list=new ArrayList<>();
User user;
catagories catagory=new catagories();
catagoriesDao cd=new catagoriesDao(connectionProvider.getConnection());
 userDao ud=new userDao(connectionProvider.getConnection());
postDao pd=new postDao(connectionProvider.getConnection());


list=pd.getAllPosts();
if(list!=null)
{
for(posts p:list)
{
%>
                    <div class="post-preview">
                        <a href="showBlogPage.jsp?post_id=<%=p.getpId()%>">
                            <h2 class="post-title"><%=p.getpTitle() %></h2>
                        </a>
                       
                        <p class="post-meta">
                            Posted by
                            <a href="writerProfile.jsp?user_id=<%=ud.getUserByUserId(p.getuId()).getId()%>"><u><%=ud.getUserByUserId(p.getuId()).getName()%> </u>     </a>
                             
                                 on    <%=p.getpDate().toLocaleString() %>
                            <br>
                             
                            Category : <%=cd.getCatagoryNameByCatagoryId(p.getCatId()).getName()%>
                        </p>
                    </div>
<!--                     Divider-->
                    <hr class="my-4" />
                    <%
                        }

}
else
{

                    %>
                    <h3>Nothing to show !!!</h3>
                    
                    <% }%>
                            
                    <!-- Pager-->
<!--                    <div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase" href="#!">Older Posts →</a></div>-->
                </div>
            </div>
        </div>
                    <!-- Pager-->
                    <div class="row">
                        <div class="col text-center my-2"><span class="subheading">START YOUR BLOGGING JOURNEY WITH US </span></div>
                    </div>
                    <div class="row">
                     <div class="col"><div class="d-flex justify-content-end mb-4"><a class="btn btn-primary text-uppercase" href="loginPage.jsp">Login  <i class="fa-solid fa-right-to-bracket"></i></a></div></div>
                        <div class="col"><div class="d-flex justify-content-start mb-4"><a class="btn btn-primary text-uppercase" href="registerPage.jsp">Sign up  <i class="fa-solid fa-user-plus"></i></a></div></div>
                    </div>
                    
                    
                </div>
            </div>
        </div>
        <!-- Footer-->
        <footer class="border-top">
            <div class="container px-4 px-lg-5">
                <div class="row gx-4 gx-lg-5 justify-content-center">
                    <div class="col-md-10 col-lg-8 col-xl-7">
                        <ul class="list-inline text-center">
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-twitter fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-facebook-f fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                            <li class="list-inline-item">
                                <a href="#!">
                                    <span class="fa-stack fa-lg">
                                        <i class="fas fa-circle fa-stack-2x"></i>
                                        <i class="fab fa-github fa-stack-1x fa-inverse"></i>
                                    </span>
                                </a>
                            </li>
                        </ul>
                        <div class="small text-center text-muted fst-italic">Copyright &copy; www.bloggerden.com</div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Bootstrap core JS-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
        <!-- Core theme JS-->
        <script src="js/myjs.js"></script>
    </body>
</html>


