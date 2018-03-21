<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="patientconfig.*"%>
	<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="scripts.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="styles/signup.css" >
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<title>Sign Up</title>
</head>
<body>
<%@include file="header.jsp" %>
<div class="container" id="main">
<br><br>
<div class="row">
<div class="col-sm-3"></div>
<div class="col-sm-8 bgc" >
<br>
<div id="brd">
<%
Connection con=null;
if(request.getParameter("submit")!=null){
String name=request.getParameter("firstname")+" "+request.getParameter("lastname");
String email=request.getParameter("nothing");
String pass=request.getParameter("mypass");
if((email==null&&pass==null)==false){
try{
con=dbcon.getCon();
PreparedStatement p=con.prepareStatement("insert into examiner (examiner_name,examiner_email,examiner_pass,status)value(?,?,?,?)");
p.setString(1, name);
p.setString(2, email);
p.setString(3, pass);
p.setString(4, "activated");
p.executeUpdate();
out.println("Sign Up successfully");
}
catch(Exception e){%>
<p style="color:w3-red">Something went wrong</p>
<%
e.printStackTrace();
}
}else{%>
<p style="color:w3-red">Email and Password Requirement Does not match</p>
<%
}
}
%>
<h3><span style="color:green;font-weight:bold">Registration</span></h3>
<form action="signup.jsp" method="POST" onsubmit="return checkEmail()">
<div class="row">
<div class="col-sm-6"><label for="fname">First name<span style="color:red">*</span></label> &nbsp <input id="fname" type="text" name="firstname" placeholder="first name.." /></div>
<div class="col-sm-6"><label for="lname">Last name<span style="color:red">*</span></label> &nbsp <input id="lname" type="text" name="lastname" placeholder="last name.." /></div>
</div>
<label for="uemails">Your email<span style="color:red">*</span></label> &nbsp
<input id="uemails" type="text" name="nothing" placeholder="rahul@something.com" />
<div class="row">
<div class="col-sm-9">
<label for="upass">Password<span style="color:red">*</span></label>
</div>
<div class="col-sm-3"><p class="w3-tooltip"><em style="color:orange">Instruction:</em><span style="position:absolute;left:0;bottom:18px" class="w3-text w3-tag w3-green  w3-round-xlarge"><strong style="font-weight:bold;">.</strong>Your Password must have minimum 8 characters.<br><strong style="font-weight:bold;">.</strong>Your Password must contain at least one number, one uppercase, lowercase & special character.</span></p>
</div>
</div>
<input id="upass" type="password"  onkeyup="CheckPasswordStrength(this.value)" placeholder="********" /><span id="userpass"></span>
<br>
<div class="row">
<div class="col-sm-3"><center><a href="#"><h3 class="btn btn-primary">Sign In</h3></a></center></div>
<div class="col-sm-6"><center><button type="submit" name="submit"class="btn btn-success">Submit</button></center></div>
<div class="col-sm-3"></div>
</div>
<input id="upassword" type="hidden" name="mypass" />
<input id="emailid" type="hidden" name="myemail" />
</form>
</div>
<br>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<br><br>
<%@include file="../footer.jsp" %>
</body>
</html>