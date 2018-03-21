<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
	<%
	session=request.getSession(false);
	String check= (String)session.getAttribute("patient_name"); 
	if(check==null){
		response.sendRedirect("/patient/index.jsp");
	}
	%>
	<%@page import="patientconfig.*"%>
	<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
<html lang="en">
	<head>
		<title>PIS Level1</title>
		
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
		</script>
		<script
			src="script/questiontime.js">
		</script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="styles/styles.css">
		<link
			href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
			rel="stylesheet">
		<script>
					//Stop timer function
function stopTimer() {
    clearInterval(time);
	
	}

//Start timer function
var secTime = 0,
      minTime = 0,
      hourTime = 0;

var time =  setInterval(function(){
    var maxSec = 59,
        maxMin = 59,
        maxHour = 59;
if(secTime > maxSec){
      minTime++;
      if(minTime > maxMin){
        hourTime++;
        if(hourTime > maxHour){
          hourTime = 0;
          minTime = 0;
          secTime = 0;
        }
        minTime = 0
      }
      secTime = 0;
    }    
         var newSec = (secTime.toString().length == 1) ? '0' + secTime : secTime,
            newMin = (minTime.toString().length == 1) ? '0' + minTime : minTime,
            newHour = (hourTime.toString().length == 1) ? '0' + hourTime : hourTime;

        document.getElementById('rightbar').innerHTML = newHour + ':' + newMin + ':' + newSec;
    secTime++;
document.getElementById('times').value =newHour+':'+newMin+':'+newSec;    
}, 1000);
		</script>
		<style>	label > input{ /* HIDE RADIO */
			  visibility: hidden; /* Makes input not-clickable */
			  position: absolute; /* Remove input from document flow */
			}
			label > input + img{ /* IMAGE STYLES */
			  cursor:pointer;
			  border:2px solid transparent;
			}
			label > input:checked + img{ /* (RADIO CHECKED) IMAGE STYLES */
			  border:2px solid #f00;
			  
			}
			.labelno{
				border:2px solid black;	
			}
			.images {
    display: inline-block;
	width:30%;
	height:100px;
	margin: 0px;
	
			} 
		</style>
	</head>
	<body >
		<div class="row">
			<div class="col-sm-3" style="width:20%">
<%@include file="../sbcategory.jsp" %>
			</div>
			<div class="col-sm-6" style="width:60%">
<br>				<div class="1 level">
					<!-- LEVEL 1 STARTS-->
					
						<h3 class="labelno">Level 1</h3>
						
							 <form action="level2.jsp" method="POST" >
						<p>  IDENTIFY   THE   SYMBOL</p>
						<div id="q1" style="display:none" > 				
						<p>Choose Symbol <br>A.	IDENTIFY THE SYMBOL POINTING DOWNWARDS 
							<br>B.	IDENTIFY THE SYMBOL POINTING UPWARDS 
						</p>
						
						<div class="images"><marquee direction = "up" behavior="alternate"><label>
						  <input type="checkbox" name="pisL11" value="up" />
						 <img src="images/up.png" width="70%" height="20%"   />
						</label></marquee></div>
						<div class="images" ><marquee direction = "left" behavior="alternate"><label>
						  <input type="checkbox" name="pisL11" value="left" />
						  <img src="images/left.png"  />
						</label></marquee></div> 
						<div class="images"><marquee direction = "right" behavior="alternate"><label>
						  <input type="checkbox" name="pisL11" value="right" />
						  <img src="images/right.png"  />
						</label></marquee></div>
						<div class="images"><marquee direction = "down" behavior="alternate"><label>
						  <input type="checkbox" name="pisL11" value="down" />
						  <img src="images/down.png" width="80%" height="20%" />
						</label></marquee></div> 
						<input type="hidden" id="q1time" name="q1times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer(); question2();">Next Question</h1>
						</div>
						 <br>
						 <br>
						<div id="q2" style="display:none" >
						<p>2. WHICH SYMBOL IS POINTING TOWARDS THE LEFT SIDE </p>
						<div class="images"><marquee direction = "up" behavior="alternate">
						<label>
						  <input type="radio" name="pisL12" value="up" />
						  <img src="images/up.png" width="70%" height="20%" />
						</label></marquee></div>
						<div class="images"><marquee direction = "down" behavior="alternate">
						<label>
						  <input type="radio" name="pisL12" value="down" />
						  <img src="images/down.png" width="80%" height="20%" />
						</label></marquee></div>
						<div class="images"><marquee direction = "left" behavior="alternate">
						<label>
						  <input type="radio" name="pisL12" value="left" />
						  <img src="images/left.png" />
						</label></marquee></div>
						<div class="images"><marquee direction = "right" behavior="alternate">
						<label>
						  <input type="radio" name="pisL12" value="right" />
						  <img src="images/right.png" />
						</label></marquee></div>
						<input type="hidden" id="q2time" name="q2times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer2(); question3();">Next Question</h1>
						 </div>
						 <div id="q3" style="display:none" >
						 <p>3. WHICH SYMBOL IS POINTING TOWARDS RIGHT </p>
						 <div class="images"><marquee direction = "up" behavior="alternate">
						<label>
						  <input type="radio" name="pisL13" value="up" />
						  <img src="images/up.png" width="70%" height="20%" />
						</label></marquee></div>
						<div class="images"><marquee direction = "down" behavior="alternate">
						<label>
						  <input type="radio" name="pisL13" value="down" />
						  <img src="images/down.png" width="80%" height="20%" />
						</label></marquee></div>
						<div class="images"><marquee direction = "left" behavior="alternate">
						<label>
						  <input type="radio" name="pisL13" value="left" />
						  <img src="images/left.png" />
						</label></marquee></div>
						<div class="images"><marquee direction = "right" behavior="alternate">
						<label>
						  <input type="radio" name="pisL13" value="right" />
						  <img src="images/right.png" />
						</label></marquee></div>
						<input type="hidden" id="q3time" name="q3times" />																					<!-- LEVEL 1 ENDS-->																					<!-- LEVEL 2 ENDS-->
					<input type="hidden" name="timer" id="times"/>
						 <button type="submit" name="lvl1pis" onclick=" qstopTimer3();  stopTimer();" class="btn btn-primary">Next</button><br><br></div>
						
						</form>	
						</div></div>						<!-- LEVEL 1 ENDS-->
						
			
			<div class="col-sm-3"  style="width:20%">
			<br><br>
			<div id="rightbar"></div>	
		</div></div>
		
	</body>
</html>