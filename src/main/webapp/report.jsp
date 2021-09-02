<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
table {
  font-family: Arial, Helvetica, sans-serif;
  border-collapse: collapse;
  width: 100%;
  margin-top: 10%;
}

table td, table th {
  border: 1px solid #ddd;
  padding: 8px;
}

table tr:nth-child(even){background-color: #f2f2f2;}

table tr:hover {background-color: #ddd;}

table th {
  padding-top: 12px;
  padding-bottom: 12px;
  text-align: left;
  background-color: purple;
  color: white;
}

h1{
	color: olive;
}
.button3{
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
background-color:gray;
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
<title>Report</title>
</head>
<body>

  
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/groupProject"
                           user="root"  password="root1234"/>
                           
                           
 
        <sql:query dataSource="${dbsource}" var="result">
            select u.name,u.username, p.sno,p.pname,p.pdate,c.id,c.date,c.status from Product p right outer join UserReg u
on u.username = p.username left outer join Claim c on p.sno = c.sno
        </sql:query>
        
      
    <center>
    <h1>Report</h1>
	<hr>
	<a href="adminLogin.jsp" class="button button3">Go Back</a>

      
		
		
		
    
        <form>
            <table border="1" width="40%">
              
                <tr>
                    
                    
                    <th>Name</th>
                    <th>Username</th>
                    <th>Serial Number</th>
                    
                    <th>Product Registered</th>
                    <th>Purchase Date</th>
                    <th>Claim id</th>
                    <th>Claim Date</th>
                    <th>Claim status</th>
                    
                  
                 
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><c:out value="${row.name}"/></td>
                        <td><c:out value="${row.username}"/></td>
                        <td><c:out value="${row.sno}"/></td>
                        <td><c:out value="${row.pname}"/></td>
                        <td><c:out value="${row.pdate}"/></td>
                        <td><c:out value="${row.id}"/></td>
                        <td><c:out value="${row.date}"/></td>
                        <td><c:out value="${row.status}"/></td>
                        
                       
                    </tr>
                </c:forEach>
            </table>
        </form>
 <br><br><a href="Index.jsp" >Home Page</a>
    </center>
</body>
</html>