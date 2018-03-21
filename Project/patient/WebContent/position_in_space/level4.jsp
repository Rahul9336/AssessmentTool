<%
	session=request.getSession(false);
	String check= (String)session.getAttribute("patient_name"); 
	if(check==null){
		response.sendRedirect("/patient/index.jsp");
	}
	%>
	<%@page import="patientconfig.*"%>
	<%@ page import = "java.io.*,java.util.*,java.sql.*"%>
	<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
	<head>
		<title>PSI Level4</title>
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
			   /* Makes input not-clickable */
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
				width:15%;
				height:15%;
			}
			.labelno{
				border:2px solid black;
				
			}
			.images {
    display: inline-block;
	width:45%;
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
	<body onload="startTime();">
	 <%
					  Connection con=null;
	if(request.getParameter("lvl3pis")!=null){
		Long id=(Long)request.getSession().getAttribute("patient_id");
		String q1=request.getParameter("pisL31");
		String q2=request.getParameter("pisL32");
		String q3=request.getParameter("pisL33");
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
		p.executeUpdate();
		}
		catch(Exception e){
			e.printStackTrace();
		}
		    }
 %>
		<div class="row">
			<div class="col-sm-3" style="width:20%">
<%@include file="../sbcategory.jsp" %>
			</div>
			<div class="col-sm-6" style="width:60%">
					<div class="1 level"> 
					<!-- LEVEL 4 STARTS-->
						<h3 class="labelno">LEVEL   4</h3>
				<form action="level5.jsp" method="POST">
				<div id="q1" style="display:none" > 
				<br><br>
						<b>1.	IDENTIFY THE PIECE OF THE PUZZLE AND WHERE TO PUT IT ?</b>
						<br>
						  <img src="images/pisL41.png" style="width:25%;height:25%" />
						<br>
						<label>
						  <input type="radio" name="pis11" value="a" />
						  A)<img src="images/pisL42.png" width="50%" height="30%"/>IN THE CENTER OF THE IMAGE 
						</label>
						<br>
						<label>
						  <input type="radio" name="pis11" value="b" />
						 B )<img src="images/pisL43.png" width="50%" height="30%"/>AT THE LEFT SIDE OF THE IMAGE  
						</label>
						<br>
						<label>
						  <input type="radio" name="pis11" value="c" />
						  C)<img src="images/pisL44.png" width="50%" height="30%"/>ON THE TOP , IN THE CENTER 
						</label>
						<br>
						<input type="hidden" id="q1time" name="q1times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer(); question2();">Next Question</h1>
												<br>
						</div>
						<div id="q2" style="display:none" > 
						<b>2.	IDENTIFY THE PARTS AND ARRANGE THEM CORRECTLY </b>
						 <div class="images">
						  <img src="images/pisL45.png" style="width:30%;height:50%" />
						  <br>
						</div>
						<div class="images">
						  <img src="images/pisL46.png" style="width:30%;height:50%" />
						  <br>
						</div>
						<div class="images">
						<label>
						  <input type="checkbox" name="pis21" value="a" />
						  A)<img src="images/pisL47.png" width="10%" height="30%"/> AT THE LEFT SIDE OF THE IMAGE
						</label>
						</div>
						<div class="images">
						<label>
						  <input type="checkbox" name="pis21" value="b" /><p></p>
						  B)<img src="images/pisL48.png" width="10%" height="30%"/> IN THE CENTER OF THE IMAGE  
						</label>
						
						</div>
						<div class="images">
						<label>
						  <input type="checkbox" name="pis21" value="c" />
						  C)<img src="images/pisL49.png" width="10%" height="30%"/>ON THE TOP,IN THE CENTER 
						</label>
						</div>
						<div class="images">
						<label>
						  <input type="checkbox" name="pis21" value="d" />
						  D)<img src="images/pisL410.png" />AT THE LEFT SIDE OF THE IMAGE 
						</label></div>
						<div class="images">
						<label>
						  <input type="checkbox" name="pis21" value="e" />
						 E )<img src="images/pisL49.png" width="10%" height="30%"/>AT THE RIGHT SIDE OF THE IMAGE  
						</label>
						</div>
						<div class="images">
						<label>
						  <input type="checkbox" name="pis21" value="f" />
						  F)<img src="images/pisL412.png" width="10%" height="30%"/>ON THE TOP,IN THE CENTER 
						</label>
						</div>
						
						<input type="hidden" id="q2time" name="q2times" />
						 <h1 class="btn btn-primary" onclick="qstopTimer2(); question3();" style="margin-left:80%">Next Question</h1>
									<br>			<br></div>
						<div id="q3" style="display:none" > 
						<b>3.	IDENTIFY THE PARTS  </b>
						<br>
						 <div class="images">
						  <img src="images/pisL413.png" style="width:30%;height:50%" />
						  <br>
						</div>
						<div class="images">
						  <img src="images/pisL414.png" style="width:30%;height:50%" />
						  <br>
						</div>
						<br><br><br>
						<label>
						  <input type="radio" name="pis31" value="a" />
						  1.	IT IS THE PART OF RIGHT LEG<img src="images/pisL415.png" width="50%" height="30%"/> 
						</label>
						<br>
						<label>
						  <input type="radio" name="pis31" value="b" />
						 2.	IT IS PART OF LEFT LEG<img src="images/pisL416.png" width="50%" height="30%"/> 
						</label>
						<br>
						<label>
						  <input type="radio" name="pis31" value="c" />
						 3.	IT  IS PART OF HEAD<img src="images/pisL417.png" width="50%" height="30%"/> 
						</label>
						<input type="hidden" id="q3time" name="q3times" />					
								<input type="hidden" name="timer" id="times"/>
						 <button type="submit" name="lvl4pis" onclick=" qstopTimer3(); stopTimer();" class="btn btn-primary">Next</button><br><br>
						
						</form>	</div>
						</div>						<!-- LEVEL 4 ENDS-->
					  </div>
						
			
			<div class="col-sm-3" id="rightbar2" style="width:20%">
			<br><br>
			<div id="rightbar"></div>
			
			

		</div></div>
		
	</body>
</html>