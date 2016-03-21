<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<script language="javascript" src="js/jquery.js"></script>
<script type="text/javascript">
var accessToken;
function getAccessToken(){
	//alert(1);
	var code = "${param.code}";
	console.log(code);
	var redirect_uri="http://localhost:8080/appDemo/redirect_uri.jsp";
	redirect_uri = encodeURIComponent(redirect_uri);
	console.log(redirect_uri);
	var url="http://localhost:8080/spring-oauth-server/oauth/token?client_id=unity-client&client_secret=unity&grant_type=authorization_code&code="+code+"&redirect_uri=http%3a%2f%2flocalhost%3a8080%2fappDemo%2fredirect_uri.jsp";
	//var url="http://localhost:8080/spring-oauth-server/oauth/token?client_id=unity-client&client_secret=unity&grant_type=authorization_code&code="+code+"&redirect_uri=http%3a%2f%2flocalhost%3a8080%2fspring-oauth-server%2funity%2fdashboard";
	//var url="http://localhost:8080/spring-oauth-server/oauth/token.htm";
	$.ajax({
		url:url,
		type:"post",
		dataType:"json", 
		//data:{"code":code,"client_id":"unity-client","client_secret":"unity","grant_type":"authorization_code","redirect_uri":"http://localhost:8080/appDemo/"},
		success:function(data){
			console.log(data);
			accessToken = data.access_token;
			alert("获取到的token为"+accessToken);
			
		}
	});	
}
function setSessionByToken(){
	if(accessToken == ""||accessToken==null){
		return ;
	}
	var url = "http://localhost:8080/spring-oauth-server/unity/user_info";
	$.ajax({
		url:url,
		type:"post",
		dataType:"json", 
		data:{"access_token":accessToken},
		success:function(data){
			console.log(data);
			//login(data);
		}
	});	
}
function login(data){
	console.log(data.username);
	var url = "<%=basePath%>login/login.htm?userName="+data.username;
	location.href=url;
	
}
</script>
</head>
<body>
	<h3></h3>
	<input type="button" value="获取accessToken" onclick="javascript:getAccessToken()" />
	<input type="button" value="获取用户信息并写入session" onclick="javascript:setSessionByToken()" />
</body>
</html>