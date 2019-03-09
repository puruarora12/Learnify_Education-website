/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import db.global;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.util.logging.Level;
import java.util.logging.Logger;
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
@WebServlet(urlPatterns = {"/teacherlogincheck"})
public class teacherlogincheck extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response){
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
          try{
            String email = request.getParameter("email") ; 
String password  = request.getParameter("pass") ; 
global obj = new db.global();
//out.print("1sst");
HttpSession ss= request.getSession() ; 
//out.print("2sst");
ss.setAttribute("email", email);
ss.setAttribute("Password", password);
//out.print("3sst");
String qry1 = "select * from teacher where Email_id= '"+email+"' ;";
String qry0 = "select * from student where Email_id= '"+email+"' ;";
ResultSet rs1 = new db.global().execute(qry1);
//out.print("4sst");
ResultSet rs0 = new db.global().execute(qry0);
if(rs0.next())
    response.sendRedirect("teacherloginaftererror.jsp");
rs1.next();
//out.print("5sst");
int id = rs1.getInt("TeacherID");
//out.print("6sst");
ss.setAttribute("id", id);

//String e = "UserName or Password Are incorrect ";
//ss.setAttribute("error", e);
String qry = "select * from teacher where Email_id = '"+email+"' and password ='"+password+"' ;" ;
//System.out.println(qry);
ResultSet rs = obj.execute(qry) ; 
if(rs.next()){
    response.sendRedirect("welcometeacher.jsp");
}else{
    
    response.sendRedirect("teacherloginaftererror.jsp");
}
        }catch(Exception e){
            System.out.println(e);
        }
    }   catch (IOException ex) {
            Logger.getLogger(teacherlogincheck.class.getName()).log(Level.SEVERE, null, ex);
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
