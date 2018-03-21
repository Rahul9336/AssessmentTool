    <%@page import="patientdaoimpl.*"%>
    <jsp:useBean id="obj" class="patientdto.Patient"/>

	<jsp:setProperty property="*" name="obj"/>
	    <%
boolean states= Registerimpl.add(obj);
	    
if(states==true){
request.getSession().setAttribute("patient", obj);
session.setAttribute("patient_name", obj.getPatient_name());
session.setAttribute("patient_id", obj.getPatient_id());
response.sendRedirect("starttest.jsp");
}else {
	out.println("Something Went Wrong"+states);
}
%>