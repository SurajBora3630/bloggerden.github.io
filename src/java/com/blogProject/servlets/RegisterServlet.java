package com.blogProject.servlets;

import com.blogProject.Dao.userDao;
import com.blogProject.entities.User;
import com.blogProject.helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@MultipartConfig
public class RegisterServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            // fetch all form data
            String check=request.getParameter("check");
            if(check==null)
            {
            // show error message
                out.println("please accept terms and conditions to continue");
            }
            else
            {
                String name=request.getParameter("user_name");
                String email=request.getParameter("user_email");
                String password=request.getParameter("user_password");
                String gender=request.getParameter("gender");
                String about=request.getParameter("about");
                String securityans=request.getParameter("user_security_ans");
                // create User object and enter values
                
                User user=new User(name,email,password,gender,about,securityans);
                
                // create a userDao object
                
                userDao dao=new userDao(connectionProvider.getConnection());
                if(dao.saveUser(user))
                {
                out.println("done");
                
                }
                else
                {
                
                out.println("error.....");
                
                }
            }
                
            
        }
    }
    

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
