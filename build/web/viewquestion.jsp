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
        <li><a href="welcomestudent"><i class="fa fa-lg fa-home"><%=(String)session.getAttribute("email") %></i></a></li>
        
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
      <li><a href="otherfaculty.jsp"> Faculty</a></li>
      <li><a href="solve.jsp">Solved Questions</a></li>
      <li><a href="tchprofile.jsp">Profile</a></li>
      <li><a href="aboutus.jsp">About Us</a></li>
      <li><a href="logout">Logout</a></li>
    </ul>
    <!-- ################################################################################################ --> 
  </nav>
</div>

<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->

<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->

<!-- ################################################################################################ --> 
<!-- ################################################################################################ --> 
<!-- ################################################################################################ -->

<div style="background-color:white">
   
    <%
        int id = Integer.parseInt(request.getParameter("id"));
    //out.print(id);
        String qry = "select * from questionset where QuesID="+id+" ;";
       ResultSet rs = new db.global().execute(qry);
    
    rs.next();
    %>
    <table style="color: black">
        <tr>
            <td width="20%">
                Question Tittle : 
            </td>
            <td>
                <%= rs.getString("Question") %>
            </td>
        </tr>
        <tr>
            <td width="20%">
                Question Description :
            </td>
            <td>
                <%= rs.getString("QuestionDesc") %>
            </td>
            
        </tr>
        <tr>
        <td>
            Topic
        </td>
        <td>
            <%=rs.getString("topic") %>
        </td>
    </tr>
        <tr>
        <td>
           No Answers yet!!  
        </td>
        </tr>
    </table>
        
    
    
    
    <!----------------------------------------------------------------------------------------
    
    
    -->
    <% 

               String topic =rs.getString("topic") ;
   String qq ="select * from teacher where subject ='"+topic+"' ;" ;
   //out.print(qq);
   ResultSet ra = new db.global().execute(qq);
//while(ra.next()){
int f =0 ;
               int i= 1; %>
                <table style="align-content: center ; color:black ;">
                <%
                while(ra.next()){
                f=1 ;
                    if(i==0){
                %><tr><%
                    }
%>  <td>
                                                
                                                
                                                <br><% 
                                 if((ra.getString("Name"))==null){
                                     out.print(("NO teachers with Expertise in this field availabe at this time. "));
                                 }  else{
                                    %> <a href=viewprofile.jsp?id="<%=ra.getString("Name")%>"> <%
                                        %><h2><% out.println(ra.getString("Name")); %></h2></a><%
                                            out.println(ra.getString("remarks"));%> <br> <% 
                                            out.println(ra.getString("Education"));%> <br> <% 
                                            %>
                                            <a href=chat.jsp?email="<%=ra.getString("Email_id") %>" style="font-size: 17px">Chat Here</a>
                                            <%
                                 }%>
                                              
                                            <br> 
                                            <br> 
                                            </td>
                   
                <%  i++;
                    if(i==5){ 
                %>
                </tr>
                <% i=0 ;  } 

}
if(f==0){
 out.print(("NO teachers with Expertise in this field availabe at this time. "));
}
                    %>
                </table>
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