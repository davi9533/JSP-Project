<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:if
		test="${ empty param.uname or empty param.pname or empty param.sno or empty param.pdate}">
		<c:redirect url="Product.jsp">
			<c:param name="errMsg" value="All Fields Required" />
		</c:redirect>
	</c:if>

	<c:if test="${not empty param.uname}">
		<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/groupProject" user="root"
			password="root1234" />

		<sql:query dataSource="${ds}" var="data">
        select count(*) as user from UserReg
        where username='${param.uname}'
        
      </sql:query>

		<c:forEach items="${data.rows}" var="r">
			<c:choose>
				<c:when test="${r.user gt 0}">
					<sql:update dataSource="${ds}" var="rec">
    					insert into groupProject.Product values(?,?,?,?)
          				<sql:param value="${param.sno}" />
						<sql:param value="${param.pname}" />
						<sql:param value="${param.uname}" />
						<sql:param value="${param.pdate}" />
					</sql:update>
					<c:if test="${rec>=1}">
						<font size="5" color='green'> Product registered
							successfully.</font>

						<c:redirect url="Product.jsp">
							<c:param name="succMsg"
								value="Congratulations ! Product registered successfully." />
						</c:redirect>

					</c:if>
				</c:when>
				<c:otherwise>
					<c:redirect url="Product.jsp">
						<c:param name="errMsg" value="Incorrect Username" />
					</c:redirect>
				</c:otherwise>
			</c:choose>

		</c:forEach>

	</c:if>

</body>
</html>