<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>" target="rightFrame"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>

<body style="background:#f0f9fd;">

<div class="lefttop"><span></span>管理信息</div>
<dl class="leftmenu">
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png" /></span>用户信息管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="administrator.do?method=selUser">用户管理</a><i></i></li>
		</ul>   
	</dd>
	
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>教练管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="shangpin.do?method=selQc">教练信息管理</a><i></i></li>
		</ul> 
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>课程管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="index/admin/chongzhi/addCz.jsp">添加课程信息</a><i></i></li>
			<li><cite></cite><a href="shangpin.do?method=selCz">查看课程目信息</a><i></i></li>
		</ul> 
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png"/></span>器械管理
		</div>
		<ul class="menuson">
				<li><cite></cite><a href="shangpin.do?method=selSp">器械信息</a><i></i></li>
		</ul> 
	</dd>
	<dd>
		<div class="title">
			<span><img src="<%=basePath %>images/leftico01.png" /></span>预约单管理
		</div>
		<ul class="menuson">
			<li><cite></cite><a href="user.do?method=selYy">查看用户预约单信息</a><i></i></li>
		</ul> 
	</dd>
	
	<!-- 一个模块开始 -->
	<!-- 一个模块结束 -->
</dl>

<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
$(function(){	
	//导航切换
	$(".menuson li").click(function(){
		$(".menuson li.active").removeClass("active")
		$(this).addClass("active");
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
})	
</script>
</body>
</html>
