<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#table1 {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	margin-top: 10%;
}

#table1 td, #table1 th {
	border: 1px solid #ddd;
	padding: 8px;
}

#table1 tr:nth-child(even) {
	background-color: #f2f2f2;
}

#table1 tr:hover {
	background-color: #ddd;
}

#table1 th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: purple;
	color: white;
}

h1 {
	color: olive;
}

.button3 {
	background-color: teal;
	border: none;
	color: white;
	padding: 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	background-color: gray;
	position: absolute;
	right: 0;
}
.button2 {
	background-color: teal;
	border: none;
	color: white;
	padding: 12px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px 2px;
	cursor: pointer;
	background-color: green;
}



</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Claims</title>
</head>
<body>
	<center>
		<h1>Claim Details</h1>
		<hr>
		<a href="adminLogin.jsp" class="button button3">Go Back</a>


		
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/groupProject" user="root"
			password="root1234" />


		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from claim 
        </sql:query>
	
			<table id="table1" border="1" width="40%">

				<tr>


					<th>Claim No.</th>
					<th>Date</th>
					<th>Description</th>
					<th>Serial No</th>
					<th>Status</th>
					<th>Action</th>



				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>

						<td><c:out value="${row.id}" /></td>
						<td><c:out value="${row.date}" /></td>
						<td><c:out value="${row.description}" /></td>
						<td><c:out value="${row.sno}" /></td>
						<td><c:out value="${row.status}" /></td>
						<td><a
							href="updateClaim.jsp?id=<c:out value="${row.id}"/>" class=" button button2">Update</a></td>


					</tr>
				</c:forEach>
			</table>
		
		<br> <br> <a href="Index.jsp">Home Page</a>
	</center>
</body>
</html>