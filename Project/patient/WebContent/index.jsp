<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<%@ page import = "javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix = "sql"%>
<%@include file="dbconnect.jsp" %>
<!DOCTYPE html>
<html>
    <head>
	<link rel="stylesheet" href="/styles/bootstrap.min.css" >
<link rel="stylesheet"
	href="styles/bootstrap.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="styles/styles.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
        <title>Patient Registration</title>
    </head>
	<style>
#footer{
            width: 100%;
            bottom: 0px;
position: relative;}</style>
    <body>
 
	
	<div><%@include file="header.jsp" %></div><br>
	<div style="width:40%; padding:25px; margin:auto;position:relative"><br>
	<h1 style="color:blue;"><b>PATIENT DETAILS</b></h1>
		<form action="register.jsp" method="post">
		  <%
    if(request.getParameter("logout")!=null){
    	session.invalidate();%><
    	<p class="w3-red">Logout Successfully</p>
    	<%
    }
    %>
		
	<div class="form-group">
    <label for="id1">Registration No.</label>
    <input type="text" class="form-control" id="id1" name="patient_id">
  </div>
  <div class="form-group">
    <label for="name">Name:</label>
    <input type="text" class="form-control" id="name" name="patient_name">
  </div>
  <div class="form-group">
    <label for="age">Age:</label>
    <input type="number" class="form-control" id="age" name="patient_age">
  </div>
   <div class="form-group">
    <label for="sex">Sex:</label>
    <select class="form-control" id="sex" name="patient_sex">
		<option>Select One</option>
		<option>Male</option>
		<option>Female</option>
		<option>Other</option>
	</select>
  </div>
   <div class="form-group">
    <label for="Date of Assessment">Date of Assessment:</label>
    <input type="date" class="form-control" id="ass_date" name="patient_assessmentdate">
  </div>
   <div class="form-group">
    <label for="diagnosis">Diagnosis:</label>
    <input type="text" class="form-control" id="diagnosis" name="patient_diagnosis">
  </div>
   <div class="form-group">
    <label for="addr">Address:</label>
    <input type="text" class="form-control" id="addr" name="patient_addr">
  </div>
   <div class="form-group">
   <p style="color:red"></p>
    <label for="number">Contact number:</label>
    <input type="number" class="form-control" id="number" name="patient_contact">
  </div>
   <div class="form-group">
    <label for="name">Examiner Name:</label>
    <select class="form-control" id="therapist" name="patient_therapist">
	<sql:query dataSource = "${db}" var = "result">
         SELECT * from examiner where upper(status)='ACTIVATED';
      </sql:query>
<c:forEach var = "row" items = "${result.rows}">
               <option><c:out value = "${row.examiner_name}"/></option>
            
         </c:forEach>
	</select>
  </div>
  <button type="submit" class="btn btn-primary" name="submit" >Submit</button>
</form>
</div>
  <%
    if(request.getParameter("logout")!=null){
    	session.invalidate();
    }
    %>
<div><%@include file="footer.jsp" %></div>
    </body>
</html>