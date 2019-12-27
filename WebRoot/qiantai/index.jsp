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
<!--main-->
<div id="main">
<div class="main">

	<div class=""><br/><br/><br/><br/><br/><br/><font color="white" size="6" >智能健身管理系统</font><a href="#"></a></div>
    <div class="reglog">&nbsp;&nbsp;&nbsp;<a href="login.jsp">登陆</a>&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;<a href="reg.jsp">注册</a></div>
    <div class="menu">
    	<ul>
    		<li ><a href="help.jsp"><font color="black">帮助</font></a></li>
    		 <li><a href="user.do?method=selQc"><font color="black">教练专区</font></a></li>
    	 	 <li><a href="user.do?method=selCz"><font color="black">课程专区</font></a></li>
    	 	  <li><a href="user.do?method=selSp"><font color="black">器械专区</font></a></li>
        </ul>
    </div>
    <div class="nav">
    	<ul>
            <li class="t2"><a href="#">哑铃</a></li>
            <li class="t4"><a href="#">跑步<br>机</a></li>
            <li class="t2"><a href="#">杠铃</a></li>
            <li class="t2"><a href="#">哑铃</a></li>
            <li class="t4"><a href="#">卧推<br>器</a></li>
            <li class="t4"><a href="#">卷力<br>器</a></li>
            <li class="t4"><a href="#">弹簧<br>棒</a></li>
            <li class="t4 last"><a href="#">卧推<br>架</a></li>
       </ul>
    </div>
</div>
</div>
<!--footer-->
<div id="footer">智能健身管理系统</div>
</body>
</html>
