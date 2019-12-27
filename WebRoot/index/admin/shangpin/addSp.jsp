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
		<li><a href="#">器械管理</a></li>
		<li><a href="#">添加活器械信息</a></li>
	</ul>
</div>
<form action = "shangpin.do?method=addSp" method = "post"  enctype = "multipart/form-data" class="validate" onsubmit="return add();" >
	<div class="formbody">
		<div class="formtitle"><span>添加器械信息</span></div>
		<ul class="forminfo">
			<li>
				<label>器械名称</label>
				<input name="weizhi" id="xilie"  type="text" class="dfinput required" /><font color="red">*</font>必填
			</li>
			<li>
				<label>内容</label>
				<textarea name="qiwen" id="editor_id" cols="100" rows="8" style="width:400px;height:100px" class="dfinput required" ></textarea><font color="red">*</font>
			</li>
			<li>
				<label>品牌</label>
				<input name="date" id="xilie"  type="text" class="dfinput required " /><font color="red">*</font>
			</li>
				<li>
				<label>图片</label>
				<input name="rizhao" id="photo" type="file" onchange="preview(this,'preview','imghead',150,100)"/><font color="red">*</font>
				<div id="preview">
					<img id="imghead" width="100" height="150" />
				</div>
			</li>
			
			<li>
				<label>&nbsp;</label>
					<input type="submit" class="btn" onclick="toAdd();" value="确认"/>
				<a href="index/admin/shangpin/addSp.jsp"><input type="button" class="btn" value="重置"/></a>
			</li>
		</ul>
	</div>
</form>
<script type="text/javascript">
	/**
	 * 这个使用的单选框选择判断
	 */
	function toAdd(){
			alert("添加成功！！！");
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
	