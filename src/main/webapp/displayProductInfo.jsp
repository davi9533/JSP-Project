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
	padding: 20px;
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

#form1 {
	color: maroon;
	font-size: 14pt;
	font-weight: bold;
}

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
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Display Product details</title>
</head>
<body>
	<center>
		<h1>Product Details</h1>
		<hr>
		<a href="adminLogin.jsp" class="button button3">Go Back</a>


		<form action="addProduct.jsp" method="post">
			<table cellpadding="10px">
				<tr>
					<td>Product Name:</td>
					<td><input type="text" name="pnames" /></td>
				</tr>
				<tr>
					<td>Model:</td>
					<td><input type="text" name="models" /></td>
				</tr>
				<tr>
					<td>Price:</td>
					<td><input type="text" name="prices" /></td>
				</tr>

				<tr>
					<td colspan="2"><center>
							<input type="submit" value="Add Product" id="inputbtn" />
						</center></td></tr>
			</table>
		</form>
		
		<font color="red"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.errMsg}" />
            </c:if></font>
        <font color="green"><c:if test="${not empty param.errMsg}">
            <c:out value="${param.succMsg}" />
            </c:if></font>


		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/groupProject" user="root"
			password="root1234" />


		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from ProductInfo 
        </sql:query>
		<form>
			<table id="table1" border="1" width="40%">

				<tr>


					<th>Product Name</th>
					<th>Model</th>
					<th>Price</th>
					<th>Action</th>



				</tr>
				<c:forEach var="row" items="${result.rows}">
					<tr>

						<td><c:out value="${row.pname}" /></td>
						<td><c:out value="${row.model}" /></td>
						<td><c:out value="${row.price}" /></td>
						<td><a
							href="updateProductInfo.jsp?pname=<c:out value="${row.pname}"/>">Update</a></td>


					</tr>
				</c:forEach>
			</table>
		</form>
		<br> <br> <a href="Index.jsp">Home Page</a>
	</center>
</body>
</html>