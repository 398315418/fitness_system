<%@ page language="java" import="java.util.*" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%>
<%
	String path = request.getContextPath() + "/";
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path;
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<base href="<%=basePath%>"/>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>无标题文档</title>
	<link href="<%=basePath %>css/style.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="resource/commons/utils.js"></script>
</head>
			<%
			List<Map<String, String>> list = (List<Map<String, String>>)request.getAttribute("list");
			%>
<body>
<div class="place">
	<span>位置：</span>
	<ul class="placeul">
		<li><a href="#">教练管理</a></li>
		<li><a href="#">修改教练信息</a></li>
	</ul>
</div>
<form action = "shangpin.do?method=updateQc" method = "post" enctype = "multipart/form-data"  class="validate" onsubmit="return add();" >
	<input name="id" id="xilie"  type="hidden" value="<%=list.get(0).get("id")%>" class="dfinput required" />
	<div class="formbody">
		<div class="formtitle"><span>修改教练信息</span></div>
		<ul class="forminfo">
		<li>
				<label>姓名</label>
				<input name="weizhi" id="xilie" value="<%=list.get(0).get("hairTeacherName")%>" type="text" class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>年龄</label>
				<input name="chushui" id="xilie" value="<%=list.get(0).get("age")%>"  type="text" class="dfinput required" /><font color="red">*</font>
			</li>
			
			<li>
				<label>电话</label>
				<input name="mianji" id="xilie" value="<%=list.get(0).get("phone")%>" type="text" class="dfinput required" /><font color="red">*</font>
			</li>
			<li>
				<label>家庭住址</label>
				<input name="zuowu" id="xilie" value="<%=list.get(0).get("address")%>" type="text" class="dfinput required" /><font color="red">*</font>
			</li>
			<li>
				<label>工作年限</label>
				<input name="type" id="xilie" value="<%=list.get(0).get("level")%>" type="text" class="dfinput required" />（年）<font color="red">*</font>
			</li>
			<li>
				<label>描述</label>
				<textarea name="dimao" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" ></textarea><font color="red">*</font>
			</li>
			<li>
				<label>图片</label>
				<input name="photo" id="photo" type="file" onchange="preview(this,'preview','imghead',150,100)"/><font color="red">*</font>
				<div id="preview">
					<img id="imghead" width="150" height="200" src = "<%=basePath %>image/<%=list.get(0).get("photo") %>" />
				</div>
			</li>
			
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认"/>
				<a href="index/admin/qicai/addQc.jsp"><input type="button" class="btn" value="重置"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("修改成功！！！");
	}
	$(function(){
		$('.tablelist tbody tr:odd').addClass('odd');
		
		$("#formtitle").click(function(){
			$("#forminfo").slideToggle("slow");
		});
	});
</script>
<script type="text/javascript" src="<%=basePath %>plugins/jQuery/jquery.js"></script>
<script type="text/javascript" src="<%=basePath %>js/validate.js"></script>
<script type="text/javascript" src="<%=path %>plugins/imagePreview/imagePreview.js"></script>
<script type="text/javascript" src="<%=path%>plugins/My97DatePicker/WdatePicker.js"></script> 
</body>
</html>
	