<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<meta charset="utf-8">
<title>智能健身管理系统</title>
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" >
<link href="css/common.css" rel="stylesheet" type="text/css" media="all" >
<link href="css/public.css" rel="stylesheet" type="text/css" media="all" >
<link href="css/home.css" rel="stylesheet" type="text/css" media="all" >
		
</head>
<body>
<!--reglogin-->
<div id="reglogin">
    <div class="reglogin">
        <div class=" float_left">
  			<a href="index.jsp"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<font color="white" size="6" >智能健身管理系统</font></a>
  			</div>
        <div class="ibox">
        	<form action="user.do?method=add" method="post" onsubmit="return login()">
              <h3 class="r">注&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;册</h3>
              <div class="row r"><span>账号：</span><input type="text" name="account" placeholder="请选择一个登陆账号"/></div>	
              <div class="rowa r"><span>密码：</span><input type="password" name="password"  placeholder="请设置登陆密码"/></div>	
              <br/><br/><br/><br/>
              <%--<div class="rowi r">提示验证吗以发到你的手机里面，<br>如长时间无法受到请重新获取或致电＊＊＊＊＊＊</div>
              <div class="row r"><span>&nbsp;</span><span>找人服务</span><span>给人服务</span></div>
              --%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="submit" class="loginbtn" value="确认注册" onclick="toAdd();" />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="index.jsp"> <input type="button" class="loginbtn" value="返回首页" /></a>
            </form>
   		 </div>
    </div>
</div>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("注册成功，您可以选项登陆！！！");
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
</body>
</html>
