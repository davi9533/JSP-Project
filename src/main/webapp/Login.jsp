<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
<style>
#inputbtn {
	background-color: teal;
	border: none;
	color: white;
	padding: 15px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	border-radius: 10px;
}
.button {
  background-color: navy;
  border: none;
  color: white;
  padding: 10px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
  position: absolute;
 right: 0;
 border-radius: 10px; 
}

body {
	color: maroon;
	font-size: 14pt;
	font-weight: bold;
	
}

h1 {
	color: olive;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Login</title>
</head>
<body>
<center>
<h1>User Login</h1>
<hr>
<a href="User.jsp" class="button">User Registration</a>
<br><br>
 
        <form action="loginAuth.jsp" method="POST">
			<table cellpadding="10px">
				
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" /></td>
				
				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Login" id="inputbtn" />
						</center></td>
						</tr>
			</table>
		</form>

        <font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font>
    </center>
</body>
</html>