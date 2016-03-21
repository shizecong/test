<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
</head>
<script language="javascript" src="js/jquery.js"></script>
<script type="text/javascript" language="javascript">
function submitYouFrom(){
	var code = "${param.code}";
	console.log(11);
	var url = "http://localhost:8080/spring-oauth-server/oauth/token?client_id=unity-client&client_secret=unity&grant_type=authorization_code&code="+code+"&redirect_uri=http%3a%2f%2flocalhost%3a8080%2fspring-oauth-server%2funity%2fdashboard";
	document.forms[0].action=url;
	document.forms[0].submit();
}
</script>
<body>
	<form id="form1" name="form1" method="post">
		<a href="javascript:submitYouFrom()"> 提交 </a>
	</form>
</body>
</html>