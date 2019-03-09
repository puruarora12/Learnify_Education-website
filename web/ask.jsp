<%@page import="org.apache.catalina.tribes.util.Arrays"%>
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
 
  <div style="background-color: white">
    <%
     HttpSession ss=request.getSession();
    // String user=(String)ss.getAttribute("UserId");
    String user="1";
     String s[]=new String[5];
        db.global c=new db.global(); 

       String query = "select Topic from questionset where UserID='"+user+"'";
       String s1="";
       int s2=0;
       int i=0;
       String result[]=new String[5];
       
       
           ResultSet rs1= c.execute(query);
           // s1=rs.toString();
           int x =0;
           while(rs1.next() && x<4){
               result[x]=rs1.getString("topic");
               x++ ;
           }
           String query1="SELECT * FROM questionset where Topic='"+result[i]+"'ORDER BY Rating DESC";
               ResultSet rs2= c.execute(query1) ;
            
            //    System.out.println(r+"11");
            while(i<result.length)
            {
                if(result[i]==null)
                break;
               
                
                if(rs2.next()){
                    System.out.println("code goes here");
                    s1= rs2.getString("Question");
                   s2=rs2.getInt("QuesID");
                    System.out.println(s1);
                
               %> 
               <table style="color:black">
                   <tr>  <td width="30">Questions : </td><td><h2>
                                <%// out.print("Question :");
                                    out.print(s1);%>
    </h2></td>  </tr>
                   
                 
                      
                    <% } %><tr><td>Answer :</td> <h3>   <td><% String query2="select * from answerset where QuesID='"+s2+"' order by Rating DESC ";
                                 ResultSet rs3 = new db.global().execute(query2);
                                 int flag=0;
                                if(rs3.next())
                                {
                                    if(rs3.getString("Answer")!=null ){
                                     out.print(rs3.getString("Answer"));
                                     flag=1;
                                }
                                //if(rs3.getString("Answer")==null || rs3.getString("Answer").equals(""))
                                else{
                                out.print("Question Not Answered yet!");
                                flag=2 ;
                                        }%>
 </td></h3>
                
                
                
                </tr>
                    
                    <tr><td></td><td><a href="seeans.jsp">See More</a></td></tr>
                                              
           
                 </table>                           
                   <% i++; } } %>
               
                
   
       
       
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