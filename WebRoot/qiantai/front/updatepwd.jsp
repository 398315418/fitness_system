<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户注册</title>
		<script type="text/javascript">
var i = 5;
var falg = 0;
function fun() {
	var p = document.getElementById("phone").value;
	if (p == "") {
		document.getElementById("ph").style.display = "block";
		document.getElementById("ph").innerHTML = "手机号码不能为空  !";
	} else {
		var RegCellPhone = /^([0-9]{11})?$/;
		falg = p.search(RegCellPhone);
		if (falg == -1) {
			document.getElementById("ph").style.display = "block";
			document.getElementById("ph").innerHTML = "请输入正确的手机号码 !";
		} else {

			i--;
			if (i > 0) {
				document.getElementById("ph").style.display = "none";
				document.getElementById("alt").style.display = "block";
				document.getElementById("con").style.display = "block";
				document.getElementById("but").value = "重新发送";
			}
			setTimeout('fun()', 1000);
			document.getElementById("alt").innerHTML = i;
			if (i == 0) {
				window.location.href = "login.jsp";
			}

		}
	}

}
</script>

		<link href="front/user.css" rel="stylesheet" type="text/css" />
	</head>

	<body>


		<form action="">
			<div>
				手机号码：
				<input type="text" name="phone" id="phone">
				<span id="ph" style="display: none"></span>
				<br>
			</div>
			<div>
				验证号码：
				<input type="text" name="sns" id="sns">
				<input type="button" value="获取校验码" id="but" onclick="fun()">

			</div>
			<div>
				<span id="con" style="display: none; float: left">
					如果60秒内没有收到验证码，请重新获取验证码 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
				<span id="alt" style="display: none">5</span>
			</div>
			<br />

			<input type="submit" value="下一步">
		</form>



	</body>
</html>


