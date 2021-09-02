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
	<c:if
		test="${ empty param.username or empty param.password or empty param.name or empty param.cell or empty param.email or empty param.address}">
		<c:redirect url="User.jsp">
			<c:param name="errMsg" value="All fields are required" />
		</c:redirect>

	</c:if>

	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/groupProject" user="root"
		password="root1234" />

	<sql:query dataSource="${dbsource}" var="data">
        select count(*) as user from UserReg
        where username='${param.username}'
       
      </sql:query>

	<c:forEach items="${data.rows}" var="r">
		<c:choose>
			<c:when test="${r.user == 0}">


				<sql:update dataSource="${dbsource}" var="rec">
		
				INSERT INTO UserReg VALUES (?,?,?,?,?,?,?)
	
				<sql:param value="${param.name}" />
					<sql:param value="${param.username}" />
					<sql:param value="${param.password}" />
					<sql:param value="${param.cell}" />
					<sql:param value="${param.email}" />
					<sql:param value="${param.address}" />
					<sql:param value="${param.type}" />
				</sql:update>
				<c:if test="${rec>=1}">
					<font size="5" color='green'> You are registered
						successfully.<\/font>

					<c:redirect url="User.jsp">
						<c:param name="succMsg"
							value="Congratulations ! You are registered successfully." />
					</c:redirect>
				</c:if>

			</c:when>


			<c:otherwise>
				<c:redirect url="User.jsp">
					<c:param name="errMsg" value="Username Already exists!" />
				</c:redirect>
			</c:otherwise>
		</c:choose>

	</c:forEach>

	

	<br>
	<br>


</body>
</html>