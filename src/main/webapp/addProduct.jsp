<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${empty param.pnames or empty param.models or empty param.prices}">
		<c:redirect url="displayProductInfo.jsp">
			<c:param name="errMsg" value="All fields are required" />
		</c:redirect>

	</c:if>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/groupProject" user="root"
		password="root1234" />

	<sql:query dataSource="${dbsource}" var="data">
        select count(*) as pro from ProductInfo
        where pname='${param.pnames}'
       
      </sql:query>

	<c:forEach items="${data.rows}" var="r">
		<c:choose>
			<c:when test="${r.pro == 0}">


				<sql:update dataSource="${dbsource}" var="rec">
		
				INSERT INTO ProductInfo VALUES (?,?,?)
	
				<sql:param value="${param.pnames}" />
					<sql:param value="${param.models}" />
					<sql:param value="${param.prices}" />

				</sql:update>
				<c:if test="${rec>=1}">
					<font size="5" color='green'> Product added successfully.</font>

					<c:redirect url="displayProductInfo.jsp">
						<c:param name="succMsg"
							value="Congratulations ! Product added
						successfully." />
					</c:redirect>
				</c:if>

			</c:when>


			<c:otherwise>
				<c:redirect url="displayProductInfo.jsp">
					<c:param name="errMsg" value="Product Already exists!" />
				</c:redirect>
			</c:otherwise>
		</c:choose>

	</c:forEach>

</body>
</html>