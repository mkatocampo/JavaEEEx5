<%-- 
    Document   : personForm
    Created on : Feb 8, 2022
    Author     : Maria Ocampo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/declarativemethods.jspf" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Index</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>
        <%
        	setupPerson();
           	
      		//initialize an instance of Person
        	Person nPerson = null;
           	
        	//get properties for existing person
           	if (request.getParameter("id")!=null && isNumeric(request.getParameter("id"))){
           		int id=getIntegerValue(request.getParameter("id"));
           		nPerson=person.getPerson(id);
           	}
        %>
    </head>
    <body>
        <h1>Post Details</h1>
        <%@include file="WEB-INF/jspf/navigation.jspf" %>

		<!-- Display details for person -->
        <table class="table">               
            <tr>                    
                <td>Person Id</td>
                <td><%=nPerson.getId() %></td>
            </tr>
            <tr>                    
                <td>Person First Name</td>
                <td><%=nPerson.getFirstName() %></td>
            </tr>
            <tr>                    
                <td>Person Last Name</td>
                <td><%=nPerson.getLastName() %></td>
            </tr> 
            <tr>                    
                <td>Person Email Address </td>
                <td><%=nPerson.getEmailAddress() %></td>
            </tr> 
            <tr>                    
                <td>Person Salary</td>
                <td><%=nPerson.getSalary() %></td>
            </tr>  
        </table>
             
        <a href="<%=response.encodeUrl("personForm.jsp")%>?id=<%=nPerson.getId() %>">Modify</a>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>    
</html>
