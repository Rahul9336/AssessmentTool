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
		<title>PIS Level2</title>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
			  visibility: hidd; /* Makes input not-clickable */
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
						  <%
					  Connection con=null;
	if(request.getParameter("lvl1pis")!=null){
		Long id=(Long)request.getSession().getAttribute("patient_id");
		String q1="";
		String pisL11[]=request.getParameterValues("pisL11");
		for(int i=0;i<pisL11.length;i++)
			q1=q1+pisL11[i]+" ";
		String q2=request.getParameter("pisL12");
		String q3=request.getParameter("pisL13");
		String timer=request.getParameter("timer");
		String q1t=request.getParameter("q1times");
		String q2t=request.getParameter("q2times");
		String q3t=request.getParameter("q3times");
		try{
			con=dbcon.getCon();
		PreparedStatement p=con.prepareStatement("insert into level1 (patient_id,category,q1,q1time,q2,q2time,q3,q3time,timetaken)value(?,?,?,?,?,?,?,?,?)");
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
		response.sendRedirect("level2.jsp");
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
<br><br>					<div class="2 21 level">																						<!-- LEVEL 2 STARTS-->
						 <h3 class="labelno">Level 2</h3>
						 <form action="level3.jsp" method="POST">
						<p>  TAP THE CORRECT STATEMENT </p><br>
						<div id="q1" style="display:none" > 
						<p>1.WHERE ARE YOU SITTING</p>
						<label>
						<input type="radio" name="pisL21" value="a" /> &nbsp &nbsp <b>A) IN FRONT OF THE COMPUTER</b></label> <br>
						<label>
						<input type="radio" name="pisL21" value="b" /> &nbsp &nbsp <b>B) AT THE BACKSIDE OF THE COMPUTER </b></label> <br>
						<label>
						<input type="radio" name="pisL21" value="c" /> &nbsp &nbsp <b>C) AT THE SIDE OF THE COMPUTER</b>
						</label><br><br>
						<input type="hidden" id="q1time" name="q1times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer(); question2();">Next Question</h1>
												</div>
						<div id="q2" style="display:none" > 
						<p>2.WHERE ARE YOU SITTING</p>
						<label>
						<input type="radio" name="pisL22" value="a" /> &nbsp &nbsp <b>A) ON THE SIDE OF THE  CHAIR</b></label> <br>
						<label>
						<input type="radio" name="pisL22" value="b" /> &nbsp &nbsp <b>B) ON THE CHAIR </b></label> <br>
						<label>
						<input type="radio" name="pisL22" value="c" /> &nbsp &nbsp <b>C)  UNDER THE CHAIR</b>
						</label><br><br>
						<input type="hidden" id="q2time" name="q2times" />
						&nbsp &nbsp <h1 class="btn btn-primary" onclick="qstopTimer2(); question3();">Next Question</h1>
												</div>
						<div id="q3" style="display:none" > 
						<p>3.WHERE IS THE COMPUTER </p>
						<label>
						<input type="radio" name="pisL23" value="a" /> &nbsp &nbsp <b>A) IN FRONT OF YOU , ON THE TABLE </b></label> <br>
						<label>
						<input type="radio" name="pisL23" value="b" /> &nbsp &nbsp <b>B)  IN FRONT OF YOU, UNDER THE TABLE </b></label> <br>
						<label>
						<input type="radio" name="pisL23" value="c" /> &nbsp &nbsp <b>C)  ON THE CHAIR, FACING YOUR BACK </b>
						</label><br><br>
						
					
								<input type="hidden" id="q3time" name="q3times" />					<!-- LEVEL 2 ENDS-->
								<input type="hidden" name="timer" id="times"/>
						 <button type="submit" name="lvl1pis" onclick=" qstopTimer3(); stopTimer();" class="btn btn-primary">Next</button><br><br></div>
						</form></div>	
												</div>						<!-- LEVEL 1 ENDS-->
					  
							
			
			<div class="col-sm-3" id="rightbar2" style="width:20%">
			<br><br>
			<div id="rightbar"></div>
			
			
			
		</div></div>
		
	</body>
</html>