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
<%
		
			String error = (String)request.getAttribute("message");
			error = error == null?"":error;
			String account = (String)request.getParameter("account");
			account = account == null?"":account;
		%>
<body>
<!--reglogin-->
<div id="reglogin">
    <div class="reglogin">
    <form action="Userlogin.do?method=Userlogin" method="post" onsubmit="return login()">
            <div class=" float_left">
  			<a href="index.jsp"><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  			<font color="white" size="6" >智能健身管理系统</font></a>
  			</div>
            <div class="ibox">
              <h3>登&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;陆</h3>
              <div class="row"><span>账号：</span><input type="text" name="account" id="account" placeholder="请输入账号" /></div>	
              <div class="row"><span>密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码：</span><input type="password" name="password" id="password" placeholder="请输入密码"/></div>	<br/>
               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               <input type="submit" class="loginbtn" value="确认登录" />
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
              <a href="index.jsp"> <input type="button" class="loginbtn" value="返回首页" /></a>
                <div class="rowi">
                <font size = "5" color = "red" ><%=error %>
                <%--<a href="#">注册</a>&nbsp;&nbsp;<a href="#">注册</a>--%></div>
                
            </div>
    </form>
    </div>
    
</div>
</body>
</html>
