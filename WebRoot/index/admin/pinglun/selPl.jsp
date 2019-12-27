<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
</head>
		<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
		String date = request.getParameter("date");
		date = date == null?"":date;
		
		String account = request.getParameter("account");
		account = account == null?"":account;
		%>

<body>
<form action="shangpin.do?method=selPl" method="post" rel="page">
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">发布信息管理</a></li>
		<li><a href="#">查看用户发布信息</a></li>
	</ul>
</div>

<div class="formbody">
	<div class="formtitle" style="cursor: pointer;" id="formtitle"><span>条件查询</span></div>
	<ul class="forminfo" style="display: none;" id="forminfo">
		<li>
			<label>发布时间</label>
			<input name="date"  value="<%=date %>" type="text" class="dfinput required date " placeholder="请选择发布时间" />
		</li>
		<li>
			<label>发布人</label>
			<input name="account"  value="<%=account %>" type="text" class="dfinput required " placeholder="请选择一个发布人" />
		</li>
		<li>
			<label>&nbsp;</label>
			<input name="" type="submit" class="btn" value="确认" />
		</li>
	</ul>
</div>

		<table class="imgtable"border = "5" >
			<thead>
			<tr>
				<th>id</th>
				<th>发布人</th>
				<th>发布时间</th>
				<th>新成果</th>
				<th>新技术</th>
				<th>新材料</th>
				<th>新方法</th>
				<th>审核状态</th>
				<th>操作</th>
			</tr>
			</thead>
			<tbody>
			<c:if test="${!empty list}">
			<c:forEach items="${list}" var="list" varStatus="vs">
			<tr>
				<td>${vs.index+1}</td>
				<td>${list.account}</td>
				<td>${list.date}</td>
				<td>${list.cg}</td>
				<td>${list.jishu}</td>
				<td>${list.cailiao}</td>
				<td>${list.fangfa}</td>
				<td>
				<font color="red"><c:if test="${list.state==0}">未审核</c:if></font>
				<font color="green"><c:if test="${list.state==1}">已审核</c:if></font>
				</td>
				<td>
				
					<a href = "shangpin.do?method=xianshiPl&id=${list.id}" onclick="toshang()"><font color="blue">通过审核</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<a href = "shangpin.do?method=deletePl&id=${list.id}" onclick="toshan()"><font color="blue">删除</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					
				</td>
				<%--<td><font color="red">${list.number}</font>
				<p><font size = "5" color = "red" ><%=message %></font></p>
				</td>
				
			--%></tr>
			</c:forEach>
		</c:if>
		<c:if test="${empty list}">
			<tr>
				<td colspan="8" align="center">
					<strong><font color="red">暂时没有发布信息，请重新输入</font></strong>
				</td>
			</tr>
		</c:if>
			
		</tbody>
		</table>
		<div class="rightinfo">
	<div class="tools">
		<ul class="toolbar">
		</ul>
		</div>
</div>
<jsp:include page="/plugins/page/page.jsp"></jsp:include>
</form>
	
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	 function toshang(){
			alert("审核成功！！！");
	}
	 function toshan(){
			alert("删除成功！！！");
	}
	function toUpdate(){
		var id = $("input[name='id']:checked").val();
		if(!id){
			alert("请选择要操作的记录");
			return false;
		}else{
			alert( "您操作的值为："+$("input[name='id']:checked").val())
		}
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript">
	$(function(){
		$('.imgtable tbody tr:odd').addClass('odd');
	});
    
</script>

</body>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script>
</html>

