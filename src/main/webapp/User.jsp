<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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

form {
	color: maroon;
	font-size: 14pt;
	font-weight: bold;
	
}

h1 {
	color: olive;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Registration</title>
</head>
<body>
	<center>
		<h1>User Registration</h1>

		<hr>
<a href="Index.jsp" class="button">Home Page</a>
<br><br>

		<form action="UserAuth.jsp">
			<table cellpadding="10px">
				<tr>
					<td>Full Name:</td>
					<td><input type="text" name="name" /></td>
				</tr>
				<tr>
					<td>Username:</td>
					<td><input type="text" name="username" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><input type="password" name="password" /></td>
				</tr>
				<tr>
					<td>Cell Phone:</td>
					<td><input type="text" name="cell" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><input type="text" name="email" /></td>
				</tr>
				<tr>
					<td>Address:</td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
										<td>
					<input type="radio" name="type" value="Customer" checked="checked"/>I agree <br>
					 </td>
				</tr>
				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Register" id="inputbtn" />
						</center></td>
			</table>
		</form>




		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
			</c:if></font> <font color="green"><c:if test="${not empty param.succMsg}">
				<c:out value="${param.succMsg}" />
			</c:if>
		</font>
		
		 </center>
</body>
</html>