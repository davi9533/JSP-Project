<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
    <style>


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

form {
	color: maroon;
	font-size: 14pt;
	font-weight: bold;
	margin-top: 10%;
}

#inputbtn {
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
	border-radius: 10px;
}
</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Claim Details</title>
    </head>
    <body>
 
 
 <%
         Date dNow = new Date( );
         SimpleDateFormat ft =
         new SimpleDateFormat ("yyyy-MM-dd");
         
      %>
 <center>
		<h1>Claim Details</h1>
		<hr>
		<br><br>
		<a href="Login.jsp" class= "button button3">Go Back</a>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/groupProject"
                           user="root"  password="root1234"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from Product where sno=?
            <sql:param value="${param.sno}" />
            </sql:query>
        <form action="ClaimAuth.jsp" method="post">
            <table border="0" width="40%">
                
                <tr>
                  	<th>Serial No.</th>
                    <th>Username</th>
                    <th>Purchase Date</th>
                    <th>Product</th>
                    <th>Claim Date</th>
                    <th>Description</th>
                    
                    
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="text" value="${row.sno}" name="sno"/></td>
                        <td><input type="text" value="${row.username}" name="username"/></td>
                         <td><input type="date" value="${row.pdate}" name="pdate"/></td>
                        <td><input type="text" value="${row.pname}" name="pname"/></td>
                        <td><input type="date" value="<%=ft.format(dNow) %>" name="cdate"/></td>
                        <td><textarea rows="5" cols="40" name="desc"></textarea></td>
                        </tr><tr>
                        <td colspan="4"><center><input type="submit" value="Add Claim" id="inputbtn"/></center></td>
                        </tr>
                    </c:forEach>
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
