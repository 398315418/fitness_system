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
<title>智能健身管理系统 </title>
<link href="css/reset.css" rel="stylesheet" type="text/css" media="all" >
<link href="css/common.css" rel="stylesheet" type="text/css" media="all" >
<link href="css/public.css" rel="stylesheet" type="text/css" media="all" >
<link href="css/home.css" rel="stylesheet" type="text/css" media="all" >
<!-- 引入JQuery支持的库 -->
    <script language="JavaScript" src="resource/admin/js/jquery.js"></script>
    <!-- 引入artDailog支持的库 -->
    <link rel="stylesheet" href="resource/admin/artDialog/css/ui-dialog.css">
    <script language="JavaScript" src="resource/admin/artDialog/dist/dialog-plus.js"></script>
<script type="text/javascript">
		function showSp(id){
          var d = top.dialog({
                width:800,
                height:330,
                url:'user.do?method=showSp&id='+id,//可以是一个访问路径Action|Servlet等或者jsp页面资源
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

<%
		String account = (String)session.getAttribute("account");
		account = account == null?"":account;
		String id = (String)session.getAttribute("id");
		id = id == null?"":id;
		String weizhi = (String)session.getAttribute("weizhi");
		weizhi = weizhi == null?"":weizhi;
	%>
<body>
<!--header-->
<div id="header">
  <div class=" float_left">
  <a href="index.jsp"><br/><br/><br/><br/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  <font color="white" size="6" >智能健身管理系统 </font></a>
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
    	 	 <li><a href="user.do?method=selCz"><font color="blue">课程专区</font></a></li>
    	 	  <li><a href="user.do?method=selSp"><font color="blue">器械专区</font></a></li>
            
            
                </ul>
            </div>
        </div>
    
    </div>
    <%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
		%>
    <!--right-->
    <form action="user.do?method=selSp" method="post" rel="page">
    <div class="right">
    	<div class="filterbox">	
        	<div class="h3"><span>高级筛选</span></div>
            <div class="filterbody">
            	<ul>
		             <li>&nbsp;
					<label></label>
					<input name="weizhi" id="xilie" value="<%=weizhi %>" type="text" class="dfinput required " />
					<input name="" type="submit" class="btn" value="查询"/>
					</li>
          		 </ul>
            </div>
        </div>
        <ul class="list">
        <c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
                     <li class="clearfix">
                    	<div class="face"><a href="javascript:void(0);" onclick="showSp('${list.id}');"><img src="<%=basePath %>image/${list.photo}" width="100%" height="100%"  alt=""/></a></div>
                        <div class="text">
                        	<a href="#">器械名称：${list.title} </a>
                            <p class="jj"><a href="javascript:void(0);" onclick="showSp('${list.id}');"><font color="red">查看详情</font></a></p>
                        </div>
                  	</li>
                  		</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center">
					<strong><font color="red" size="6">暂时没有器械信息，请重新输入!!!</font></strong>
				</td>
			</tr>
		</c:if>
        </ul>
    </div>	
  </form>
</div>

<div class="blank10"></div>
<!--footer-->
<div id="footer">智能健身管理系统 </div>
</body>
</html>
