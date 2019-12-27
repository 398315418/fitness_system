<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>index</title>
<link href="images/index.css" rel="stylesheet" type="text/css">
</head>

<body>

<div align="center">
    <div id="head">
    	<div id="head_left" align="left"> 
        	用人网<br>
            Hire network
        </div>
     	<div id="head_right">
        	<div id="head_right_login">
        		&nbsp;&nbsp;<a href="login.jsp">登陆</a>&nbsp;&nbsp;|
                &nbsp;&nbsp;<a href="reg.jsp">注册</a>&nbsp;&nbsp;
            </div>
        </div>
    </div>




    <div id="center">
    	<div id="center_top">
        	<div id="center_top_left" align="left">
            	<ul>
                	<a href="#"><li>帮助</li></a>
                    <a href="#"><li>黑名单</li></a>
                    <a href="#"><li>预约下单</li></a>
                    <a href="#"><li>背景调查</li></a>
                    <a href="#"><li>投诉</li></a>
                </ul>
            </div>
            <div id="center_top_right">
            	<img src="images/index.jpg" height="400px" width="700px">
            </div>
        </div>
    	<div id="center_low">
        	<ul>
                	<a href="#"><li>水泥工</li></a>
                    <a href="#"><li>电工</li></a>
                    <a href="#"><li>木工</li></a>
                    <a href="#"><li>瓦工</li></a>
                    <a href="#"><li>钳工</li></a>
            </ul>
        </div>
    </div>




	<div id="floor">
    	<div id="floor_text">长春 龙桥集团 pic2347168s</div>
    </div>
</div>


</body>
</html>
