<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home Page</title>
</head>
<style>
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
  
}
.button1{
margin-top: 10%;
}
.button3{
background-color:gray;
position: absolute;
 right: 0;

}

h1{
	color: olive;
}

</style>
<body>


	<center>
	<h1>Home Page</h1>
	<hr>
	<a href="Login.jsp" class="button button3">Login</a>
	<br>
	<a href="User.jsp" class="button button1">User Registration</a>
	<br><br>
	
	<a href="Product.jsp" class="button">Register Product</a>
	<br><br>
	
	</center>
</body>
</html>