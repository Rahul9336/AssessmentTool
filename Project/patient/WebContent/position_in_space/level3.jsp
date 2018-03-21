<%
/* session=request.getSession(false);
String check= (String)session.getAttribute("patient_name"); 
if(check==null){
	response.sendRedirect("/patient/index.jsp");
} */
	%>
	<%@page import="patientconfig.*"%>
	<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>PIS Level3</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		 <meta name="viewport" content="width=device-width, initial-scale=1">
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

		<script src="script/questiontime.js"></script>
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
		<script>
		
		var timestart=performance.now();
		
		function end(){
		var timeend=performance.now();
		var exetime=timeend-timestart;
		
		}
		
		</script>
		
		<script
			src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js">
		</script>
		<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
		<link rel="stylesheet" href="styles/styles.css">
		<link
			href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
			rel="stylesheet">
		<style>
			label > input{ /* HIDE RADIO */
			  visibility: hidde; /* Makes input not-clickable */
			  position: absolute; /* Remove input from document flow */
			}
			label > input + img{ /* IMAGE STYLES */
			  cursor:pointer;
			  border:2px solid transparent;
			}
			label > input:checked + img{ /* (RADIO CHECKED) IMAGE STYLES */
			  border:2px solid #f00;
			  
			}
			img{
				width:40%;
				height:40%;
			}
			.labelno{
				border:2px solid black;
				
			}
			.images {
    display: inline-block;
	width:30%;
	height:50%;
	margin: 5px;
			} 
			.ipm {
    display: inline-block;
	width:70%;
	height:50%;
	margin: 5px;
			}
		</style>
	</head>
	<body >
						  <%
						  Connection con=null;
	if(request.getParameter("lvl1pis")!=null){
		Long id=(Long)request.getSession().getAttribute("patient_id");
		String q1=request.getParameter("pisL21");
		String q2=request.getParameter("pisL22");
		String q3=request.getParameter("pisL23");
		String timer=request.getParameter("timer");
		String q1t=request.getParameter("q1times");
		String q2t=request.getParameter("q2times");
		String q3t=request.getParameter("q3times");
		try{
			con=dbcon.getCon();
		PreparedStatement p=con.prepareStatement("insert into level2 (patient_id,category,q1,q1time,q2,q2time,q3,q3time,timetaken)value(?,?,?,?,?,?,?,?,?)");
		p.setLong(1, id);
		p.setString(2, "Position in space");
		p.setString(3, q1);
		p.setString(4, q1t);
		p.setString(5, q2);
		p.setString(6, q2t);
		p.setString(7, q3);
		p.setString(8, q3t);
		p.setString(9, timer);
		p.executeUpdate();
		response.sendRedirect("level3.jsp");
		}
		catch(Exception e){
			out.println("Must Choose One Response!");
			e.printStackTrace();
		}
		    }
 %>
		<div class="row">
			<div class="col-sm-3" style="width:20%">
<%@include file="../sbcategory.jsp" %>
			</div>
			<div class="col-sm-6" style="width:60%">
<br><br>					<div class="3 21 level">																						<!-- LEVEL 3 STARTS-->
						<h3 class="labelno">Level 3</h3>
						<form action="level4.jsp" method="POST">
						<p>  TAP THE CORRECT STATEMENT </p><br>
						<div id="q1" style="display:none" > 
						<p>1.WHERE THE BUCKET IS </p>
						<img src="images/pisL31.png" width="50%" height="30%"/><br>
						<label>
						<input type="radio" name="pisL31" value="a" /> &nbsp &nbsp <b>A) THE BUCKET IS ON THE TABLE</b></label> <br>
						<label>
						<input type="radio" name="pisL31" value="b" /> &nbsp &nbsp <b>B) THE BUCKET IS AT THE SIDE OF THE TABLE</b></label> <br>
						<label>
						<input type="radio" name="pisL31" value="c" /> &nbsp &nbsp <b>C) THE BUCKET IS UNDER THE TABLE </b>
						</label><br><br>
						<input type="hidden" id="q1time" name="q1times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer(); question2();">Next Question</h1>
												</div>
						<div id="q2" style="display:none" > 
						<p>2. AT WHICH SIDE THE TOM ( CAT ) IS RUNNING ? </p>
						<img src="images/pisL32.png" width="50%" height="30%"/> <img src="images/pisL33.png" width="50%" height="30%"/><br>
						<label>
						<input type="radio" name="pisL32" value="a" /> &nbsp &nbsp <b>A) TOM IS RUNNING TOWARDS THE LEFT SIDE</b></label> <br>
						<label>
						<input type="radio" name="pisL32" value="b" /> &nbsp &nbsp <b>B) TOM IS RUNNING TOWARDS THE RIGHT SIDE</b></label> <br>
						<label>
						<input type="radio" name="pisL32" value="c" /> &nbsp &nbsp <b>C) TOM IS RUNNING UPWARDS </b>
						</label><br><br>
						<input type="hidden" id="q2time" name="q2times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer2(); question3();">Next Question</h1>
																		</div>
						<div id="q3" style="display:none" > 
						<p>3. WHERE THE JERRY MOUSE IS ? </p>
						<img src="images/pisL34.jpg" width="50%" height="30%"/><br>
						<label>
						<input type="radio" name="pisL33" value="a" /> &nbsp &nbsp <b>A) JERRY MOUSE IS STANDING ON THE PAPER PLANE</b></label> <br>
						<label>
						<input type="radio" name="pisL33" value="b" /> &nbsp &nbsp <b>B) JERRY MOUSE IS SITTING ON THE PAPER PLANE</b></label> <br>
						<label>
						<input type="radio" name="pisL33" value="c" /> &nbsp &nbsp <b>C) JERRY MOUSE IS STANDING ON THE HEAD OF TOM </b>
						</label><br><br>
																											<!-- LEVEL 3 ends-->
						 <input type="hidden" id="q3time" name="q3times" />					
								<input type="hidden" name="timer" id="times"/>
						 <button type="submit" name="lvl3pis" onclick=" qstopTimer3(); stopTimer();" class="btn btn-primary">Next</button><br><br></div>
						</form>	</div>
												<!-- LEVEL 1 ENDS-->
					  
				</div>			
			
			<div class="col-sm-3" id="rightbar2" style="width:20%">
			<br><br>
			<div id="rightbar"></div>
		</div></div>
		
	</body>
</html>