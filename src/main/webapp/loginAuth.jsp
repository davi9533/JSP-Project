<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<style>
table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 100%;
	margin-top: 10%;
}

table td, #table1 th {
	border: 1px solid #ddd;
	padding: 8px;
}

table tr:nth-child(even) {
	background-color: #f2f2f2;
}

table tr:hover {
	background-color: #ddd;
}

table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: purple;
	color: white;
}

h1 {
	color: olive;
}

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
	background-color: gray;
	position: absolute;
	right: 0;
}
.button1 {
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
	background-color: lightblue;
	
	
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
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Product Details</title>
</head>
<body>
	<center>

	<h1>Products Registered</h1>

		<hr>
		<a href="Index.jsp" class="button">Log out</a><br><br><br><br><br>
		<a href="Product.jsp" class="button button1">Register Product</a>


		<%
		String name = request.getParameter("username");
		String pass = request.getParameter("password");

		if ((name.isEmpty() && pass.isEmpty()) || (name.isEmpty() || pass.isEmpty())) {
		%><c:redirect url="Login.jsp">
			<c:param name="errMsg" value="Enter username and password" />
		</c:redirect>
		<%
		}
		String user = "root";
		String password = "root1234";
		ResultSet rs = null;
		ResultSet rs1 =null;
		try {
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/groupProject", user, password);
		String sql = "Select * from UserReg where Username='" + name + "' and Password='" + pass + "'";
		Statement stmt = con.createStatement();
		rs = stmt.executeQuery(sql);
		
		if (rs.next()) {
			if (rs != null) {
				if (rs.getString("type").equalsIgnoreCase("Admin")) {
			response.sendRedirect("adminLogin.jsp");

				}

				else if (rs.getString("type").equalsIgnoreCase("Customer")) {

			String sql1 = "Select * from Product where Username='" + name + "'";

			rs = stmt.executeQuery(sql1);
			
			
			
		%>

		<table>

			<tr>

				<th>Serial Number</th>
				<th>Product Name</th>
				<th>Username</th>
				<th>Purchase Date</th>
				<th>Action</th>



			</tr>
			<%while (rs.next()) {%>
			<tr>
				<td><%=rs.getString(1)%></td>
				<td><%=rs.getString(2)%></td>
				<td><%=rs.getString(3)%></td>
				<td><%=rs.getString(4)%></td>
				<td><a href="Claim.jsp?sno=<c:out value="<%=rs.getString(1)%>"/>">Add Claim</a></td>
			</tr>
			<%
			}
			%>
		</table>
		
		
		<%
		String sql2 = "Select * from Claim where user='" + name + "'";

		rs1 = stmt.executeQuery(sql2); 
		
		%>
		
		
		
		<br><br>
		
		<h1>Claims</h1>
		<hr>
		<table>

			<tr>

				<th>Claim ID</th>
				<th>Serial Number</th>
				<th>Username</th>
				<th>Description</th>
				<th>Date</th>
				<th>Status</th>



			</tr>
			<%while (rs1.next()) {%>
			<tr>
				<td><%=rs1.getInt(1)%></td>
				<td><%=rs1.getString(6)%></td>
				<td><%=rs1.getString(5)%></td>
				<td><%=rs1.getString(4)%></td>
				<td><%=rs1.getString(2)%></td>
				<td><%=rs1.getString(3)%></td>
				
			</tr>
			<%
			}
			%>
		</table>

		<%
		} 
			
		%>
		<%
		

		}
		} else{
		%>

		<c:redirect url="Login.jsp">
			<c:param name="errMsg" value="Try Again or Register!" />
		</c:redirect>
		<%
		}
		} catch (SQLException e) {
		out.println("SQLException caught: " + e.getMessage());
		}
		%>
	</center>
</body>
</html>