<%-- 
    Document   : profile
    Created on : Mar 9, 2019, 1:27:34 AM
    Author     : dell
--%>

<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!DOCTYPE html>
<!--
Template Name: Algenius
Author: <a href="http://www.os-templates.com/">OS Templates</a>
Author URI: http://www.os-templates.com/
Licence: Free to use under our free template licence terms
Licence URI: http://www.os-templates.com/template-terms
-->
<html lang="">
<head>
<title>Welcome</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link href="layout/styles/layout.css" rel="stylesheet" type="text/css" media="all">
</head>
<body id="top">
    
   <%  //  if(((String)session.getAttribute("email"))==null){
                                        //   response.sendRedirect("beforelogin.html");
                                    //   }%>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row0">
  <div id="topbar" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div class="fl_left">
      <ul>
        
        <li><i class="fa fa-envelope-o"></i> Learnify@gmail.com</li>
      </ul>
    </div>
    <div class="fl_right">
      <ul>
        <li><a href="welcomestudent"><i class="fa fa-lg fa-home"></i></a></li>
        
      </ul>
    </div>
    <!-- ################################################################################################ --> 
  </div>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row1">
  <header id="header" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <div id="logo" class="fl_left">
      <h1><a href="#">Learnify</a></h1>
    </div>
    <div id="quickinfo" class="fl_right">
      <ul class="nospace inline">
        <li><strong>Contact us:</strong><br>
          Learnify@gmail.com</li>
        
      </ul>
    </div>
    <!-- ################################################################################################ --> 
  </header>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->

<% 
    String qry = "select * from student where Email_id ='"+(String)session.getAttribute("email")+"' ;   "; 
ResultSet rs = new db.global().execute(qry);
System.out.println(qry);
    if(rs.next()){
    

%>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
<div class="wrapper row2">
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="welcomestudent.jsp">Home</a></li>
      <li><a class="drop" href="#">Subjects</a>
        <ul>
          <li><a href="maths.jsp">Maths</a></li>
          <li><a href="pages/chemistry.jsp">Chemistry</a></li>
          <li><a href="physics.jsp">Physics</a></li>
          <li><a href="bio.jsp">Biology</a></li>
          <li><a href="cs.jsp">ComputerScience</a></li>
        </ul>
      </li>
      <li><a href="faculty.jsp">Faculty</a></li>
      <li><a href="ask.jsp">Asked Questions</a></li>
      <li><a href="stuprofile.jsp">Profile</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>
<% }else{ %>

<div class="wrapper row2">
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="welcometeacher.jsp">Home</a></li>
      <li><a class="drop" href="#">Subjects</a>
        <ul>
          <li><a href="maths.jsp">Maths</a></li>
          <li><a href="pages/chemistry.jsp">Chemistry</a></li>
          <li><a href="physics.jsp">Physics</a></li>
          <li><a href="bio.jsp">Biology</a></li>
          <li><a href="cs.jsp">ComputerScience</a></li>
        </ul>
      </li>
      <li><a href="otherfaculty.jsp">Other Faculty</a></li>
      <li><a href="solve.jsp">Solved Questions</a></li>
      <li><a href="tchprofile.jsp">Profile</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>


<% } %>
              
  <div>
                        <form action="teacherprofiledb" method="post" id="f1">
                            <table style="text-align: center ; color:black ; background-color: white">
                     
                                 
                           <tr><td>Education :</td> <td>  <input type="text" placeholder="Education" name="Education" id="Education" height="20px" size="60px"></td></tr>
                           <tr><td>Mobile :</td> <td>  <input type="text" placeholder="mobilenumber" id="Phone_number" name="Phone_number" size="60px"></td></tr>
                           <tr><td>Password:</td> <td>  <input type="password" placeholder="Password" id="Password" name="Password" size="60px"></td></tr>
                            <tr><td>Remarks:</td> <td>  <input type="textbox" placeholder="Remarks" id="Remarks" name="Remarks" size="60px" style="height: 100px"></td></tr>
                           <tr><td>Subject:</td> <td>  <select name="subjects" >
                    
                        <option>Maths</option>
                            <option>Chemistry</option>
                            <option>Physics</option>
                            <option>Bio</option>
                            <option>Computer Science</option>
                            
                                   </select></td><td>You Can select Only One Subject</td></tr>
                          
                           
                           <tr><td></td>
                           
               <td><input type="submit" value="Update"></td>
                           </tr>
                            </table>
                            
                        </form>
                    </div>
                  






<div class="wrapper bgded overlay" style="background-image:url('dp/bgimage.jpg');">
  <section class="hoc container clear"> 
    <!-- ################################################################################################ -->
    <div class="sectiontitle">
      <h6 class="heading">The DEVELOPERS</h6>
    </div>
    <div class="group team">
      <figure class="one_quarter first"><a href="#"><img src="dp/ruru.jpg" alt=""></a>
        <figcaption>
          <h6 class="heading">Puru Arora</h6>
          <em>Core developer</em>
          
        </figcaption>
      </figure>
        <figure class="one_quarter first"><a href="#"><img src="dp/nishu.jpg" alt=""></a>
        <figcaption>
          <h6 class="heading">Nishima</h6>
          <em>core and backend</em>
          
        </figcaption>
      </figure>
      <figure class="one_quarter"><a href="#"><img src="dp/simu.jpg" alt=""></a>
        <figcaption>
          <h6 class="heading">Simran</h6>
          <em>Backend</em>
          
        </figcaption>
      </figure>
      <figure class="one_quarter"><a href="#"><img src="dp/shreya.jpg" alt=""></a>
        <figcaption>
          <h6 class="heading">Shreya</h6>
          <em>Front and core</em>
          
        </figcaption>
      </figure>
      <figure class="one_quarter"><a href="#"><img src="dp/rupali.jpg" alt=""></a>
        <figcaption>
          <h6 class="heading">Roopali</h6>
          <em>Front End</em>
          
        </figcaption>
      </figure>
    </div>
    <!-- ################################################################################################ -->
    <div class="clear"></div>
  </section>
</div>
<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->
 
<!-- JAVASCRIPTS --> 
<script src="layout/scripts/jquery.min.js"></script>
<script src="layout/scripts/jquery.backtotop.js"></script>
<script src="layout/scripts/jquery.mobilemenu.js"></script>
</body>
</html>