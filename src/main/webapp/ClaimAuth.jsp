<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.*"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar" %>    
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Claim Auth</title>
</head>
<body>


	<%

	String dateBeforeString = request.getParameter("pdate");
	String dateAfterString = request.getParameter("cdate");
		
	
	LocalDate dateBefore = LocalDate.parse(dateBeforeString);
	LocalDate dateAfter = LocalDate.parse(dateAfterString);
		
	//calculating number of days in between
	long noOfDaysBetween = ChronoUnit.DAYS.between(dateBefore, dateAfter);
	
      if(noOfDaysBetween < 1825){

 %>

	<c:if test="${empty param.cdate or empty param.desc}">
		<c:redirect url="Claim.jsp">
			<c:param name="errMsg" value="All Fields Required" />
		</c:redirect>
	</c:if>

	<c:if test="${not empty param.sno}">
		<sql:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/groupProject" user="root"
			password="root1234" />




		<sql:query dataSource="${ds}" var="selectQ">
		select count(*) as kount from groupProject.Claim
        where user='${param.username}'
        and sno='${param.sno}'
      </sql:query>



		<c:forEach items="${selectQ.rows}" var="r">
			<c:choose>
				<c:when test="${r.kount < 3 }">


					<sql:update dataSource="${ds}" var="rec">
		
				INSERT INTO groupProject.Claim(date,description,user,sno) VALUES (?,?,?,?)
	
				<sql:param value="${param.cdate}" />
						<sql:param value="${param.desc}" />
						<sql:param value="${param.username}" />
						<sql:param value="${param.sno}" />

					</sql:update>
					<c:if test="${rec>=1}">
						<font size="5" color='green'> Claim added successfully.</font>

						<c:redirect url="Claim.jsp">
							<c:param name="succMsg"
								value="Congratulations ! Claim added
						successfully." />
						</c:redirect>
					</c:if>



				</c:when>
				<c:otherwise>
					<c:redirect url="Claim.jsp">
						<c:param name="errMsg" value="Already claimed 3 times" />
					</c:redirect>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>
	<%}
      else{
    	  %>
    	  <c:redirect url="Claim.jsp">
						<c:param name="errMsg" value="Out of Protection Plan" />
					</c:redirect>
    	  <%
      }
      
      %>

</body>
</html>