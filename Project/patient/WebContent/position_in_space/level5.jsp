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
		<title>PSI Level5</title>
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
	height:30%;
	margin: 5px;
			}
			.iv {
    display: inline-block;
	width:45%;
	height:30%;
	margin: 5px;
			}
		</style>
	</head>
	<body onload="startTime();">
	<%
	Connection con=null;				  
	if(request.getParameter("lvl4pis")!=null){
		Long id=(Long)request.getSession().getAttribute("patient_id");
		String q1=request.getParameter("pis11");
		String q2="";
		String pis21[]=request.getParameterValues("pis21");
		for(int i=0;i<pis21.length;i++)
			q2=q2+pis21[i]+" ";
		String q3=request.getParameter("pis31");
		String timer=request.getParameter("timer");
		String q1t=request.getParameter("q1times");
		String q2t=request.getParameter("q2times");
		String q3t=request.getParameter("q3times");
		try{
			con=dbcon.getCon();
		PreparedStatement p=con.prepareStatement("insert into level4 (patient_id,category,q1,q1time,q2,q2time,q3,q3time,timetaken)value(?,?,?,?,?,?,?,?,?)");
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
		response.sendRedirect("level5.jsp");
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
					<!-- LEVEL 5 STARTS-->
						<h3 class="labelno">Level 5</h3>
				<form action="/patient/final.jsp" method="POST">
				<div id="q1" style="display:none" > 
						<b>1.	ARRANGE THE PUZZLES </b>
						<div>
						 <div class="images">
						  <img src="images/pisL418.png" />
						  <br>
						  <span style="font-size:25px">B</span>
						</div>
						<div class="images">
						  <img src="images/pisL419.png" />
						  <br>
						  <span style="font-size:25px">C</span>
						</div>
						<div class="images">
						  <img src="images/pisL420.png" />
						  <br>
						  <span style="font-size:25px">A</span>
						</div></div>
						<div class="iv"><img src="images/pisL421.png" /></div>
						<div class="iv" style="width:30%"><img src="images/pisL422.png" /><br>THE ARRANGED PUZZLE</div>
						<br><br>
						<label><input type="radio" name="pis11" value="a"/><strong> &nbsp &nbsp A) ['A','B','C']</strong></label><br><br>
						<label><input type="radio" name="pis11" value="b"/><strong> &nbsp &nbsp B) ['B','C','A']</strong></label><br><br>
						<label><input type="radio" name="pis11" value="c"/><strong> &nbsp &nbsp C) ['B','A','C']</strong></label><br><br>
						<input type="hidden" id="q1time" name="q1times" />
						&nbsp &nbsp <h1  style="margin-left:80%" class="btn btn-primary" onclick="qstopTimer(); question2();">Next Question</h1>
						<br>
						</div>
						<div id="q2" style="display:none" > 
						<b>2.	ARRANGE THE PUZZLES </b>
						<div>
						 <div class="images">
						  <img src="images/pisL423.png" />
						  <br>
						  <span style="font-size:25px">B</span>
						</div>
						<div class="images">
						  <img src="images/pisL424.png" />
						  <br>
						  <span style="font-size:25px">C</span>
						</div>
						<div class="images">
						  <img src="images/pisL425.png" style="height:90px"/>
						  <br>
						  <span style="font-size:25px">A</span>
						</div></div>
						<br>
						
						<div class="iv"><img src="images/pisL426.png" style="height:30%" /></div>
						<div class="iv" style="width:30%"><img src="images/pisL427.png" /><br>THE ARRANGED PUZZLE</div>
						<br><br>
						<label><input type="radio" name="pis21" value="a"/><strong> &nbsp &nbsp A) ['A','B','C']</strong></label><br><br>
						<label><input type="radio" name="pis21" value="b"/><strong> &nbsp &nbsp B) ['B','C','A']</strong></label><br><br>
						<label><input type="radio" name="pis21" value="c"/><strong> &nbsp &nbsp C) ['A','C','B']</strong></label><br><br>
												<input type="hidden" id="q2time" name="q2times" />
						 <h1 class="btn btn-primary" onclick="qstopTimer2(); question3();" style="margin-left:80%">Next Question</h1>
									<br>
						</div>
						<div id="q3" style="display:none" > 
						<b>3.	ARRANGE THE PUZZLES </b>
						<div>
						 <div class="images">
						  <img src="images/pisL428.png" />
						  <br>
						  <span style="font-size:25px">B</span>
						</div>
						<div class="images">
						  <img src="images/pisL429.png" style="height:90px" />
						  <br>
						  <span style="font-size:25px">C</span>
						</div>
						<div class="images">
						  <img src="images/pisL430.png" />
						  <br>
						  <span style="font-size:25px">A</span>
						</div></div>
						<br>
						
						<div class="ipm"><img src="images/pisL431.png" /></div>
						
						<br>
						
						<br>
						<label><input type="radio" name="pis31" value="a"/><strong> &nbsp &nbsp A) ['A','B','C']</strong></label><br><br>
						<label><input type="radio" name="pis31" value="b"/><strong> &nbsp &nbsp B) ['B','C','A']</strong></label><br><br>
						<label><input type="radio" name="pis31" value="c"/><strong> &nbsp &nbsp C) ['A','C','B']</strong></label><br><br>
						<input type="hidden" id="q3time" name="q3times" />
						 <input type="hidden" name="timer" id="times"/>
						 <button type="submit" name="lvl5pis" onclick=" qstopTimer3(); stopTimer();" style="margin-left:80%" class="btn btn-primary">Next</button><br><br>
						</form>	</div>
 						</div>						<!-- LEVEL 1 ENDS-->
					  
				</div>			
			
			<div class="col-sm-3" id="rightbar2" style="width:20%">
			<br><br>
			<div id="rightbar"></div>
			
			

		</div></div>
		
	</body>
</html>