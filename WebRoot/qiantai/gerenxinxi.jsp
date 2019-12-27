<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<%
		List<Map<String,String>> list = (List<Map<String,String>> )request.getAttribute("list");
			String total;		
			if(list==null){
				 total="0";
			}else{
				 total=list.get(0).get("");
			}
			List<Map<String,String>> list1 = (List<Map<String,String>> )request.getAttribute("list1");
			String yshui;		
			if(list1==null){
				yshui="0";
			}else{
				yshui=list1.get(0).get("");
			}
	
	
		String account = (String)session.getAttribute("account");
		account = account == null?"":account;
		String id = (String)session.getAttribute("id");
		id = id == null?"":id;
		String bianhao = (String)session.getAttribute("bianhao");
		bianhao = bianhao == null?"":bianhao;
	%>
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
		function selGr(id){
          var d = top.dialog({
                width:300,
                height:200,
                url:'web.do?method=selGr&id='+id,//可以是一个访问路径Action|Servlet等或者jsp页面资源
                onclose: function () {
                if (this.returnValue="success") {
                    window.location.href= window.location.href;
                }
            }
          });
           d.showModal();
        }
		
        function selYy(id){
          var d = top.dialog({
                width:1000,
                height:500,
                url:'web.do?method=selYy&id='+id,//可以是一个访问路径Action|Servlet等或者jsp页面资源
                onclose: function () {
                if (this.returnValue="success") {
                    window.location.href= window.location.href;
                }
            }
          });
           d.showModal();
        }
        
	</script>
</head>
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
          <div class="info">hi&nbsp;<font color="red" size="5"><%=account %></font>&nbsp;&nbsp;&nbsp;<a href="web.do?method=selYe&bianhao=<%=bianhao %>">个人信息</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="login.jsp">登录</a>&nbsp;&nbsp;&nbsp;&nbsp;<a href="Userlogin.do?method=UserZx">退出</a></div>
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
    	 	 <li><a href="user.do?method=selCz"><font color="blue">课程专区</font></a></li>
    	 	  <li><a href="user.do?method=selSp"><font color="blue">器械专区</font></a></li>
            
            
                </ul>
            </div>
        </div>
    </div>
    <!--right-->
    <div class="right">
    	 <div class="filterbox">	
            <div class="h3"><span>我的信息</span></div>
         </div>
         <div id="one_top1">
        
         <a href="javascript:void(0);" onclick="selGr('<%=id %>');"><div class="one_top_left1" align="center">
            	<div class="one_top_left1_top1"><img src="images/head.jpg" width="80" height="75"/></div>
                <div class="one_top_left1_footer1">个人信息</div>
            </div></a><%--
             <a href="#"> <div class="one_top_left1" align="center">
            	<div class="one_top_left1_top"><font color="red" size="4">password</font></div>
                <div class="one_top_left1_footer">修改密码</div>
            </div></a>
             --%><%--<a href="#"> <div class="one_top_left1" align="center">
            	<div class="one_top_left1_top"><font color="black" size="3">费用</font>&nbsp;&nbsp;&nbsp;&nbsp;
            <font color="red" size="3">￥<%=total=total== null?"0":total %></font><br/><br/><br/>
            	<font color="black" size="3">用水量</font>&nbsp;&nbsp;&nbsp;&nbsp;
            	<font color="red" size="3"><%=yshui=yshui== null?"0":yshui %>（L）</font>
            	</div>
                
            </div></a>
           
            --%>
            <a href="javascript:void(0);" onclick="selYy('<%=id %>');"><div class="one_top_left1" align="center">
            	<div class="one_top_left1_top"><br /><br /><br /><font color="black" size="4">我的预约单</font></div>
            </div></a>
           
             
         </div>
     
          <form action = "web.do?method=updatePassword" method = "post"   class="validate" onsubmit="return add();" >
          <div class="filterbox">	
        	<div class="h3"><span>登陆密码设置</span></div>
            <div class="filterbody">
            <input type="hidden" name="id" value="<%=id %>">
            	<ul>
                    <li class="clearfix">
                        <span class="on">新密码：</span>
                        <input type="password" name="password">
                    </li>
                     <li class="clearfix">
                        <span class="on"></span>
                        <input type="submit" value="确认修改"   onclick="toUpdate();" style="background-color:#FF0000; color:#FFFFFF;">
                    </li>
            	</ul>
            </div>
    	 </div>
         </form>
        
    </div>	
</div>
<div class="blank10"></div>
<!--footer-->
<div id="footers">智能健身管理系统</div>
</body>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("保存成功！！！");
	}
	function toUpdate(){
			alert("修改成功！！！");
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
</html>
