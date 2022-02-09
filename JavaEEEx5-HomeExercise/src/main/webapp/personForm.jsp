<%-- 
    Document   : personForm
    Created on : Feb 8, 2022
    Author     : Maria Ocampo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/declarativemethods.jspf"%>
<%
//initialize an instance of Person
Person nPerson = null;

//initialize properties for class Person
int id = 0;
String firstName = "";
String lastName = "";
String emailAddress = "";
double salary = 0.0;

//String parameter for salary and id
String salaryString = "";
String idString = "";

//set form submission to false
boolean submitted = false;

//create an array for errors
errors = new ArrayList<String>();

setupPerson();

//upon form submission, check if existing person or new person
if (request.getParameter("btnSubmit") != null) {
	if (request.getParameter("id") != null && isNumeric(request.getParameter("id"))) {
		id = getIntegerValue(request.getParameter("id"));
		nPerson = person.getPerson(id);
	} else {
		nPerson = new Person();
	}

	//validate required fields
	idString = checkRequiredField(request.getParameter("id"), "Person Id");
	firstName = checkRequiredField(request.getParameter("firstName"), "First Name");
	lastName = checkRequiredField(request.getParameter("lastName"), "Last Name");
	emailAddress = checkRequiredField(request.getParameter("emailAddress"), "Email Address");
	salaryString = checkRequiredField(request.getParameter("salary"), "Salary");
	salary = !salaryString.equals("") && isNumeric(salaryString, "Salary") ? Integer.parseInt(salaryString) : 0;
	id = getIntegerValue(request.getParameter("id"));

	//set values for 
	nPerson.setId(id);
	nPerson.setFirstName(firstName);
	nPerson.setLastName(lastName);
	nPerson.setEmailAddress(emailAddress);
	nPerson.setSalary(salary);

	//if no errors, form submission is successful
	if (errors.size() == 0)
		submitted = true;
} else {
	//get properties for existing person
	if (request.getParameter("id") != null && isNumeric(request.getParameter("id"))) {
		id = getIntegerValue(request.getParameter("id"));
		nPerson = person.getPerson(id);
	}
}
%>
<!DOCTYPE html>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Person Form</title>
<%@include file="WEB-INF/jspf/header.jspf"%>
</head>
<body>
	<h1>Person Form</h1>
	<%@include file="WEB-INF/jspf/navigation.jspf"%>

	<!-- display form to edit the person details if form is not empty -->
	<%if (!submitted || !errors.isEmpty()) {%>
	<form method="POST">
		<table class="table">
			<%if (nPerson != null) {%>
			<tr>
				<td>Person Id</td>
				<td><input type="hidden" name="id"
					value='<%=!submitted && nPerson != null ? nPerson.getId() : ""%>' /></td>
			</tr>
			<tr>
				<td>Person First Name</td>
				<td><input type="text" name="firstName"
					value='<%=!submitted && nPerson != null ? nPerson.getFirstName() : ""%>' />
				</td>
			</tr>
			<tr>
				<td>Person Last Name</td>
				<td><input type="text" name="lastName"
					value='<%=!submitted && nPerson != null ? nPerson.getLastName() : ""%>' />
				</td>
			</tr>
			<tr>
				<td>Person Email Address</td>
				<td><input type="text" name="emailAddress"
					value='<%=!submitted && nPerson != null ? nPerson.getEmailAddress() : ""%>' />
				</td>
			</tr>
			<tr>
				<td>Person Salary</td>
				<td><input type="text" name="salary"
					value='<%=!submitted && nPerson != null ? nPerson.getSalary() : ""%>' />
				</td>
			</tr>
		</table>
		<button name="btnSubmit" class="btn btn-primary">Submit</button>
	</form>
	<%}%>
	
	<!-- show errors -->
	<div>
		<%if (errors.size() > 0) {%>
		<ul>
			<%for (String err : errors) {%>
			<li><%=err%></li>
			<%}%>
		</ul>
		<%}%>
	</div>
	
	<!-- Upon successful submission, hide the form and display the details -->
	<%} else {%>
	<table class="table">
		<tr>
			<td>Person Id</td>
			<td><%=nPerson.getId()%></td>
		</tr>
		<tr>
			<td>Person First Name</td>
			<td><%=nPerson.getFirstName()%></td>
		</tr>
		<tr>
			<td>Person Last Name</td>
			<td><%=nPerson.getLastName()%></td>
		</tr>
		<tr>
			<td>Email Address</td>
			<td><%=nPerson.getEmailAddress()%></td>
		</tr>
		<tr>
			<td>Salary</td>
			<td><%=nPerson.getSalary()%></td>
		</tr>
	</table>
	<%}%>
	
	<%@include file="WEB-INF/jspf/footer.jspf"%>
</body>
</html>
