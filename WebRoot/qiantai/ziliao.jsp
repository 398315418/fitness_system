<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
			String sname = request.getParameter("sname");
			sname = sname == null?"":sname;
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
             <c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
            	<span id="name"> 昵称:${list.userName}   
            	</span>&nbsp;&nbsp;&nbsp;
                <br>
                <br>
            性别：<span style="background-color:#E6E6E6; color:#000000;">${list.sex}</span>
                <br>
                <br>
                邮箱：<span style="background-color:#E6E6E6; color:#000000;">${list.email}</span>
                <br>
                <br>
        手机号：<span style="background-color:#E6E6E6; color:#000000;">${list.phone}</span>
                <br>
                <br>
               地址：<span style="background-color:#E6E6E6; color:#000000;">${list.address}</span>
                <br>
                <br>
            </c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center">
					<strong><font color="red" size="5">暂时还没有信息，请完善个人信息!!!</font></strong>
				</td>
			</tr>
		</c:if>
 	<input name="" type="button" onclick="toClose();" class="btn" value="返回"/>
            </div>
         </div>
        
</body>

</html>
