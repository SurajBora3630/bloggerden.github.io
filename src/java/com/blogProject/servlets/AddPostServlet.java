
package com.blogProject.servlets;

import com.blogProject.Dao.postDao;
import com.blogProject.entities.User;
import com.blogProject.entities.posts;
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
public class AddPostServlet extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            int cid=Integer.parseInt(request.getParameter("cid"));
           String pTitle=request.getParameter("pTitle");
           String pContent=request.getParameter("pContent");
           String pCode=request.getParameter("pCode");
           Part part=request.getPart("pic");
           String image=part.getSubmittedFileName();
           
          
//           out.println(pTitle);
//           out.println(part.getSubmittedFileName());
            // getting current id;
            HttpSession session = request.getSession();
            User user=(User)session.getAttribute("currentUser");
            posts p=new posts(pTitle,pContent,pCode,part.getSubmittedFileName(),null,cid,user.getId());
            postDao dao=new postDao(connectionProvider.getConnection());
            if(dao.savePost(p))
            {
            
            String path=request.getRealPath("/")+ "blog_pics" +File.separator+image;// create path for old file
            helper.saveFile(part.getInputStream(),path);
            out.println("done");
            }
            else
            {
            out.println("error");
            }
  //public posts(String pTitle, String pContent, String pCode, String pPic, Timestamp pDate, int catId,int uId)         
           
          
            
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
