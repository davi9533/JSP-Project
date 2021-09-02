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
        <title>Update Product Details</title>
    </head>
    <body>
 
 <center>
		<h1>Product Details</h1>
		<hr>
		<br><br>
		<a href="adminLogin.jsp" class= "button button3">Go Back</a>
        <sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/groupProject"
                           user="root"  password="root1234"/>
 
        <sql:query dataSource="${dbsource}" var="result">
            SELECT * from ProductInfo where pname=?
            <sql:param value="${param.pname}" />
        </sql:query>
        <form action="updatedb.jsp" method="post">
            <table border="0" width="40%">
                
                <tr>
                  
                    <th>Model</th>
                    <th>Price</th>
                </tr>
                <c:forEach var="row" items="${result.rows}">
                    <tr>
                        <td><input type="hidden" value="${param.pname}" name="pname"/>
                            <input type="text" value="${row.model}" name="model"/></td>
                        <td><input type="text" value="${row.price}" name="price"/></td>
                        <td><input type="submit" value="Update" id="inputbtn"/></td>
                    </tr>
                </c:forEach>
            </table>
            
        </form>
        </center>
    </body>
</html>
