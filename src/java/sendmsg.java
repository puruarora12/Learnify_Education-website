/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author purua
 */
@WebServlet(urlPatterns = {"/sendmsg"})
public class sendmsg extends HttpServlet {

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
            throws ServletException, IOException  {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
                 HttpSession ss =request.getSession() ;
    String smail =(String)ss.getAttribute("email") ;
    //String tmail = request.getParameter("tmail"); 
    String tmail= (String)ss.getAttribute("rid");
    System.out.println(tmail+" jkkjkjjkjk  "+smail);
    String con =request.getParameter("msg");
   db.global obj = new db.global() ;
  try{
   int i = obj.autoid("chat" ,"MsgId" ) ;
// SimpleDateFormat formatter =new SimpleDateFormat("dd/MM//yyyy") ;
 //SimpleDateFormat formatter1 =new SimpleDateFormat("hh:mm:ss") ;
   //         java.util.Date date = new java.util.Date();
    //String date1 = formatter.format(date) ; 
    //String time =formatter1.format(date) ;
   
   String qry = "insert into chat values( "+i+" , '"+smail+"' , '"+tmail+"' , '"+con+"') ;";
  // out.print(qry);
   obj.update(qry) ;
response.sendRedirect("chat.jsp?id="+tmail);
  }catch(Exception e){
      System.out.println(e);
  }}
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
