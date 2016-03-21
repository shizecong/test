<%@page
	import="org.springframework.security.core.context.SecurityContextHolder"%>
<%@page import="org.springframework.util.StringUtils"%>
<%@page import="org.springframework.security.core.Authentication"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Login</title>
</head>
<body>
	<h3>Login page</h3>
	<form action='j_spring_security_check' method='POST'>
		<table>
			<tr>
				<td>User Name:</td>
				<td><input type='text' name='j_username' value=''></td>
			</tr>
			<tr>
				<td>Password:</td>
				<td><input type='password' name='j_password' /></td>
			</tr>
			<tr>
				<td colspan='2'><input name="submit" type="submit"
					value="Login" /></td>
			</tr>
		</table>
		<a href="http://localhost:8080/spring-oauth-server/oauth/authorize.htm?client_id=unity-client&redirect_uri=http%3a%2f%2flocalhost%3a8080%2fappDemo%2fredirect_uri.jsp&response_type=code&scope=read">第三方授权登录</a>	
		</form>
	<%
		String error = request.getParameter("error");
		if (!StringUtils.isEmpty(error) && error.equals("true")) {
			out.print("<p style='color:red'>登录失败或权限不足</p>");
		}
	%>
	<p>The current user is</p>
	<%
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth == null)
			out.print("null");
		else
			out.print(auth.getName());
	%>
	<p>Default UserName/Password: admin/admin</p>
</body>
</html>