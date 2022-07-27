

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registration Page|| blogger den</title>
        
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
       
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <!-- Latest compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
        <style>
              .banner-background{ background:url(image/blogPage.jpg);
                background-size: cover;
                background-attachment:scroll}
        </style>
    </head>
    
    <body>
        

        <%@include file="normalNavbar.jsp" %>
        <main class="primary-background p-5 banner-background">
            <div class="container">
                <div class="col-md-6 offset-md-3">
                    <div class="card">
                        <div class="card-header text-center primary-background text-white">
                            <span class="fa fa-3x fa-user-circle"></span>
                            <br><!-- comment -->
                            Register here   
                        </div>
                        <div class="card-body">

                            <form action="RegisterServlet" method="post" id="reg-form">

                                <div class="form-group">
                                    <label for="user_name">User name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="name_help" placeholder="Enter your name">
                                    <small id="name_help" class="form-text text-muted">do not include any salutation like mr , mrs etc.</small>
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>

                                <div class="form-group">


                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio"  id="gender" name="gender" value="Male"> Male
                                    <br>
                                    <input type="radio"  id="gender" name="gender" value="Female"> Female
                                    <br>


                                </div>
                                <br>
                                
                                <div class="form-group">
                                    <label for="securityQues">Security Question</label>
                                    <input name="user_security_ans" required type="text" class="form-control" id="securityQues" placeholder="Your Childhood Name">
                                    <small id="securityQues" class="form-text text-muted">You will need this if u forget your login credentials.</small>
                                </div>


                                <br>
                                <div class="form-group">
                                    <textarea class="form-control" name="about" if=""  rows="5" placeholder="Enter something about yourself"></textarea>
                                </div>
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree Terms and Condition </label>
                                </div>

                                <br>
                                <div class="container text-center " id="loader" style="display: none">
                                <span class="fa fa-refresh fa-spin fa-3x"></span>
                                <h4>Please wait</h4>
                                </div>
                                <button id="submit-btn" type="submit" class="btn btn-info">Submit</button>
                                <button type="reset" class="btn btn-info">Reset</button>
                            </form>
                        </div>
                        
                    </div>
                </div>
            </div>
        </main>
        
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
       

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
        <script>
            
            $(document).ready (function(){
                console.log("loaded.......")
                $('#reg-form').on('submit',function(event)
                { event.preventDefault();
                    let form=new FormData(this);
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    
                    // send register servlet
       
        $.ajax({ url:"RegisterServlet",
                type:'POST',
                data:form,
                success: function (data,textStatus,jqXHR)
        {console.log(data);
         $("#submit-btn").show();
                    $("#loader").hide();
                    if(data.trim()==='done'){
    swal("Registration successfull....we are redirecting you to login page").then((value) => {
  window.location="loginPage.jsp";
});   

                    }
                    else {
                        swal(data);
	
}

    },
        error: function (jqXHR,textStatus,errorThrown)
        {
            
            $("#submit-btn").show();
                    $("#loader").hide();
    swal("Something went wrong.... Try again");
    
             
    },
                
        
                processData:false,
                contentType:false
            });
            });
    
});
        </script>
    </body>
</html>
