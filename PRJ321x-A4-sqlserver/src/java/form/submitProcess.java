/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package form;

import dbaccess.PostsDAO;
import entity.Posts;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author AMIN
 */
@WebServlet(name = "submitProcess", urlPatterns = {"/submitProcess"})
public class submitProcess extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            HttpSession session = request.getSession();
            int i = request.getParameter("id") == null ? 0 : Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String contents = request.getParameter("contents");
            String[] checked = request.getParameterValues("published");
            boolean published = checked != null;
            if ("".equals(title) || "".equals(description) || "".equals(contents)) {
                if ("".equals(title)) session.setAttribute("titleMessage", "Tiêu đề không được để trống");
                if ("".equals(description)) session.setAttribute("desMessage", "Mô tả không được để trống");
                if ("".equals(contents)) session.setAttribute("contentMessage", "Nội dung không được để trống");
                response.sendRedirect("/PRJ321x-A4-sqlserver/newPost.jsp");
            } else {
                Date date = new Date();
                String user = (String) session.getAttribute("username");
                Posts p = new Posts(title, description, contents, date, published, user);
                if (i == 0) new PostsDAO().addPost(p);
                else new PostsDAO().editPost(p, i);
                response.sendRedirect("/PRJ321x-A4-sqlserver/posts.jsp");
            }
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
