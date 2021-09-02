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
        <title>Claim Updated </title>
    </head>
    <body>
 
 <center>
		
		
		
		<a href="adminLogin.jsp" class= "button button3">Go Back</a>    
		
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
                           url="jdbc:mysql://localhost/groupProject"
                           user="root"  password="root1234"/>
                           
        <sql:update dataSource="${dbsource}" var="count">
            update groupproject.Claim set status = ? WHERE id = '${param.id}'
            <sql:param value="${param.status}" />
            
        </sql:update>
        <c:if test="${count>=1}">
            <font id="h1" size="5" color='green'> Congratulations ! Claim status updated
            successfully.</font>
           <hr> 
            
                       
        </c:if>
    </body>
</html>