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
<link href="css/oneshow.css" rel="stylesheet" type="text/css">
	<!-- 引入JQuery支持的库 -->
    <script language="JavaScript" src="resource/admin/js/jquery.js"></script>
    <!-- 引入artDailog支持的库 -->
    <link rel="stylesheet" href="resource/admin/artDialog/css/ui-dialog.css">
    <script language="JavaScript" src="resource/admin/artDialog/dist/dialog-plus.js"></script>
<script type="text/javascript">
	function toClose(){
        	var dialog = top.dialog.get(window);
        	dialog.close();
        	dialog.remove();
        	return false;
        }
       
    </script>
</head>
 		<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
 			List<Map<String, String>> list1 = (List<Map<String, String>>)request.getAttribute("list1");	
		%>
<body>
<!--header-->
<div class="blank10"></div>
<!--container-->
<div id="container" class="container clearfix">
	<!--left-->
    </div>
    <!--right-->
    <div class="right">
         <div id="one_top">
         	<div id="one_top_left"><img src="<%=basePath %>image/<%=list.get(0).get("photo") %>" width="130" height="150"  alt=""/></div>
            <div id="one_top_right">
            	<span id="name">姓名:<%=list.get(0).get("hairTeacherName") %> </span>&nbsp;&nbsp;&nbsp;
                   
                <br>
                <br>
                 <img src="images/ri.jpg">教练信息
                <img src="images/ri.jpg">数据验证		
                <img src="images/ri.jpg">可以预约		
                <br>
                <br>
             年龄：<span style="background-color:#E6E6E6; color:#000000;"><%=list.get(0).get("age") %></span>
                <br>
                <br>
             电话：<span style="background-color:#E6E6E6; color:#000000;"><%=list.get(0).get("phone") %></span>
                <br>
                <br>
                家庭住址：<span style="background-color:#E6E6E6; color:#000000;"><%=list.get(0).get("address") %></span>
                <br>
                <br>
        工作年限：<span style="background-color:#E6E6E6; color:#000000;"><%=list.get(0).get("level") %>年</span>
                <br>
                <br>
             描述：<span style="background-color:#E6E6E6; color:#000000;"><%=list.get(0).get("hairTeacherInfo") %></span>
                <br>
                <br>
 	<input name="" type="button" onclick="toClose();" class="btn" value="确定"/>
            </div>
         </div>
        
        </div> 
</body>
</html>
