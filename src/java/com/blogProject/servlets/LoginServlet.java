
package com.blogProject.servlets;

import com.blogProject.Dao.userDao;
import com.blogProject.entities.User;
import com.blogProject.helper.message;
import com.blogProject.helper.connectionProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class LoginServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet LoginServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            // fetch user name and password from login page
            String email=request.getParameter("email");
            String password=request.getParameter("password");
            userDao dao=new userDao(connectionProvider.getConnection());
            User u=dao.getUserByEmailAndPassword(email, password);
            if(u==null)
            {
            // login error
                message msg=new message("Invalid Details entered!! try again","error","alert-danger");
            response.sendRedirect("loginPage.jsp");
            HttpSession s=request.getSession(); 
            s.setAttribute("msg", msg);
            }
            else{ 
                // set session till website exit
            HttpSession s=request.getSession();
            s.setAttribute("currentUser", u);
            response.sendRedirect("profile.jsp");
            }
            out.println("</body>");
            out.println("</html>");
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
