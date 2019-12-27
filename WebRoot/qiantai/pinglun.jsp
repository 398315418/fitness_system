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
<body>
<!--container-->
<div id="container" class="container clearfix">
	<!--left-->
    <!--right-->
         <div class="filterbox">	
            <div class="filterbody">
            <div class="h3"><span>添加预约单</span></div>
            <br/>
            	 <form action = "web.do?method=addPl" method = "post" class="validate" onsubmit="return add();" >
                	<ul>
                    <li class="clearfix">
                        <span class="on">新成果：</span>
                        <input type="text" name="cg">
                    </li>
                    <br/>
                    <li class="clearfix">
                        <span class="on">新技术：</span>
                        <input type="text" name="jishu">
                    </li> <br/>
                    <li class="clearfix">
                        <span class="on">新材料：</span>
                        <input type="text" name="cailiao">
                    </li> <br/>
                    <li class="clearfix">
                        <span class="on">新方法：</span>
                        <input type="text" name="fangfa">
                    </li> <br/>
                    <input type="submit"  value="确定">&nbsp;&nbsp;&nbsp;
                      <input type="button" onclick="toClose();" value="取消">
               </ul>
                </form>
            	
            </div>            
        </div> 
        
        
    </div>	
</body>
</html>
