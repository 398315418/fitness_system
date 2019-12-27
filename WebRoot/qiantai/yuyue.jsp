<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>

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
		
		String account = (String)session.getAttribute("account");
		account = account == null?"":account;
		String id = (String)session.getAttribute("id");
		id = id == null?"":id;
		%>
<body>
<!--header-->
<!--container-->
<div id="container" class="container clearfix">
  <form action = "web.do?method=addPl" method = "post" class="validate" onsubmit="return add();" >
     <input type="hidden" name="id" value="<%=id %>">
    <div class="aligin">
        <div class="filterbox">	
        	<div class="h3"><span>填写预约单信息</span></div>
            <div class="filterbody">
            	 <ul>
            	  <li class="clearfix">
                        <span>预约人:</span>
                        <input type="text" name="account" value="<%=account %>"><font color="red" ></font>
                    </li><br>
                    <li class="clearfix">
                        <span>预约课程:</span>
                        <input type="text" name="yuyue" value="<%=list.get(0).get("fname") %>"><font color="red" ></font>
                    </li><br>
                    <li class="clearfix">
                        <span>教练姓名:</span> 
                        
                        <select class="dfinput" name="fname">
                       	 <option value="">请选择一个教练</option>
                        <%
						for(Map<String,String> map : list1){
						%>
					<option value="<%=map.get("hairTeacherName")%>">
						<%=map.get("hairTeacherName")%>
					</option>
					<%	
				}
				%>
                        </select>
                    </li><br>
                     <li class="clearfix">
                        <span>预约时间:</span>
                        <input type="text" name="date" class="dfinput required date" dateFmt="yyyy-MM-dd HH:mm">
                    </li><br>
                     <li class="clearfix">
                        <span></span>
                        <input type="submit" value="确认预约" >&nbsp;&nbsp;&nbsp;&nbsp;
                        <input type="button" onclick="toClose();" value="取消">
                    </li>
            	</ul>
            </div>
        </div>
    </div>
  </form>	
</div>
</body>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("预约成功！！！");
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
