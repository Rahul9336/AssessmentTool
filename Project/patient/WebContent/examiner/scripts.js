    function CheckPasswordStrength(password) {
        var password_strength = document.getElementById("userpass");
        if (password.length == 0) {
            password_strength.innerHTML = "";
            return;
        }
        var regex = new Array();
        regex.push("[A-Z]"); //Uppercase Alphabet.
        regex.push("[a-z]"); //Lowercase Alphabet.
        regex.push("[0-9]"); //Digit.
        regex.push("[$@$!%*#?&]"); //Special Character.
 
        var passed = 0;
 
        //Validate for each Regular Expression.
        for (var i = 0; i < regex.length; i++) {
            if (new RegExp(regex[i]).test(password)) {
                passed++;
            }
        }
 
        //Validate for length of Password.
        if (passed > 2 && password.length > 8) {
            passed++;
        }
 
        //Display status.
        var color = "";
        var strength = "";
        switch (passed) {
            case 0:
            case 1:
                strength = "<div class='w3-light-grey w3-round-xlarge'><div class='w3-red w3-round-xlarge w3-center' style='height:24px;width:25%'>Very Weak</div></div><br>";
                break;
            case 2:
                strength = "<div class='w3-light-grey w3-round-xlarge'><div class='w3-orange w3-round-xlarge w3-center' style='height:24px;width:50%'>Weak</div></div><br>";
                break;
            case 3:
            case 4:
                strength = strength = "<div class='w3-light-grey w3-round-xlarge'><div class='w3-blue w3-round-xlarge w3-center' style='height:24px;width:75%'>Strong</div></div><br>";
                document.getElementById("upassword").value=password;
                break;
            case 5:
                strength = "<div class='w3-light-grey w3-round-xlarge'><div class='w3-green w3-round-xlarge w3-center' style='height:24px;width:100%'>Very Strong</div></div><br>"
                document.getElementById("upassword").value=password;
                	break;
        }
        password_strength.innerHTML = strength;
        password_strength.style.color = color;
    }
    
    function checkEmail() {
//    	var checked=document.getElementById(emailed).value;
    	  var result=true;
    	    var e=document.getElementsByName("nothing")[0].value;
    	    var atindex=e.indexOf("@");
    	    var dotindex=e.lastIndexOf(".");
    	    if(atindex<1||dotindex>=e.length-2||dotindex-atindex<3)
    	    {
    	    return false;
    	    }else{
    	    	document.getElementById("emailid").value=e;
    	    	return true;
    	    }
    	    
        }