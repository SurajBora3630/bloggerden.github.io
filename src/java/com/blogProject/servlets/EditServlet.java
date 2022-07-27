
package com.blogProject.servlets;

import com.blogProject.Dao.userDao;
import com.blogProject.entities.User;
import com.blogProject.helper.message;
import com.blogProject.helper.connectionProvider;
import com.blogProject.helper.helper;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class EditServlet extends HttpServlet {

        protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet EditServlet</title>");            
            out.println("</head>");
            out.println("<body>");
            // fetch all data
            
            String name=request.getParameter("user_name");
            String password=request.getParameter("user_pass");
            String about=request.getParameter("user_about");
            Part part=request.getPart("image");
            String imageName=part.getSubmittedFileName();
            
            // get user from the ongoing session
            
            HttpSession s=request.getSession();
            s.getAttribute("currentUser");
            User user=(User)s.getAttribute("currentUser");
            user.setName(name);
            user.setPassword(password);
            user.setAbout(about);
            String oldfile=user.getProfile();
            user.setProfile(imageName);
            
            // update database
            
            userDao dao=new userDao(connectionProvider.getConnection());
            boolean check=dao.updateUser(user);
            if(check)
            {
            
            String path=request.getRealPath("/")+"image"+File.separator+user.getProfile();  // create path for new file
            String patholdFile=request.getRealPath("/")+"image"+File.separator+oldfile;// create path for old file
            if(!oldfile.equals("default.png"))
            helper.deleteFile(patholdFile);   // delete path of old file
            
            if(helper.saveFile(part.getInputStream(), path))
            {
            message msg=new message("Profile updated","success","alert-success");
           
            s.setAttribute("msg", msg);
            
            }
//            else
//            {
//           
//            message msg=new message("Something went wrong","error","alert-danger");
//            s.setAttribute("msg", msg);
//            }
            }          
            else
            {
           
            message msg=new message("Something went wrong","error","alert-danger");
            s.setAttribute("msg", msg);
            }
            response.sendRedirect("profile.jsp");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
