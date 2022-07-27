<%@page import="com.blogProject.Dao.userDao"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.blogProject.entities.catagories"%>
<%@page import="com.blogProject.entities.posts"%>
<%@page import="com.blogProject.Dao.postDao"%>
<%@page import="com.blogProject.helper.connectionProvider"%>
<%@page import="com.blogProject.entities.User"%>

<%@page errorPage="errorPage.jsp" %>
<%
    User user = (User) session.getAttribute("currentUser"); // checks the session of user
    if (user == null) {
        response.sendRedirect("loginPage.jsp");
    }

%>
<%
    
int pId=Integer.parseInt(request.getParameter("post_id"));
postDao d=new postDao(connectionProvider.getConnection());
posts p=d.getPostByPostId(pId);
    %>
    

<%@page contentType="text/html" pageEncoding="UTF-8"%>





<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title><%=p.getpTitle()  %>|| bloggers den</title>
        <!--        css     -->
<!--        - Font Awesome icons (free version)-->
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
       
        <style>
            .post-title{
                font-weight:150;
                font-size:30px; 
            }
            .post-content{
                font-weight: 130;
                font-size: 25px;
            }
            .post-date{
                font-style: italic;
                font-weight: bold;
            }
            .post-user-info{
                font-size: 20px;
                font-weight: 100;
            }
            .row-user{
                border: 1px solid #e2e2e2;
                padding-top: 15px;
            }
            
            
            body{ background:url(image/trustTheProcess.jpg);
                background-size: cover;
                background-attachment: fixed;
                
                
            }
        </style>
        
       
    </head>
    <body>

                                
                                <!--                     navbar start-->
                         <nav class="navbar navbar-expand-lg navbar-light" id="mainNav">
            <div class="container px-4 px-lg-5">
                <a class="navbar-brand" href="index.jsp"><b><i class="fa-brands fa-elementor" ></i>Blogger Den</b></a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
                    Menu
                    <i class="fas fa-bars"></i>
                </button>
                <div class="collapse navbar-collapse" id="navbarResponsive">
                    <ul class="navbar-nav ms-auto py-4 py-lg-0">
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="index.jsp"><i class="fa fa-house"></i>Home</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="loginPage.jsp"><i class="fa fa-arrow-right-to-arc"></i>Login</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="registerPage.jsp"><i class="fa fa-user-plus"></i> sign up</a></li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="contactPage.jsp"><span class="fa fa-phone"></span> Contact us</a></li>
                        <li class="nav-item">
                            <a class="nav-link px-lg-3 py-3 py-lg-4" href="#" data-toggle="modal" data-target="#add-post-modal"><span class="fa fa-asterisk"></span>Add Post</a>
                        </li>
                        <li class="nav-item"><a class="nav-link px-lg-3 py-3 py-lg-4" href="donationPage.jsp">Help Us grow</a></li>
                    </ul>
                    
                    <ul class="navbar-nav mr-right ml-auto form-inline my-2 my-lg-0">
                        <li class="nav-item">
                            <a class="nav-link" href="#!" data-toggle="modal" data-target="#profile-modal">

                                <%= user.getName()%></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="LogoutServlet"><span class="fa fa-power-off"> Log out</span></a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
  
     
        <!--// end of navbar-->
        
        
        
<!--        main content of the body
        -->
        
        <div class="container">
            <div class="row">
                <div class="col-md-8 ">
                    
                    <div class="card">
                        
                        
                        <div class="card-header text-center">
                            <% userDao dao=new userDao(connectionProvider.getConnection());%>
                            <h4 class="post-title"><%=p.getpTitle() %></h4>
                            <div class="card-img">
                                
                                <img src="blog_pics/<%=p.getpPic()%>" class="card-img img-thumbnail" alt="Responsive image">
                            </div>
                        </div>
                        <div class="card-body">
                            <div class="row my-3 row-user">
                                <div class="col-md-6">
                                    <p class="post-user-data"> Written by:   <a href="writerProfile.jsp?user_id=<%=dao.getUserByUserId(p.getuId()).getId()%>"><u><%=dao.getUserByUserId(p.getuId()).getName()%> </u>     </a> </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="post-date"><%=p.getpDate().toLocaleString()  %></p>
                                </div>
                            </div>
                                    <p class="post-content"><%=p.getpContent()%></p>
                            <br><!-- comment -->
                            <div class="post-code">
                            <pre><%=p.getpCode()%></pre>
                            </div>
                        </div>
                            
                            <div class="card-footer bg-light ">
                                <div class="row">
                                    <div class="col-md-4"><iframe src="https://www.facebook.com/plugins/like.php?href=http%3A%2F%2Flocalhost%3A8282%2FEbigmaticBlogProject%2FshowBlogPage.jsp%3Fpost_id%3D13&width=174&layout=button_count&action=like&size=large&share=true&height=46&appId" width="174" height="46" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowfullscreen="true" allow="autoplay; clipboard-write; encrypted-media; picture-in-picture; web-share"></iframe></div>
                                    <div class="col-md-8"><div class="fb-comments" data-href="http://localhost:8282/EbigmaticBlogProject/showBlogPage.jsp?post_id=13" data-width="" data-numposts="5"></div></div>
                                </div>
                               
