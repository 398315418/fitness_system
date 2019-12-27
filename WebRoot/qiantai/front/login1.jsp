<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
	<head>
		<base href="<%=basePath%>">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>用户登陆</title>
		<script type="text/javascript">
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
			document.getElementById("ph").style.display = "none";
		}
	}

}
</script>



	</head>

	<body>

		<div>
			<div>
				<span><a href="front/login.jsp">一键登陆</a>
				</span>
				<span><a href="front/login1.jsp">密码登陆</a>
				</span>
			</div>
			<br />
			<br />
			<br />
			<div>
				<form action="">
					<div>
						手机号码：
						<input type="text" name="phone" id="phone" onblur="fun()">
						<span id="ph" style="display: none"></span>
						<br>
					</div>
					<div>
						输入密码：
						<input type="text" name="pwd" id="pwd">
					</div>
					<br />

					<a href="front/updatepwd.jsp">忘记密码</a>&nbsp;&nbsp;&nbsp;
					<input type="submit" value="登陆">
				</form>

			</div>
		</div>

	</body>
</html>

