<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Registration</title>
</head>
<body>

<h1>Registration page</h1>

<form action="${pageContext.request.contextPath}/registration" method="post">

			Name:<input type="text" name="login"/>		</br>
		Password:<input type="text" name="password"/>	</br>
		  E-mail:<input type="text" name="email"/>		</br>
		   Phone:<input type="text" name="phone"/>		</br>

			<input type="submit" value="OK"/>

</form>

</body>
</html>