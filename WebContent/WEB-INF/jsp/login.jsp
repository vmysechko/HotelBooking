<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Login page</title>
</head>
<body>

<h1>Login page</h1>

<form action="${pageContext.request.contextPath}/login" method="post">

		Name:<input type="text" name="login"/>		</br>
	Password:<input type="text" name="password"/>	</br>
			<input type="submit" value="OK"/>

</form>



</body>
</html>