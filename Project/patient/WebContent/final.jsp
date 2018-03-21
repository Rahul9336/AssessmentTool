<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
    <%@page import="patientdaoimpl.*"%>
    <%@page import="patientdto.*"%>
    <%@page import="patientconfig.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="styles/basic.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<title>Submit</title>
</head>
<body>
<%
Long id=(Long)request.getSession().getAttribute("patient_id");
if(id!=0){
Patient patient=Registerimpl.getdetail(id);
request.getSession().setAttribute("patient", patient);
}
%>
<%
		Connection con=null;			  
	if(request.getParameter("lvl5pis")!=null){
		String q1=request.getParameter("pis11");
		String q2=request.getParameter("pis21");
		String q3=request.getParameter("pis31");
		String timer=request.getParameter("timer");
		String q1t=request.getParameter("q1times");
		String q2t=request.getParameter("q2times");
		String q3t=request.getParameter("q3times");
		try{
			con=dbcon.getCon();
		PreparedStatement p=con.prepareStatement("insert into level3 (patient_id,category,q1,q1time,q2,q2time,q3,q3time,timetaken)value(?,?,?,?,?,?,?,?,?)");
		p.setLong(1, id);
		p.setString(2, "Position in space");
		p.setString(3, q1);
		p.setString(4, q1t);
		p.setString(5, q2);
		p.setString(6, q2t);
		p.setString(7, q3);
		p.setString(8, q3t);
		p.setString(9, timer);
		p.executeUpdate();%>
		<center>
		<br><br><br>
		<h3 id="head">Hello Mr. ${patient.patient_name}</h3>
		<br>
		<p id="inst"><center>
		<br>
		<em>INSTRUCTION:</em><br>
		<r1> Your Response Succesfully taken</r1><br>

		<r>1.You May leave.<r><br>
		<r>2.Close the Browser.<r><br>
		<r>3.Click on logout to Start new Session.<r><br>
		<r>Restart Your Test.<br>Only Your Last Response will Taken<r><br><r>Previous Respose will overwrite....<a href="/index.jsp"><span>click here</span></a><r>
		<br></center>
		</p>
			<a href="index.jsp"><button type="submit" name="logout" class="btn btn-danger btn-lg btn3d">Logout</button></a>
		</center>
		<% 
		}
		catch(Exception e){%>
		<center>
<br><br><br>
<h3 id="head">Hello Mr. ${patient.patient_name}</h3>
<br>
<p id="inst">
<br>
<em>INSTRUCTION:</em><br>
<r1> Something Went Wrong</r1><br>
<r>Click on  Restart<r><br>
<r>Restart Your Level 5 Test.<br><r>
<br>
</p>
	<a href="/patient/position_in_space/level5.jsp"><button type="submit" name="logout" class="btn btn-danger btn-lg btn3d">Restart</button></a>
</center>
		<%
			e.printStackTrace();
		}
		    }
	else{
		%>
		<%@include file="header.jsp" %>
		<br><br><br><br><br><br><br><br><br><br><br><br>
		<center><h3 id="head"><br><br>You are Not Login<br><br></h3></center><br><br><br>
		<%
	}
 %>

<br><br>
<f style="position: fixed;
    bottom: 0;left:100px;">
<%@include file="footer.jsp" %></f>
</body>
</html>