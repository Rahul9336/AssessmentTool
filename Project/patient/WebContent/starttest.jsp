<% response.setIntHeader("Refresh", 5); %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="patientdaoimpl.*"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>StartTest</title>
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="styles/basic.css">
		<script src="script/questiontime.js"></script>
<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
		</script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="styles/styles.css">
		<link rel="stylesheet" href="styles/button.css">
		<link
			href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
			rel="stylesheet">
			<script defer src="https://use.fontawesome.com/releases/v5.0.6/js/all.js"></script>
			</head>
			<script>
function startTimer(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10)
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            timer = duration;
        }
    }, 1000);
}

window.onload = function () {
    var fiveMinutes = 15,
        display = document.querySelector('#time');
    startTimer(fiveMinutes, display);
};
		</script>
	<body>
	<%
	String check= (String)session.getAttribute("patient_name"); 
	if(check==null){
		response.sendRedirect("index.jsp");
	}
	%>
	<center><h3 id="head">Hello <%out.println(check); %></h3></center>
				<p id="inst">
		<br>
		<em id="read">Read <strong>INSTRUCTION:</strong> Carefully</em><br>
		<r2>1.You Must Answer Every Question. &nbsp Otherwise Your Level Response Will be Not submitt then you need to take re-test.</r2><br>

		<r2>2.There is no Marking Scheme<r2><br>
		<r2>3.Do not Refresh any level until you submit your response.if you refresh then fill your response again.<r2><br>
		<r2>4.You Can't leave examdesk until you finish your test.<r2><br>
		<br>
		</p>
		<div class="jumbotron">
				    <%
				    Long ids= (Long)session.getAttribute("patient_id");
				    boolean status= Registerimpl.status(ids);
										if(status==true){ %>
					<center>
		
					<div class="jumbotron">
					<a href="/patient/position_in_space/level1.jsp"><button type="button" class="btn btn-success btn-lg btn3d"><span class='glyphicon glyphicon-ok'></span>Start Test</button></a>
							</div>
							</center>
							<%
}else{%>
<a href="#"><button type="button" class="btn btn-danger btn-lg btn3d"><span class="glyphicon glyphicon-warning-sign"></span> Wait For Start Test</button></a>
<%	
}
%>
		</div>
		
				  <div class="navbar navbar-default navbar-relative-bottom">
    <div class="container">
      <p class="navbar-text pull-left">© 2018 - Site Built By Mr. Rahul Gupta And Anshul Bansal
           <a href="https://github.com/Rahul9336" target="_blank" ><button class="btn btn-link"><i class="fab fa-github"></i>GitHub</button></a>
		   <a href="#" target="_blank" ><button class="btn btn-link"><i class="fas fa-envelope-open"></i>rahulgupta9336@gmail.com</button></a>
		   <a href="#" target="_blank" ><button class="btn btn-link"><i class="fas fa-envelope-open"></i>anshulbansal41@gmail.com</button></a>
      </p>
	  	   <a href="#" class="navbar-btn btn-danger btn pull-right">
      <span class="glyphicon glyphicon-star"></span>  Subscribe us YouTube</a>
    </div>    
  </div>
		
</body>
</html>