<!--                        <a href="#" class="btn btn-outline-primary btn-sm border-light text-white"><i class="fa-solid fa-thumbs-up"></i><span>10</span></a>
to be integrated later          
                        <a href="#" class="btn btn-outline-primary btn-sm border-light text-white"><i class="fa-solid fa-comment-dots"></i><span>10</span></a>-->
                    </div>  
                            
                                
                            </div>
                   
                </div>
                            
            </div>
        </div>
        
<!--        end of main content of body-->
       
        
        
        <!--// start of profile modal-->



        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Enigmatic-blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>



                    <div class="container text-center">
                        <img class="img-fluid " width="100px"     src="image/<%=user.getProfile()%>"  style="border-radius: 50%;max-width: 200px "/>
                        <br>
                        <h5 class="modal-title  mt-3" id="exampleModalLabel"><%= user.getName()%></h5>
                    </div>
                    <!--          // details-->
                    <div id="profileDetails">
                        <table class="table">
                            <thead>

                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row"> Email </th>
                                    <td><%=user.getEmail()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">Name</th>
                                    <td><%= user.getName()%></td>

                                </tr>
                                <tr>
                                    <th scope="row">About</th>
                                    <td><%= user.getAbout()%></td>


                                </tr>
                                <tr>
                                    <th scope="row">You joined us on </th>
                                    <td><%=user.getDateTime().toString()%></td>


                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--      profile edit-->
                    <div class="container text-center" id="profile-Edit" style="display: none;" >
                        <h3 class="mt-2" >Please edit carefully</h3>
                        <form action="EditServlet" method="post" enctype="multipart/form-data">

                            <table class="table">
                                <tr>
                                    <td>
                                        ID : 
                                    </td>
                                    <td>
                                        <%=user.getId()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Email : 
                                    </td>
                                    <td>
                                        <%= user.getEmail()%>
                                    </td>
                                </tr>
                                <!--            ///////////////////////////////////////////////-->
                                <tr>
                                    <td>
                                        Name : 
                                    </td>
                                    <td>
                                        <input type="text" name="user_name" value="<%= user.getName()%>" class="form-control">
                                    </td>
                                </tr>
                                <!--            //////////////////////////////////////////////////-->
                                <tr>
                                    <td>
                                        Password : 
                                    </td>
                                    <td>
                                        <input type="text" name="user_pass" value="<%= user.getPassword()%>" class="form-control">
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        Gender: 
                                    </td>
                                    <td>
                                        <%= user.getGender().toUpperCase()%>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        About : 
                                    </td>
                                    <td>
                                        <textarea name="user_about" rows="3" class="form-control"><%=user.getAbout()%>
                                        </textarea>
                                    </td>
                                <tr>
                                    <td>
                                        New Profile Pic : 
                                    </td>
                                    <td>
                                        <input type="file" name="image" class="form-control">
                                        </textarea>
                                    </td>
                                </tr>

                            </table>
                            <div class="container">
                                <button class="btn btn-outline-success" type="submit">Save</button>
                            </div>
                        </form>



                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" id="edit-profile-button">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--// end of profile modal-->

        <!--add post modal-->



        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header bg-dark text-white text-center">
                        <h5 class="modal-title" id="exampleModalLabel">Enter Post Details .</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="post">
                            <div class="form-group">

                                <select name="cid" class="form-control" id="catagory">
                                    <option selected disabled="">---Select Category---</option>
                                    <%
                                        postDao postd = new postDao(connectionProvider.getConnection());
                                        ArrayList<catagories> list = postd.getAllCatagories();
                                        for (catagories c : list) {
                                    %>
                                    <option value="<%=c.getCid()%>"><%=c.getName()%></option>

                                    <%

                                        }
                                    %>
                                </select>
                            </div>

                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control">
                            </div>
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" style="height:180px;" placeholder="Enter your Content ?"></textarea>
                            </div>
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" style="height:180px;" placeholder="Add any coding reference for your program"></textarea>
                            </div>
                            <div class="form-group">
                                <label for="image">Select any Image :</label> 
                                <input name="pic" type="file" id="image" class="form-control" > 
                            </div>

                            <div class="container text-center"><!-- comment -->
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>

                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--end post modal-->







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

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>

        <script>
            $(document).ready(function ()
            {
                let editStatus = false;
                $('#edit-profile-button').click(function () {
                    if (editStatus === false)
                    {

                        $("#profileDetails").hide();
                        $("#profile-Edit").show();
                        editStatus = true;
                        $(this).text("Edit");
                    } else {
                        $("#profileDetails").show();
                        $("#profile-Edit").hide();
                        editStatus = false;
                    }


                });
            });
        </script>
        <!--           now add post J s -->
        <script>
            $(document).ready(function (e) {
                $("#add-post-form").on("submit", function (event) {
                    //this code will be called when form is submited.

                    event.preventDefault();
                    console.log("you have clicked on submit..");
                    let form = new FormData(this);
                    $.ajax({
                        url: "AddPostServlet",
                        type: 'POST',
                        data: form,
                        success: function (data, textStatus, jqXHR)
                        {
                            //success....
                            console.log(data);
                            if (data.trim() === 'done')
                            {

                                swal("Good Job Blogger!", "your blog is saved successfully!", "success", {
                                    button: "Oh yeah!"
                                });
                            } else {
                                swal("oh damn!", "SomeThing went wrong!!!Try again", "error", {
                                    button:"close"
                                });
                            }
                         },
                        error: function (jqXHR, textStatus, errorThrown)
                        {

                        },
                        processData: false,
                        contentType: false

                    });
                });
            });

        </script>
        
        
    </body>
</html>
