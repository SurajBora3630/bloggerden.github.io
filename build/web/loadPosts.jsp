<%@page import="com.blogProject.entities.User"%>
<%@page import="com.blogProject.Dao.userDao"%>
<%@page import="java.util.List"%>
<%@page import="com.blogProject.entities.posts"%>
<%@page import="com.blogProject.Dao.postDao"%>
<%@page import="com.blogProject.helper.connectionProvider"%>
<div class="row">
    <%Thread.sleep(1000);
        postDao d = new postDao(connectionProvider.getConnection());

        int cid = Integer.parseInt(request.getParameter("cid"));
        List<posts> post = null;
        if (cid == 0) {
            post = d.getAllPosts();
        } else {
            post = d.getPostByCatId(cid);
        }
        if (post.size() == 0) {
            out.println("<h3 class='display-3 text-center'>No Posts in this category </h3>");
            return;
        }

        for (posts p : post) {

    %>
    <div class="col-md-6 mt-2">
        <div class="card">
            
            <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>">
            <div class="card-body">
                <div class="row row-user">
                    <p><b>Title</b> <%=p.getpTitle()%></p>
                    
                </div>
                     <div class="row">
                    <div class="col-md-8 ">
                        <% userDao dao=new userDao(connectionProvider.getConnection());%>
                        
                        
                        <p class="post-userInfo"><b>Writer:</b><a href="writerProfile.jsp?user_id=<%=dao.getUserByUserId(p.getuId()).getId()%>"><%=dao.getUserByUserId(p.getuId()).getName() %></a></p>
                    </div>
                    <div class="col-md-4">
                        <p class="post-date"><b>Written on:</b><%=p.getpDate().toLocaleString()%></p>
                    </div></div>
                





            </div>
            <div class="card-footer text-center bg-dark text-white">

<!--                <a href="#" class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-thumbs-up"></i><span>10</span></a>-->
                <a href="showBlogPage.jsp?post_id=<%=p.getpId()%>" class="btn btn-outline-primary btn-sm"><i class="fa-brands fa-readme"></i> Read more.</a>
                <!--<a href="#" class="btn btn-outline-primary btn-sm"><i class="fa-solid fa-comment-dots"></i><span>10</span></a>-->
            </div>       
        </div>
    </div>

    <%
    }%>


    

</div>
    <script>
       
            
    
    
    
        </script>