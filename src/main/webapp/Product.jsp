<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
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

body, option {
	color: maroon;
	font-size: 14pt;
	font-weight: bold;
}

h1 {
	color: olive;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Register Product</title>
</head>
<body>
	<%!String driverName = "com.mysql.jdbc.Driver";%>
	<%!String url = "jdbc:mysql://localhost:3306/groupProject";%>
	<%!String user = "root";%>
	<%!String psw = "root1234";%>
	
		<%
		Connection con = null;
		PreparedStatement ps = null;
		
			Class.forName(driverName);
			con = DriverManager.getConnection(url, user, psw);
			String sql = "SELECT * FROM ProductInfo";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
		%>

		<center>
			<h1>Register Product</h1>
			<hr>
			<a href="Index.jsp" class="button">Home Page</a> <br> <br>

			<form method="post" action="ProductAuth.jsp">
				<table cellpadding="10px">
					<tr>
						<td>User Name:</td>
						<td><input type="text" name="uname" /></td>
					</tr>
					<tr>
						<td>Product Name:</td>
						<td><select name="pname">
								<%
								while (rs.next()) {
									String pname = rs.getString("pname");
								%>
								<option value="<%=pname%>"><%=pname%></option>
								<%
								}
								%>
						</select>
							
 				</td>
					</tr>
					<tr>
						<td>Serial No:</td>
						<td><input type="text" name="sno" /></td>
					</tr>
					<tr>
						<td>Purchase date:</td>
						<td><input type="date" name="pdate" /></td>
					</tr>
					<tr>
						<td colspan="2"><center>
								<input type="submit" value="Register Product" id="inputbtn" />
							</center></td>
					</tr>
				</table>
			</form>

			<font color="red"><c:if test="${not empty param.errMsg}">
					<c:out value="${param.errMsg}" />
				</c:if></font> <font color="green"><c:if test="${not empty param.succMsg}">
					<c:out value="${param.succMsg}" />
				</c:if> </font>





		</center>
		
</body>
</html>