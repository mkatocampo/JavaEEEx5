<%-- 
    Document   : personForm
    Created on : Feb 8, 2022
    Author     : Maria Ocampo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/declarativemethods.jspf" %>
<%@ page import="edu.nbcc.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Course</title>
        <%@include file="WEB-INF/jspf/header.jspf" %>      
    </head>
    
    <body>
         <%@include file="WEB-INF/jspf/navigation.jspf" %>
         
         <%setupPerson();%>
         
        <h1>Course</h1>
        <table class="table table-striped">
            <tr>
             	<th>Person Id</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Email Address</th>    
                <th>Salary</th>           
            </tr>     
            
            <!-- display list of persons and corresponding details -->       
           	<% for (Person p: person.getPeople()){%>
            <tr>
                <td><a href="<%=response.encodeURL("personDetails.jsp")%>?id=<%=p.getId()%>">Click</a></td>
                <td><%=p.getFirstName()%></td>
                <td><%=p.getLastName()%></td>
                <td><%=p.getEmailAddress()%></td>
                <td><%=p.getSalary()%></td>
            </tr>
            <%}%>
                
        </table>
        <%@include file="WEB-INF/jspf/footer.jspf" %>
    </body>
</html>
