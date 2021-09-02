<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
    <head>
        <style>


#h1 {
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


</style>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Product Updated </title>
    </head>
    <body>
 
 <center>
		
		
		
		<a href="adminLogin.jsp" class= "button button3">Go Back</a>    
		
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/groupProject"
                           user="root"  password="root1234"/>
                           
        <sql:update dataSource="${dbsource}" var="count">
            UPDATE groupProject.ProductInfo SET model = ?, price = ? WHERE pname = '${param.pname}'
            <sql:param value="${param.model}" />
            <sql:param value="${param.price}" />
        </sql:update>
        <c:if test="${count>=1}">
            <font id="h1" size="5" color='green'> Congratulations ! Data updated
            successfully.</font>
           <hr> 
            
                       
        </c:if>
    </body>
</html>