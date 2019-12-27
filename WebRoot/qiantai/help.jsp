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
		String account = (String)session.getAttribute("account");
		account = account == null?"":account;
		String id = (String)session.getAttribute("id");
		id = id == null?"":id;
		String bianhao = (String)session.getAttribute("bianhao");
		bianhao = bianhao == null?"":bianhao;
	%>
<body>
<!--header-->
<div id="header">
    <div class=" float_left">
  <a href="index.jsp"><br/><br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font color="white" size="6" >智能健身管理系统</font></a>
  </div>
  <div class="rinfo float_right">
  		<div class="tel">
        	<div class="float_right r">88888888</div>
        	<div class="float_right l">
            	<p class="a">服务电话</p>
                <p class="b">0431-</p>
            </div>
        </div>
         <div class="info">hi&nbsp;<font color="red" size="5"><%=account %></font>&nbsp;&nbsp;&nbsp;<a href="gerenxinxi.jsp">个人信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.jsp">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Userlogin.do?method=UserZx">退出</a></div>
  </div>
</div>
<div class="blank10"></div>
<!--container-->
<div id="container" class="container clearfix">
	<!--left-->
    <div class="left">
    	<div class="leftbody">
   			<div class="h3">快捷服务</div>     	
        	<div class="leftmenu">
            	<ul>
              <li ><a href="help.jsp"><font color="blue">帮助</font></a></li>
    		 <li><a href="user.do?method=selQc"><font color="blue">教练专区</font></a></li>
    	 	 <li><a href="user.do?method=selCz"><font color="blue">服务项目专区</font></a></li>
    	 	  <li><a href="user.do?method=selSp"><font color="blue">活动公告专区</font></a></li>
            
            
                </ul>
            </div>
        </div>
    </div>
    <!--right-->
    <div class="right">
    	<div class="filterbox">	
        	<div class="h3"><span>帮助</span></div>
            <div class="filterbody">
            	登陆上的用户，才能查看个人信息，<br/><br/><br>对于您的预约订单信息，我们会及时的处理，<br/><br/><br>关于本店的活动公告，请您及时注意，以免错过机会，机不可失失不再来

           请您注意查看。
              
              <br/>
              
               <br/> <br/> <br/> <br/> <br/> <br/> <br/>
              
              <br/> <br/> <br/> <br/> <br/> <br/> <br/>
              
              
              
            </div>
        </div>
       
    </div>	
</div>
<div class="blank10"></div>
<!--footer-->
<div id="footer">智能健身管理系统</div>
</body>
</html>
