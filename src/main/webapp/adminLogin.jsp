<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
</head>
<style>
.button {
	background-color: teal;
	border: none;
	color: white;
	padding: 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
}

.button1 {
	margin-top: 10%;
}

.button3 {
	background-color: gray;
	position: absolute;
	right: 0;
}

h1 {
	color: olive;
}
</style>
<body>


	<center>
		<h1>Admin Page</h1>
		<hr>
		<a href="Index.jsp" class="button button3">Home Page</a> <a
			href="displayUser.jsp" class="button button1">Display Users</a>&nbsp;&nbsp;&nbsp;<a href="displayProductInfo.jsp" class="button">Display 
			Products List</a> <br>
		<br> <a href="displayProduct.jsp" class="button">Display
			Products Registered by Customers</a> <br><br>
			
			<a href="displayClaims.jsp" class="button">Display 
			Claims</a>&nbsp;&nbsp;&nbsp;<a href="report.jsp" class="button">Click to view Report</a>
			
			




	</center>
</body>
</html>