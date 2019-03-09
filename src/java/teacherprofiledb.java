/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import com.mysql.cj.Session;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Puru
 */
@WebServlet(urlPatterns = {"/teacherprofiledb"})
public class teacherprofiledb extends HttpServlet {

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
       try{
           
           HttpSession ss = request.getSession() ;
         
        String s = (String)ss.getAttribute("email");
      //  out.println(s);
     String password = (String) request.getParameter("Password") ; 
     //out.println(password);
     String mobile = (String) request.getParameter("Phone_number") ; 
     String education = (String) request.getParameter("Education") ; 
     String remarks = (String) request.getParameter("Remarks") ; 
     String sub=  request.getParameter("subjects") ; 
    {
     String qry = "update teacher set Password = '"+password+"' , Phone_number ='"+mobile+"' ,Remarks='"+remarks+"',subject='"+sub+"', Education= '"+education+"'"
             + " where Email_id ='"+s+"'" ;
    
      //out.println(qry);
    //String msg = "Info updated succesfully ";
    //ss.setAttribute("msg", msg);
    out.print("doing");
     new db.global().update(qry);
     out.println("update");
    }
     response.sendRedirect("teacherprofile.jsp");

// out.print(dob+"  "+name+"  "+address+"  "+mobile+"  "+qualification+"  "+gender);
       }catch(Exception e){
           System.out.println(e);
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
