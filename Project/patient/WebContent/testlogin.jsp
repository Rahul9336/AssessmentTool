<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@include file="dbconnect.jsp" %>
<%@page import="patientdaoimpl.*"%>
<%@page import="patientdto.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>Start Test</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 <meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script src="${js}/intial.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="../styles/styles.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
			</head>
			<style>

#footer{
            width: 100%;
            bottom: 0px;
position: relative;}</style>
	<body>
	<div><%@include file="header.jsp" %></div><br>
	<div style="width:40%; padding:25px; margin:auto;"><br><br><br>
	<h1 style="color:blue;"><b>Test Login</b></h1><br>
		<form action="/patient/testlogin.jsp" method="post">
			<%
	if(request.getParameter("start")!=null){
		String g=request.getParameter("patient_id");
		if(g.isEmpty()==false){
		Long id= Long.parseLong(g);
		 Patient patient= Registerimpl.getdetail(id);
// 		 patient.setPatient_assessmentdate(request.getParameter("patient_assessmentdate")); 
		    if(patient.getStatus().equalsIgnoreCase("activated")){
		    	request.getSession().setAttribute("patient", patient);
		    	request.getSession().setAttribute("patient_id", g);
		    	session.setAttribute("patient_name", patient.getPatient_name());
		    	session.setAttribute("patient_id", patient.getPatient_id());
		    	response.sendRedirect("starttest.jsp");
		    }else{%>
		    <p class="w3-red"><% out.println("Something Went Wrong"); %></p>
		    <%	
		    }
	}else{%>
	 <p class="w3-red"><% out.println("Something Went Wrong"); %></p>
		    <%	
		}
	} %>
	
	<div class="form-group">
    <label for="id1">Registration No.</label>
    <input type="text" class="form-control" id="id1" name="patient_id">
  </div>
  <div class="form-group">
    <label for="Date of Assessment">Date of Assessment:</label>
    <input type="date" class="form-control" id="ass_date" name="patient_assessmentdate">
  </div>
  <button class="btn btn-primary" type="submit" name="start" > START</button>
  </form>
		</div><br><br><br>
		<div><%@include file="footer.jsp"  %></div>
</body>
</html>