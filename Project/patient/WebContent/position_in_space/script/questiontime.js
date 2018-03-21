
function qstartTime(){
	 qsecTime = 0,
      qminTime = 0,
      qhourTime = 0;
	 timestart=setInterval(function(){
		    var maxSec = 59,
        maxMin = 59,
        maxHour = 59;
if(qsecTime > maxSec){
      qminTime++;
      if(qminTime > maxMin){
        qhourTime++;
        if(qhourTime > maxHour){
          qhourTime = 0;
          qminTime = 0;
          qsecTime = 0;
        }
        qminTime = 0
      }
      qsecTime = 0;
    }
	
qsecTime++;	
	},1000);
}
function qstopTimer() {
	var qnewSec = (qsecTime.toString().length == 1) ? '0' + qsecTime : qsecTime,
            qnewMin = (qminTime.toString().length == 1) ? '0' + qminTime : qminTime,
            qnewHour = (qhourTime.toString().length == 1) ? '0' + qhourTime : qhourTime;
	document.getElementById('q1time').value =qnewHour+':'+qnewMin+':'+qnewSec;
    clearInterval(timestart);
	  qsecTime=0,
	qminTime=0,
	qhourTime=0;
	}
	
	//div Show Hide
	$(function(){
		$("#q1").show();
		qstartTime();
	});
	function question2(){
		$(function(){
		$("#q1").hide();
		$("#q2").show();
		qstartTime();
	});
	}
	function qstopTimer2() {
			var qnewSec = (qsecTime.toString().length == 1) ? '0' + qsecTime : qsecTime,
            qnewMin = (qminTime.toString().length == 1) ? '0' + qminTime : qminTime,
            qnewHour = (qhourTime.toString().length == 1) ? '0' + qhourTime : qhourTime;
	document.getElementById('q2time').value =qnewHour+':'+qnewMin+':'+qnewSec;
    clearInterval(timestart);
	  qsecTime=0,
	qminTime=0,
	qhourTime=0;
	}
	function question3(){
		$(function(){
		$("#q1").hide();
		$("#q2").hide();
		$("#q3").show();
		qstartTime();
	});
	}
	function qstopTimer3() {
			var qnewSec = (qsecTime.toString().length == 1) ? '0' + qsecTime : qsecTime,
            qnewMin = (qminTime.toString().length == 1) ? '0' + qminTime : qminTime,
            qnewHour = (qhourTime.toString().length == 1) ? '0' + qhourTime : qhourTime;
	document.getElementById('q3time').value =qnewHour+':'+qnewMin+':'+qnewSec;
    clearInterval(timestart);
	  qsecTime=0,
	qminTime=0,
	qhourTime=0;
	}