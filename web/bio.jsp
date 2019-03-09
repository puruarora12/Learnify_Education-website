<%@page import="java.sql.ResultSet"%>
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
    <%  /*  if(((String)session.getAttribute("email"))==null){
                                           response.sendRedirect("beforelogin.html");
                                       }*/%>
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
    int count = 0;
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
          <li><a href="chemistry.jsp">Chemistry</a></li>
          <li><a href="physics.jsp">Physics</a></li>
          <li><a href="bio.jsp">Biology</a></li>
          <li><a href="cs.jsp">ComputerScience</a></li>
        </ul>
      </li>
      <li><a href="faculty.jsp">Faculty</a></li>
      <li><a href="ask.jsp">Asked Questions</a></li>
      <li><a href="stuprofile.jsp">Profile</a></li>
      <li><a href="aboutus.html">About Us</a></li>
      <li><a href="beforelogin.html">Logout</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>
<% }else{  count=1; %>

<div class="wrapper row2">
  <nav id="mainav" class="hoc clear"> 
    <!-- ################################################################################################ -->
    <ul class="clear">
      <li class="active"><a href="welcometeacher.jsp">Home</a></li>
      <li><a class="drop" href="#">Subjects</a>
        <ul>
          <li><a href="maths.jsp">Maths</a></li>
          <li><a href="chemistry.jsp">Chemistry</a></li>
          <li><a href="physics.jsp">Physics</a></li>
          <li><a href="bio.jsp">Biology</a></li>
          <li><a href="cs.jsp">ComputerScience</a></li>
        </ul>
      </li>
      <li><a href="otherfaculty.jsp">Other Faculty</a></li>
      <li><a href="solve.jsp">Solved Questions</a></li>
      <li><a href="tchprofile.jsp">Profile</a></li>
      <li><a href="aboutus.html">About Us</a></li>
      <li><a href="beforelogin.html">Logout</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>





<% } %>
 <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
  <!-- ################################################################################################ --> 
 <div style="color:black; align-content: left ; background-color:whitesmoke" >
    <form action="askquestion.jsp" method="post" name="askquestion">
        <input type="submit" value="Ask a question" size="25px" style="height: 30px"> 
    </form>
</div>
  <div style="background-color: white">
    <% 
 
          /// String h=request.getParameter("subject");
           String h="Bio";
                String query = "select * from questionset where Topic='"+h+"' order by Rating DESC ";
                        ResultSet rs1 = new db.global().execute(query);
               int i= 1; %>
               <form action="ansquestion.jsp" method="post" name="ans">
                <table style="color:black">
                 
                <%
                    if(!rs1.next()){ %>
                    <h2>
                    <%
                     out.print("NO Questions Available for This Topic at This Moment");
                   %> </h2>
                    <% }else{
                do{
                    
                if(i==0){
                    %>
                   <tr><%
                    }
%>  
                                                
<td>Questions : </td><td><h2>
                                <%// out.print("Question :");
                                    out.print(rs1.getString("Question"));%>
    </h2></td>  </tr>
                    <tr><td>Answer :</td> <h3>   <td><% String query1="select * from answerset where QuesID='"+ rs1.getString("QuesID")+"' order by Rating DESC ";
                                 ResultSet rs2 = new db.global().execute(query1);
                                 int flag=0;
                                if(rs2.next())
                                {%>
                                <% if(rs2.getString("Answer")!=null ){
                                     out.print(rs2.getString("Answer"));
                                     flag=1;
                                }
                                //if(rs2.getString("Answer")==null || rs2.getString("Answer").equals(""))
                                else{
                                out.print("Question Not Answered yet!");
                                flag=2 ;
                                        }%>
                                <%}else{
                                out.print("Question Not Answered yet!");
                                flag=2 ;
                                        }
                    %></td></h3>
                
                <% 
                if(flag==2 && count==1 )
                {
                    %>
                    <td><input type="submit" value="Answer"></td>
                    <%
                }
                %>
                    <input type="hidden" name="id" value="<%= rs1.getInt("QuesID") %>"
                </tr>
                    
                    <tr><td></td><td><a href=seeans.jsp?questionid=<%= (rs1.getInt("QuesID"))%>>See More</a></td></tr>
                                              
                                          
                                            
                   <% }while(rs1.next()) ; } %>
               
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